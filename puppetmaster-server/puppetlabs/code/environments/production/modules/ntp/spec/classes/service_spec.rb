require 'spec_helper'
describe 'ntp::service' do

  context 'for the RedHat Linux os' do
    let(:facts) {{ :kernel => 'Linux', :osfamily => 'RedHat' }}

    it do
      should contain_service('ntp').with({
        'name'   => 'ntpd',
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end

  context 'for the Debian Linux os' do
    let(:facts) {{ :kernel => 'Linux', :osfamily => 'Debian' }}

    it do
      should contain_service('ntp').with({
        'name'   => 'ntp',
        'ensure' => 'running',
        'enable' => 'true',
      })
    end
  end
end
