/* Autogenerated with kurento-module-creator */

#ifndef __RTCSTATS_ICE_CANDIDATE_PAIR_STATE_HPP__
#define __RTCSTATS_ICE_CANDIDATE_PAIR_STATE_HPP__

#include <json/json.h>
#include <jsonrpc/JsonRpcException.hpp>
#include <memory>


namespace kurento
{
class RTCStatsIceCandidatePairState;
} /* kurento */

namespace kurento
{
class JsonSerializer;
void Serialize (std::shared_ptr<kurento::RTCStatsIceCandidatePairState> &object, JsonSerializer &s);
} /* kurento */

namespace kurento
{

class RTCStatsIceCandidatePairState
{

public:

  typedef enum {
    frozen,
    waiting,
    inprogress,
    failed,
    succeeded,
    cancelled
  } type;

  RTCStatsIceCandidatePairState (const std::string &value) {
    enumValue = getValueFromString (value);
  };

  RTCStatsIceCandidatePairState (type value) {
    this->enumValue = value;
  }

  type getValue () {
    return enumValue;
  };

  std::string getString () {

    if (enumValue ==  frozen) {
      return "frozen";
    }

    if (enumValue ==  waiting) {
      return "waiting";
    }

    if (enumValue ==  inprogress) {
      return "inprogress";
    }

    if (enumValue ==  failed) {
      return "failed";
    }

    if (enumValue ==  succeeded) {
      return "succeeded";
    }

    if (enumValue ==  cancelled) {
      return "cancelled";
    }

    return "";
  }

  void Serialize (JsonSerializer &s);

  RTCStatsIceCandidatePairState() {};

private:

  static type getValueFromString (const std::string &value);

  type enumValue;

  friend void kurento::Serialize (std::shared_ptr<kurento::RTCStatsIceCandidatePairState> &object, JsonSerializer &s);

};

} /* kurento */

#endif /*  __RTCSTATS_ICE_CANDIDATE_PAIR_STATE_HPP__ */
