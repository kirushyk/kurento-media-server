/* Autogenerated with kurento-module-creator */

#ifndef __MEDIA_LATENCY_STAT_HPP__
#define __MEDIA_LATENCY_STAT_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>
#include <RegisterParent.hpp>


namespace kurento
{
class MediaType;
} /* kurento */

namespace kurento
{
class MediaLatencyStat;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::MediaLatencyStat> &object, JsonSerializer &s);
} /* kurento */

namespace kurento
{
class MediaType;


class MediaLatencyStat : public RegisterParent 
{

public:

  MediaLatencyStat (const std::string &name, std::shared_ptr<MediaType> type, double avg) {
    this->name = name;
    this->type = type;
    this->avg = avg;
  };

  void setName (const std::string &name) {
    this->name = name;
  };

  std::string getName () {
    return name;
  };

  void setType (std::shared_ptr<MediaType> type) {
    this->type = type;
  };

  std::shared_ptr<MediaType> getType () {
    return type;
  };

  void setAvg (double avg) {
    this->avg = avg;
  };

  double getAvg () {
    return avg;
  };

  virtual void Serialize (JsonSerializer &s);

  static void registerType () {
    std::function<RegisterParent*(void)> func =
        [] () {

      return new MediaLatencyStat ();

    };

    RegisterParent::registerType ("kurento.MediaLatencyStat", func);
  }

protected:

  MediaLatencyStat() {};

private:

  std::string name;
  std::shared_ptr<MediaType> type;
  double avg;

  friend void kurento::Serialize (std::shared_ptr<kurento::MediaLatencyStat> &object, JsonSerializer &s);

};

} /* kurento */

#endif /*  __MEDIA_LATENCY_STAT_HPP__ */
