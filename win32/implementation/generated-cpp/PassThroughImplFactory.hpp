/* Autogenerated with kurento-module-creator */

#ifndef __PASS_THROUGH_IMPL_FACTORY_HPP__
#define __PASS_THROUGH_IMPL_FACTORY_HPP__

#include "PassThroughImpl.hpp"
#include "MediaElementImplFactory.hpp"
#include <MediaObjectImpl.hpp>
#include <boost/property_tree/ptree.hpp>

namespace kurento
{

class PassThroughImplFactory : public virtual MediaElementImplFactory
{
public:
  PassThroughImplFactory () {};

  virtual std::string getName () const {
    return "PassThrough";
  };

private:

  virtual MediaObjectImpl *createObjectPointer (const boost::property_tree::ptree &conf, const Json::Value &params) const;

  MediaObjectImpl *createObject (const boost::property_tree::ptree &conf, std::shared_ptr<MediaPipeline> mediaPipeline) const;
};

} /* kurento */

#endif /*  __PASS_THROUGH_IMPL_FACTORY_HPP__ */