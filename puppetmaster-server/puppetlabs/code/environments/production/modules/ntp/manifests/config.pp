# Class: ntp::config
# ===========================
#
# A class that manages config files for ntp.
#
class ntp::config inherits ntp {
  $servers = $ntp::servers # TODO : Might be able to remove this line w/o issues.

  if ($::kernel == 'Linux') {
    file { '/etc/ntp.conf':
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template('ntp/ntp.conf.erb'),
      notify  =>  Service['ntp'],
    }
  }
  if ($::kernel == 'Windows') {
    file { 'c:\\ntp\\etc\\ntp.conf':
      ensure  => file,
      content => template('ntp/ntp.conf.erb'),
      notify  => Service['ntp'],
      require => Package['meinberg-ntp'],
    }
  }
}
