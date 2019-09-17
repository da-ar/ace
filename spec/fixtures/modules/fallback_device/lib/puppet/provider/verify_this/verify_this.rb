require 'puppet/resource_api/simple_provider'

# Implementation for the verify_this type using the Resource API.
class Puppet::Provider::VerifyThis::VerifyThis < Puppet::ResourceApi::SimpleProvider
  def get(context)
    [
      {
        name: 'default',
        verified: context.device.respond_to?(:verified) ? context.device.verified : false,
      },
    ]
  end

  def create(context, name, should)
    context.notice("Creating '#{name}' with #{should.inspect}")
  end

  def update(context, name, should)
    context.notice("Updating '#{name}' with #{should.inspect}")
  end

  def delete(context, name)
    context.notice("Deleting '#{name}'")
  end
end
