/* Autogenerated with kurento-module-creator */

#ifndef __VIDEO_CODEC_HPP__
#define __VIDEO_CODEC_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>


namespace kurento
{
class VideoCodec;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::VideoCodec> &object, JsonSerializer &s);
} /* kurento */

namespace kurento
{

class VideoCodec
{

public:

  typedef enum {
    VP8,
    H264,
    RAW
  } type;

  VideoCodec (const std::string &value) {
    enumValue = getValueFromString (value);
  };

  VideoCodec (type value) {
    this->enumValue = value;
  }

  type getValue () {
    return enumValue;
  };

  std::string getString () {

    if (enumValue ==  VP8) {
      return "VP8";
    }

    if (enumValue ==  H264) {
      return "H264";
    }

    if (enumValue ==  RAW) {
      return "RAW";
    }

    return "";
  }

  void Serialize (JsonSerializer &s);

  VideoCodec() {};

private:

  static type getValueFromString (const std::string &value);

  type enumValue;

  friend void kurento::Serialize (std::shared_ptr<kurento::VideoCodec> &object, JsonSerializer &s);

};

} /* kurento */

#endif /*  __VIDEO_CODEC_HPP__ */
