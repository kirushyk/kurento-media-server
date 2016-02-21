/* Autogenerated with kurento-module-creator */

#ifndef __FACE_OVERLAY_FILTER_HPP__
#define __FACE_OVERLAY_FILTER_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>
#include <vector>
#include "Filter.hpp"

namespace kurento
{
class FaceOverlayFilter;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::FaceOverlayFilter> &object, JsonSerializer &serializer);
}

namespace kurento
{
class MediaPipeline;
} /* kurento */

namespace kurento
{
class FaceOverlayFilter : public virtual Filter
{

public:
  FaceOverlayFilter () {};
  virtual ~FaceOverlayFilter () {};

  virtual void unsetOverlayedImage () = 0;
  virtual void setOverlayedImage (const std::string &uri, float offsetXPercent, float offsetYPercent, float widthPercent, float heightPercent) = 0;

  virtual std::string getType () const {
    return "FaceOverlayFilter";
  }

  virtual std::string getModule () const {
    return "kurento";
  }

  virtual void Serialize (JsonSerializer &serializer) = 0;

};

} /* kurento */

#endif /*  __FACE_OVERLAY_FILTER_HPP__ */
