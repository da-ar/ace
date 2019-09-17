require 'spec_helper'

ensure_module_defined('Puppet::Provider::VerifyThis')
require 'puppet/provider/verify_this/verify_this'

RSpec.describe Puppet::Provider::VerifyThis::VerifyThis do
  subject(:provider) { described_class.new }

  let(:context) { instance_double('Puppet::ResourceApi::BaseContext', 'context') }
  let(:device) { instance_double('Puppet::Util::NetworkDevice::Fallback_device', 'device') }

  describe '#get' do
    it 'when it can connect to the device' do
      allow(context).to receive(:device).and_return(device)
      expect(device).to receive(:respond_to?).with(:verified).and_return(true)
      expect(device).to receive(:verified).and_return(true)

      expect(provider.get(context)).to eq [
        {
          name: 'default',
          verified: true,
        },
      ]
    end
    it 'when it cannot connect to the device' do
      allow(context).to receive(:device).and_return(device)
      expect(device).to receive(:respond_to?).with(:verified).and_return(false)

      expect(provider.get(context)).to eq [
        {
          name: 'default',
          verified: false,
        },
      ]
    end
  end

  describe 'create(context, name, should)' do
    it 'creates the resource' do
      expect(context).to receive(:notice).with(%r{\ACreating 'a'})

      provider.create(context, 'a', name: 'a', ensure: 'present')
    end
  end

  describe 'update(context, name, should)' do
    it 'updates the resource' do
      expect(context).to receive(:notice).with(%r{\AUpdating 'foo'})

      provider.update(context, 'foo', name: 'foo', ensure: 'present')
    end
  end

  describe 'delete(context, name)' do
    it 'deletes the resource' do
      expect(context).to receive(:notice).with(%r{\ADeleting 'foo'})

      provider.delete(context, 'foo')
    end
  end
end
