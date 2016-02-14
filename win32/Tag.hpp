/* Autogenerated with kurento-module-creator */

#ifndef __TAG_HPP__
#define __TAG_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>
#include <RegisterParent.hpp>


namespace kurento
{
class Tag;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::Tag> &object, JsonSerializer &s);
} /* kurento */

namespace kurento
{

class Tag : public RegisterParent 
{

public:

  Tag (const std::string &key, const std::string &value) {
    this->key = key;
    this->value = value;
  };

  void setKey (const std::string &key) {
    this->key = key;
  };

  std::string getKey () {
    return key;
  };

  void setValue (const std::string &value) {
    this->value = value;
  };

  std::string getValue () {
    return value;
  };

  virtual void Serialize (JsonSerializer &s);

  static void registerType () {
    std::function<RegisterParent*(void)> func =
        [] () {

      return new Tag ();

    };

    RegisterParent::registerType ("kurento.Tag", func);
  }

protected:

  Tag() {};

private:

  std::string key;
  std::string value;

  friend void kurento::Serialize (std::shared_ptr<kurento::Tag> &object, JsonSerializer &s);

};

} /* kurento */

#endif /*  __TAG_HPP__ */

