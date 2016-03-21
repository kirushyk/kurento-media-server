CXX=i686-w64-mingw32-g++
CC=i686-w64-mingw32-gcc
WINDRES=i686-w64-mingw32-windres
TARGET_DIR=./build/
TARGET=kurento-media-server.exe

CXXFLAGS=--std=gnu++17 -fpermissive

CFLAGS= \
-DBOOST_LOG_DYN_LINK=1 \
-DBOOST_LOG_USE_NATIVE_SYSLOG \
-DWIN32_LEAN_AND_MEAN=1 \
-DPACKAGE="\"kurento-media-server\"" \
-DVERSION="\"6.4.1.6\"" \
-DPROJECT_VERSION="\"6.4.1.6\"" \
-Dushort="unsigned short" \
-Duint="unsigned" \
-mms-bitfields \
\
-I. \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/gstreamer-1.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/gstreamer-1.0/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glibmm-2.4 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glibmm-2.4/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include \
-I/usr/i686-w64-mingw32/sys-root/mingw/include/sigc++-2.0 \
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/sigc++-2.0/include \
-I../kms-jsonrpc/src/ \
-I../kms-jsonrpc/src/jsonrpc/ \
-I../jsoncpp/include/ \
-I../kurento-media-server/server/transport/ \
-I../libevent/include/ \
-I../libvpx/ \
-I./win32/ \
-I./server/ \
-I./server/transport/websocket/ \
-I./win32/ \
-I./win32/modules \
-I./win32/modules/core \
-I./win32/modules/elements \
-I./win32/modules/filters \
-I./win32/jsonrpc \
-I./win32/webrtcendpoint \
-I./win32/commons \
-I./win32/commons/sdpagent \
-I./win32/interface/generated-cpp \
-I./win32/implementation/generated-cpp

LIBS= \
-L/usr/i686-w64-mingw32/sys-root/mingw/lib \
-L/usr/lib/gcc/i686-w64-mingw32/5.2.0 \
-L/usr/i686-w64-mingw32/lib/ \
-L../kms-jsonrpc/build/ \
-L../jsoncpp/build/ \
-L../kms-core/build/ \
-lkmsjsoncpp.dll \
-lkmsjsonrpc.dll \
-lkmscoreimpl.dll \
-lkmsgstcommons.dll \
-lkmssdpagent.dll \
-lgstreamer-1.0 \
-lgstsdp-1.0.dll \
-lglibmm-2.4 \
-lgobject-2.0 \
-lglib-2.0 \
-lintl \
-lsigc-2.0 \
-lws2_32 \
-lmswsock \
-lssl.dll \
-lcrypto.dll \
-lrpcrt4 \
-lole32 \
-lboost_system-mt \
-lboost_log-mt \
-lboost_log_setup-mt \
-lboost_program_options-mt \
-lboost_filesystem-mt \
-lboost_thread-mt

SRC= \
./server/CacheEntry.cpp \
./server/transport/TransportFactory.cpp \
./server/transport/websocket/WebSocketTransport.cpp \
./server/transport/websocket/WebSocketRegistrar.cpp \
./server/transport/websocket/WebSocketEventHandler.cpp \
./server/transport/websocket/WebSocketTransportFactory.cpp \
./server/death_handler.cpp \
./server/ResourceManager.cpp \
./server/version.cpp \
./server/RequestCache.cpp \
./server/loadConfig.cpp \
./server/logging.cpp \
./server/main.cpp \
./server/ServerMethods.cpp \
./server/modules.cpp

OBJS=$(SRC:.cpp=.o)

%.o: %.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) -o $@ $<

all: $(TARGET_DIR)/$(TARGET)

$(TARGET_DIR)/$(TARGET): $(OBJS) ./win32/kurento.rc
	mkdir -p $(TARGET_DIR)
	$(WINDRES) ./win32/kurento.rc $(TARGET_DIR)/kurento.o	
	$(CXX) -o $@ $(OBJS) $(LIBS) $(TARGET_DIR)/kurento.o

.PHONY: clean
clean:
	rm $(OBJS)
	rm $(TARGET_DIR)/$(TARGET)
