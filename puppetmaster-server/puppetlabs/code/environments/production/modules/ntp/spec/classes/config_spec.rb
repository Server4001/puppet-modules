require 'spec_helper'
describe 'ntp::config' do

  context 'for a Linux distribution' do
    let(:facts) {{ :kernel => 'Linux' }}

    it do
      should contain_file('ntp.conf').with({
        'path'    => '/etc/ntp.conf',
        'ensure'  => 'file',
        'mode'    => '0644',
        'owner'   => 'root',
        'group'   => 'root',
        'content' => /server 0.us.pool.ntp.org iburst\nserver 1.us.pool.ntp.org iburst\nserver 2.us.pool.ntp.org iburst\nserver 3.us.pool.ntp.org iburst/,
        'notify'  => 'Service[ntp]',
      })
    end
  end

  context 'for a Windows distribution' do
    let(:facts) {{ :kernel => 'Windows' }}

    it do
      should contain_file('ntp.conf').with({
        'path'    => 'c:\\ntp\\etc\\ntp.conf',
        'ensure'  => 'file',
        'content' => /server 0.us.pool.ntp.org iburst\nserver 1.us.pool.ntp.org iburst\nserver 2.us.pool.ntp.org iburst\nserver 3.us.pool.ntp.org iburst/,
        'notify'  => 'Service[ntp]',
      })
    end
  end
end
