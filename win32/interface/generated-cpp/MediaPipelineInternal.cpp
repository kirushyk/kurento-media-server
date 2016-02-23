/* Autogenerated with kurento-module-creator */

#include <iostream>
#include "MediaPipelineInternal.hpp"
#include <KurentoException.hpp>
#include <jsonrpc/JsonSerializer.hpp>
#include "GstreamerDotDetails.hpp"

namespace kurento
{

std::string MediaPipelineMethodGetGstreamerDot::invoke (std::shared_ptr<MediaPipeline> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method MediaPipeline::getGstreamerDot");
  }

  if (!__isSetDetails) {
    return obj->getGstreamerDot ();
  }

  return obj->getGstreamerDot (details);
}

void MediaPipelineMethodGetGstreamerDot::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
    if (__isSetDetails) {
      s.SerializeNVP (details);
    }

  } else {
    if (!s.JsonValue.isNull () && !s.JsonValue.isObject ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

    if (s.JsonValue.isMember ("details") ) {
      if (s.JsonValue["details"].isConvertibleTo (Json::ValueType::stringValue) ) {
        __isSetDetails = true;
        s.SerializeNVP (details);
      } else {
        throw KurentoException (MARSHALL_ERROR,
                                "'details' parameter should be a string");
      }
    }

  }
}

void MediaPipelineConstructor::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
  } else {
    if (!s.JsonValue.isNull () && !s.JsonValue.isObject ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'constructorParams' should be an object");
    }

  }
}

} /* kurento */
