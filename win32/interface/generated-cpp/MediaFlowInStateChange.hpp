/* Autogenerated with kurento-module-creator */

#ifndef __MEDIA_FLOW_IN_STATE_CHANGE_HPP__
#define __MEDIA_FLOW_IN_STATE_CHANGE_HPP__

#include <json/json.h>
#include <memory>
#include "Media.hpp"

namespace kurento
{
class MediaFlowInStateChange;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::MediaFlowInStateChange> &object, JsonSerializer &s);
}


namespace kurento
{
class MediaFlowState;
class MediaType;
} /* kurento */

namespace kurento
{
class MediaFlowState;
class MediaType;

class MediaFlowInStateChange : public Media
{

public:

  MediaFlowInStateChange (std::shared_ptr<MediaObject> source, const std::string &type, std::shared_ptr<MediaFlowState> state, const std::string &padName, std::shared_ptr<MediaType> mediaType) : Media (source, type) {
      this->state = state;
      this->padName = padName;
      this->mediaType = mediaType;
  };

  MediaFlowInStateChange (const Json::Value &value);

  virtual void setState (std::shared_ptr<MediaFlowState> state) {
    this->state = state;
  };

  virtual std::shared_ptr<MediaFlowState> getState () {
    return state;
  };

  virtual void setPadName (const std::string &padName) {
    this->padName = padName;
  };

  virtual const std::string &getPadName () {
    return padName;
  };

  virtual void setMediaType (std::shared_ptr<MediaType> mediaType) {
    this->mediaType = mediaType;
  };

  virtual std::shared_ptr<MediaType> getMediaType () {
    return mediaType;
  };

  static std::string getName() {
    return "MediaFlowInStateChange";
  }

  virtual void Serialize (JsonSerializer &s);

protected:

  MediaFlowInStateChange() {};

private:
  std::shared_ptr<MediaFlowState> state;
  std::string padName;
  std::shared_ptr<MediaType> mediaType;

  friend void kurento::Serialize (std::shared_ptr<kurento::MediaFlowInStateChange> &event, JsonSerializer &s);
};

} /* kurento */

#endif /*  __MEDIA_FLOW_IN_STATE_CHANGE_HPP__ */
