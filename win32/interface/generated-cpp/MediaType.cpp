/* Autogenerated with kurento-module-creator */

#include "MediaType.hpp"
#include <jsonrpc/JsonSerializer.hpp>
#include <KurentoException.hpp>

namespace kurento
{

MediaType::type MediaType::getValueFromString (const std::string &value)
{

  if (value ==  "AUDIO") {
    return AUDIO;
  }

  if (value ==  "DATA") {
    return DATA;
  }

  if (value ==  "VIDEO") {
    return VIDEO;
  }

  throw KurentoException (MARSHALL_ERROR,
                          "Invalid value for 'MediaType'");

}

void MediaType::Serialize (JsonSerializer &s)
{
  if (s.IsWriter) {
    s.JsonValue = getString();
  } else {
    if (s.JsonValue.isConvertibleTo (Json::ValueType::stringValue) ) {
      enumValue = getValueFromString (s.JsonValue.asString() );
    } else {
      throw KurentoException (MARSHALL_ERROR,
                              "'MediaType' type should be a string");
    }
  }
}

} /* kurento */

namespace kurento
{

void
Serialize (std::shared_ptr<kurento::MediaType> &object, JsonSerializer &s)
{
  if (!s.IsWriter && !object) {
    object.reset (new kurento::MediaType() );
  }

  if (object) {
    object->Serialize (s);
  }
}

} /* kurento */