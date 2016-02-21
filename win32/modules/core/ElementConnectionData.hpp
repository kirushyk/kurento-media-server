/* Autogenerated with kurento-module-creator */

#ifndef __ELEMENT_CONNECTION_DATA_HPP__
#define __ELEMENT_CONNECTION_DATA_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>
#include <RegisterParent.hpp>


namespace kurento
{
class MediaElement;
class MediaType;
} /* kurento */

namespace kurento
{
class ElementConnectionData;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::ElementConnectionData> &object, JsonSerializer &s);
} /* kurento */

namespace kurento
{
class MediaElement;

class MediaElement;

class MediaType;



class ElementConnectionData : public RegisterParent 
{

public:

  ElementConnectionData (std::shared_ptr<MediaElement> source, std::shared_ptr<MediaElement> sink, std::shared_ptr<MediaType> type, const std::string &sourceDescription, const std::string &sinkDescription) {
    this->source = source;
    this->sink = sink;
    this->type = type;
    this->sourceDescription = sourceDescription;
    this->sinkDescription = sinkDescription;
  };

  void setSource (std::shared_ptr<MediaElement> source) {
    this->source = source;
  };

  std::shared_ptr<MediaElement> getSource () {
    return source;
  };

  void setSink (std::shared_ptr<MediaElement> sink) {
    this->sink = sink;
  };

  std::shared_ptr<MediaElement> getSink () {
    return sink;
  };

  void setType (std::shared_ptr<MediaType> type) {
    this->type = type;
  };

  std::shared_ptr<MediaType> getType () {
    return type;
  };

  void setSourceDescription (const std::string &sourceDescription) {
    this->sourceDescription = sourceDescription;
  };

  std::string getSourceDescription () {
    return sourceDescription;
  };

  void setSinkDescription (const std::string &sinkDescription) {
    this->sinkDescription = sinkDescription;
  };

  std::string getSinkDescription () {
    return sinkDescription;
  };

  virtual void Serialize (JsonSerializer &s);

  static void registerType () {
    std::function<RegisterParent*(void)> func =
        [] () {

      return new ElementConnectionData ();

    };

    RegisterParent::registerType ("kurento.ElementConnectionData", func);
  }

protected:

  ElementConnectionData() {};

private:

  std::shared_ptr<MediaElement> source;
  std::shared_ptr<MediaElement> sink;
  std::shared_ptr<MediaType> type;
  std::string sourceDescription;
  std::string sinkDescription;

  friend void kurento::Serialize (std::shared_ptr<kurento::ElementConnectionData> &object, JsonSerializer &s);

};

} /* kurento */

#endif /*  __ELEMENT_CONNECTION_DATA_HPP__ */
