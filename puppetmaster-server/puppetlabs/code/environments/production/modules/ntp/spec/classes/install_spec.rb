require 'spec_helper'
describe 'ntp::install' do

  context 'for a Linux based operating system' do
    let(:facts) {{ :kernel => 'Linux' }}

    it do
      should contain_package('ntp').with({
        'ensure' => 'installed',
      })
    end
  end

  context 'for a Windows operating system' do
    let(:facts) {{ :kernel => 'Windows' }}

    it do
      should contain_package('meinberg-ntp').with({
        'ensure'   => 'latest',
        'provider' => 'chocolatey',
      })
    end
  end

  context 'for an unsupported operating system' do
    let(:facts) {{ :kernel => 'foo' }}

    it do
      expect {
        should contain_class('ntp::install')
      }.to raise_error(Puppet::Error, /unsupported/)
    end
  end
end
