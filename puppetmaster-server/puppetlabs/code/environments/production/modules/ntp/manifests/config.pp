# Class: ntp::config
# ===========================
#
# A class that manages config files for ntp.
#
class ntp::config inherits ntp {
  $servers = $ntp::servers
  $config_file = $ntp::config_file

  if ($::kernel == 'Linux') {
    file { 'ntp.conf':
      path    => $config_file,
      ensure  => file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template('ntp/ntp.conf.erb'),
      notify  =>  Service['ntp'],
    }
  }
  if ($::kernel == 'Windows') {
    file { 'ntp.conf':
      path    => $config_file,
      ensure  => file,
      content => template('ntp/ntp.conf.erb'),
      notify  => Service['ntp'],
      require => Package['meinberg-ntp'],
    }
  }
}
