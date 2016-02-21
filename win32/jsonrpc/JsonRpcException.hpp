/*
 * (C) Copyright 2014 Kurento (http://kurento.org/)
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

#ifndef __JSONRPC_EXCEPTION_HPP__
#define __JSONRPC_EXCEPTION_HPP__

#include <json/json.h>

namespace kurento
{
namespace JsonRpc
{

namespace ErrorCode
{
static const int PARSE_ERROR = -32700;
static const int INVALID_REQUEST = -32600;
static const int METHOD_NOT_FOUND = -32601;
static const int INVALID_PARAMS = -32602;
static const int INTERNAL_ERROR = -32603;
static const int SERVER_ERROR_INIT = -32000;
static const int SERVER_ERROR_END = -32099;
}

class CallException
{

public:
  CallException (int code, const std::string &message,
                 const Json::Value &data = Json::Value::null) {
    this->code = code;
    this->message = message;
    this->data = data;

    if (data.isNull () ) {
      std::string errorType;

      if (code == ErrorCode::PARSE_ERROR) {
        errorType = "PARSE_ERROR";
      } else if (code == ErrorCode::INVALID_REQUEST) {
        errorType = "INVALID_REQUEST";
      } else if (code == ErrorCode::METHOD_NOT_FOUND) {
        errorType = "METHOD_NOT_FOUND";
      } else if (code == ErrorCode::INVALID_PARAMS) {
        errorType = "INVALID_PARAMS";
      } else if (code == ErrorCode::INTERNAL_ERROR) {
        errorType = "INTERNAL_ERROR";
      }

      if (!errorType.empty() ) {
        this->data["type"] = errorType;
      }
    }
  }

  int getCode() {
    return code;
  }

  std::string getMessage() {
    return message;
  }

  Json::Value getData() {
    return data;
  }

private:
  int code;
  std::string message;
  Json::Value data;
};

} /* JsonRpc */
} /* kurento */

#endif /* __JSONRPC_EXCEPTION_H__ */
