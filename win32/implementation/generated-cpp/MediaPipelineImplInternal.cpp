/* Autogenerated with kurento-module-creator */

#include <gst/gst.h>
#include "GstreamerDotDetails.hpp"
#include "MediaPipelineImpl.hpp"
#include "MediaPipelineImplFactory.hpp"
#include "MediaPipelineInternal.hpp"
#include <jsonrpc/JsonSerializer.hpp>
#include <KurentoException.hpp>

using kurento::KurentoException;

namespace kurento
{

MediaObjectImpl *MediaPipelineImplFactory::createObjectPointer (const boost::property_tree::ptree &conf, const Json::Value &params) const
{
  kurento::JsonSerializer s (false);
  MediaPipelineConstructor constructor;

  s.JsonValue = params;
  constructor.Serialize (s);

  return createObject (conf);
}

void
MediaPipelineImpl::invoke (std::shared_ptr<MediaObjectImpl> obj, const std::string &methodName, const Json::Value &params, Json::Value &response)
{
  if (methodName == "getGstreamerDot") {
    kurento::JsonSerializer s (false);
    MediaPipelineMethodGetGstreamerDot method;
    JsonSerializer responseSerializer (true);
    std::string ret;

    s.JsonValue = params;
    method.Serialize (s);

    ret = method.invoke (std::dynamic_pointer_cast<MediaPipeline> (obj) );
    responseSerializer.SerializeNVP (ret);
    response = responseSerializer.JsonValue["ret"];
    return;
  }

  if (methodName == "getLatencyStats") {
    bool ret;
    JsonSerializer responseSerializer (true);

    ret = std::dynamic_pointer_cast<MediaPipeline> (obj)->getLatencyStats ();
    responseSerializer.SerializeNVP (ret);
    response = responseSerializer.JsonValue["ret"];
    return;
  }

  if (methodName == "setLatencyStats") {
    kurento::JsonSerializer s (false);
    bool latencyStats;
    s.JsonValue = params;

    if (!s.JsonValue.isMember ("latencyStats") || !s.JsonValue["latencyStats"].isConvertibleTo (Json::ValueType::booleanValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'latencyStats' parameter should be a boolean");
    }

    if (!s.IsWriter) {
      s.SerializeNVP (latencyStats);
      std::dynamic_pointer_cast<MediaPipeline> (obj)->setLatencyStats (latencyStats);
    }
    return;
  }

  MediaObjectImpl::invoke (obj, methodName, params, response);
}

bool
MediaPipelineImpl::connect (const std::string &eventType, std::shared_ptr<EventHandler> handler)
{

  return MediaObjectImpl::connect (eventType, handler);
}

void
MediaPipelineImpl::Serialize (JsonSerializer &serializer)
{
  if (serializer.IsWriter) {
    try {
      Json::Value v (getId() );

      serializer.JsonValue = v;
    } catch (std::bad_cast &e) {
    }
  } else {
    throw KurentoException (MARSHALL_ERROR,
                            "'MediaPipelineImpl' cannot be deserialized as an object");
  }
}
} /* kurento */

namespace kurento
{

void
Serialize (std::shared_ptr<kurento::MediaPipelineImpl> &object, JsonSerializer &serializer)
{
  if (serializer.IsWriter) {
    if (object) {
      object->Serialize (serializer);
    }
  } else {
    std::shared_ptr<kurento::MediaObjectImpl> aux;
    aux = kurento::MediaPipelineImplFactory::getObject (JsonFixes::getString(serializer.JsonValue) );
    object = std::dynamic_pointer_cast<kurento::MediaPipelineImpl> (aux);
  }
}

void
Serialize (std::shared_ptr<kurento::MediaPipeline> &object, JsonSerializer &serializer)
{
  std::shared_ptr<kurento::MediaPipelineImpl> aux = std::dynamic_pointer_cast<kurento::MediaPipelineImpl> (object);

  Serialize (aux, serializer);
  object = std::dynamic_pointer_cast <kurento::MediaPipeline> (aux);
}

} /* kurento */