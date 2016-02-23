/* Autogenerated with kurento-module-creator */

#include <iostream>
#include "UriEndpointInternal.hpp"
#include <KurentoException.hpp>
#include <jsonrpc/JsonSerializer.hpp>

namespace kurento
{

void UriEndpointMethodPause::invoke (std::shared_ptr<UriEndpoint> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method UriEndpoint::pause");
  }

  return obj->pause ();
}

void UriEndpointMethodPause::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
  } else {
    if (!s.JsonValue.isNull () && !s.JsonValue.isObject ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

  }
}

void UriEndpointMethodStop::invoke (std::shared_ptr<UriEndpoint> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method UriEndpoint::stop");
  }

  return obj->stop ();
}

void UriEndpointMethodStop::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
  } else {
    if (!s.JsonValue.isNull () && !s.JsonValue.isObject ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

  }
}

} /* kurento */
