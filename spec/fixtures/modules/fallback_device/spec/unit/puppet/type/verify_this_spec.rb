require 'spec_helper'
require 'puppet/type/verify_this'

RSpec.describe 'the verify_this type' do
  it 'loads' do
    expect(Puppet::Type.type(:verify_this)).not_to be_nil
  end
end
