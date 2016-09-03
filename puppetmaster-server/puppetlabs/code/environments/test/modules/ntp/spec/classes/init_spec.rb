require 'spec_helper'
describe 'ntp' do

  context 'with default values for all parameters' do
    let(:facts) {{ :kernel => 'Linux', :osfamily => 'RedHat' }}

    it { should contain_class('ntp') }
    it { should contain_class('ntp::install') }
    it { should contain_class('ntp::service') }
  end
end
