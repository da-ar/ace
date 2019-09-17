require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'verify_this',
  docs: 'This is a basic type used to verify a fallback device',
  features: ['remote_resource'],
  attributes: {
    name: {
      type:      'String',
      desc:      'describes this thing',
      behaviour: :namevar,
    },
    verified: {
      type:      'Boolean',
      desc:      'Will return true if the device is connected',
      default:   false,
    },
  },
)
