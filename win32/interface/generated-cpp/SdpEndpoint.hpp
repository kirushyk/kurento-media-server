/* Autogenerated with kurento-module-creator */

#ifndef __SDP_ENDPOINT_HPP__
#define __SDP_ENDPOINT_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>
#include <vector>
#include "SessionEndpoint.hpp"

namespace kurento
{
class SdpEndpoint;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::SdpEndpoint> &object, JsonSerializer &serializer);
}

namespace kurento
{
class SdpEndpoint : public virtual SessionEndpoint
{

public:
  SdpEndpoint () {};
  virtual ~SdpEndpoint () {};

  virtual std::string generateOffer () = 0;
  virtual std::string processOffer (const std::string &offer) = 0;
  virtual std::string processAnswer (const std::string &answer) = 0;
  virtual std::string getLocalSessionDescriptor () = 0;
  virtual std::string getRemoteSessionDescriptor () = 0;

  virtual std::string getType () const {
    return "SdpEndpoint";
  }

  virtual std::string getModule () const {
    return "kurento";
  }

  virtual void Serialize (JsonSerializer &serializer) = 0;

  virtual int getMaxVideoRecvBandwidth () = 0;
  virtual void setMaxVideoRecvBandwidth (int maxVideoRecvBandwidth) = 0;

  virtual int getMaxAudioRecvBandwidth () = 0;
  virtual void setMaxAudioRecvBandwidth (int maxAudioRecvBandwidth) = 0;

};

} /* kurento */

#endif /*  __SDP_ENDPOINT_HPP__ */
