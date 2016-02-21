/* Autogenerated with kurento-module-creator */

#ifndef __ALPHA_BLENDING_IMPL_FACTORY_HPP__
#define __ALPHA_BLENDING_IMPL_FACTORY_HPP__

#include "AlphaBlendingImpl.hpp"
#include "HubImplFactory.hpp"
#include <MediaObjectImpl.hpp>
#include <boost/property_tree/ptree.hpp>

namespace kurento
{

class AlphaBlendingImplFactory : public virtual HubImplFactory
{
public:
  AlphaBlendingImplFactory () {};

  virtual std::string getName () const {
    return "AlphaBlending";
  };

private:

  virtual MediaObjectImpl *createObjectPointer (const boost::property_tree::ptree &conf, const Json::Value &params) const;

  MediaObjectImpl *createObject (const boost::property_tree::ptree &conf, std::shared_ptr<MediaPipeline> mediaPipeline) const;
};

} /* kurento */

#endif /*  __ALPHA_BLENDING_IMPL_FACTORY_HPP__ */