/*
 * (C) Copyright 2015 Kurento (http://kurento.org/)
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 */

#include "ResourceManager.hpp"
#include <gst/gst.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <sstream>
#include <KurentoException.hpp>
#include <MediaSet.hpp>

#ifdef __linux__
#include <sys/resource.h>
#elif defined(_WIN32)
#include <windows.h>
#include <tlhelp32.h>
#endif

#define GST_CAT_DEFAULT kurento_resource_manager
GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
#define GST_DEFAULT_NAME "KurentoResourceManager"

namespace kurento
{

static int maxOpenFiles = 0;
static int maxThreads = 0;

static void
tokenize (std::string str, char sep, std::vector<std::string> &tokens)
{
  size_t start = str.find_first_not_of (sep), end;

  while (start != std::string::npos) {
    end = str.find (sep, start);
    tokens.push_back (str.substr (start, end - start) );
    start = str.find_first_not_of (sep, end);
  }
}

static int
getNumberOfThreads ()
{
#ifdef __linux__
  std::string stat;
  std::ifstream stat_file ("/proc/self/stat");
  std::vector <std::string> tokens;

  std::getline (stat_file, stat);
  tokenize (stat, ' ', tokens);

  stat_file.close();

  return atoi (tokens[19].c_str() );
#elif defined (_WIN32)
  DWORD const id = GetCurrentProcessId ();
  HANDLE const snapshot = CreateToolhelp32Snapshot (TH32CS_SNAPALL, 0);
  PROCESSENTRY32 entry = { 0 };
  entry.dwSize = sizeof (entry);
  BOOL ret = true;
  ret = Process32First (snapshot, &entry);
  while (ret && entry.th32ProcessID != id)
  {
    ret = Process32Next (snapshot, &entry);
  }
  CloseHandle (snapshot);
  return ret ? entry.cntThreads : 0;
#else
#error Not implemented on this platform
#endif
}

static int
getMaxThreads ()
{
  if (maxThreads == 0) {
#ifdef __linux__
    struct rlimit limits;
    getrlimit (RLIMIT_NPROC, &limits);

    maxThreads = limits.rlim_cur;
#elif defined(_WIN32)
    maxThreads = 64;
#else
#error Not implemented on this platform
#endif
  }

  return maxThreads;
}

static void
checkThreads (float limit_percent)
{
  int nThreads;

  nThreads = getNumberOfThreads ();

  if (nThreads > getMaxThreads () * limit_percent ) {
    throw KurentoException (NOT_ENOUGH_RESOURCES, "Too many threads");
  }
}

static int
getMaxOpenFiles ()
{
  if (maxOpenFiles == 0) {
#ifdef __linux__
    struct rlimit limits;
    getrlimit (RLIMIT_NOFILE, &limits);

    maxOpenFiles = limits.rlim_cur;
#else
    maxOpenFiles = 64;
#endif
  }

  return maxOpenFiles;
}

static int
getNumberOfOpenFiles ()
{
  int openFiles = 0;
#ifdef __linux__
  DIR *d;
  struct dirent *dir;

  d = opendir ("/proc/self/fd");

  while ( (dir = readdir (d) ) != NULL) {
    openFiles ++;
  }

  closedir (d);
#endif

  return openFiles;
}

static void
checkOpenFiles (float limit_percent)
{
  int nOpenFiles;

  nOpenFiles = getNumberOfOpenFiles ();

  if (nOpenFiles > getMaxOpenFiles () * limit_percent ) {
    throw KurentoException (NOT_ENOUGH_RESOURCES, "Too many open files");
  }
}

void
checkResources (float limit_percent)
{
  checkThreads (limit_percent);
  checkOpenFiles (limit_percent);
}

void killServerOnLowResources (float limit_percent)
{
  MediaSet::getMediaSet()->signalEmptyLocked.connect ([limit_percent] () {
    GST_DEBUG ("MediaSet empty, checking resources");

    try {
      checkResources (limit_percent);
    } catch (KurentoException &e) {
      if (e.getCode() == NOT_ENOUGH_RESOURCES) {
        GST_ERROR ("Resources over the limit, server will be killed");
#ifdef __linux__
        kill ( getpid(), SIGTERM );
#else
        exit (0);
#endif
      }
    }
  });
}

} /* kurento */

static void init_debug (void) __attribute__ ( (constructor) );

static void
init_debug (void)
{
  GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, GST_DEFAULT_NAME, 0,
                           GST_DEFAULT_NAME);
}
