require 'spec_helper'
describe 'ntp::config' do

  context 'for a Linux distribution ' do
    let(:facts) {{ :kernel => 'Linux' }}

    it do
      should contain_file('/etc/ntp.conf').with({
        'ensure'  => 'file',
        'mode'    => '0644',
        'owner'   => 'root',
        'group'   => 'root',
        'content' => /server 0.us.pool.ntp.org iburst\nserver 1.us.pool.ntp.org iburst\nserver 2.us.pool.ntp.org iburst\nserver 3.us.pool.ntp.org iburst/,
      })
    end
  end
end
