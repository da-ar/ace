module Puppet::Util::NetworkDevice::Fallback_device # rubocop:disable Style/ClassAndModuleCamelCase
  # An old Device class used by puppet to connect to a remote device
  class Device
    attr_reader :verified

    def initialize(_url_or_config, _options = {})
      puts 'In fallback_device `device.rb`'
      @verified = true
    end

    def facts
      {
        'fallback' => 'device!',
      }
    end
  end
end
