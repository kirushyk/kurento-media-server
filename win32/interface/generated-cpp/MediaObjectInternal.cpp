/* Autogenerated with kurento-module-creator */

#include <iostream>
#include "MediaObjectInternal.hpp"
#include <KurentoException.hpp>
#include <jsonrpc/JsonSerializer.hpp>
#include "Tag.hpp"
#include "MediaPipeline.hpp"
#include "MediaObject.hpp"

namespace kurento
{

void MediaObjectMethodAddTag::invoke (std::shared_ptr<MediaObject> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method MediaObject::addTag");
  }

  return obj->addTag (key, value);
}

void MediaObjectMethodAddTag::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
    s.SerializeNVP (key);

    s.SerializeNVP (value);

  } else {
    if (s.JsonValue.isNull ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' is required");
    } else if (!s.JsonValue.isObject ()){
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

    if (!s.JsonValue.isMember ("key") || !s.JsonValue["key"].isConvertibleTo (Json::ValueType::stringValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'key' parameter should be a string");
    }

    s.SerializeNVP (key);

    if (!s.JsonValue.isMember ("value") || !s.JsonValue["value"].isConvertibleTo (Json::ValueType::stringValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'value' parameter should be a string");
    }

    s.SerializeNVP (value);

  }
}

void MediaObjectMethodRemoveTag::invoke (std::shared_ptr<MediaObject> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method MediaObject::removeTag");
  }

  return obj->removeTag (key);
}

void MediaObjectMethodRemoveTag::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
    s.SerializeNVP (key);

  } else {
    if (s.JsonValue.isNull ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' is required");
    } else if (!s.JsonValue.isObject ()){
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

    if (!s.JsonValue.isMember ("key") || !s.JsonValue["key"].isConvertibleTo (Json::ValueType::stringValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'key' parameter should be a string");
    }

    s.SerializeNVP (key);

  }
}

std::string MediaObjectMethodGetTag::invoke (std::shared_ptr<MediaObject> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method MediaObject::getTag");
  }

  return obj->getTag (key);
}

void MediaObjectMethodGetTag::Serialize (kurento::JsonSerializer &s)
{
  if (s.IsWriter) {
    s.SerializeNVP (key);

  } else {
    if (s.JsonValue.isNull ()) {
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' is required");
    } else if (!s.JsonValue.isObject ()){
      throw KurentoException (MARSHALL_ERROR,
                              "'operationParams' should be an object");
    }

    if (!s.JsonValue.isMember ("key") || !s.JsonValue["key"].isConvertibleTo (Json::ValueType::stringValue) ) {
      throw KurentoException (MARSHALL_ERROR,
                              "'key' parameter should be a string");
    }

    s.SerializeNVP (key);

  }
}

std::vector<std::shared_ptr<Tag>> MediaObjectMethodGetTags::invoke (std::shared_ptr<MediaObject> obj)
{
  if (!obj) {
    throw KurentoException (MEDIA_OBJECT_NOT_FOUND, "Invalid object while invoking method MediaObject::getTags");
  }

  return obj->getTags ();
}

void MediaObjectMethodGetTags::Serialize (kurento::JsonSerializer &s)
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
