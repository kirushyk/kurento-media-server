/* Autogenerated with kurento-module-creator */

#include "Media.hpp"
#include <jsonrpc/JsonSerializer.hpp>
#include <time.h>
#include <string>

namespace kurento
{

void
Media::Serialize (JsonSerializer &s)
{
  RaiseBase::Serialize (s);

  s.SerializeNVP (type);
}

} /* kurento */

namespace kurento
{

void Serialize (std::shared_ptr<kurento::Media> &event, JsonSerializer &s)
{
  if (!s.IsWriter && !event) {
    event.reset (new kurento::Media() );
  }

  if (event) {
    event->Serialize (s);
  }
}

} /* kurento */