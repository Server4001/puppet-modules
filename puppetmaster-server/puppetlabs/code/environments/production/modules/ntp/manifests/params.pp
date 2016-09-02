# Class: ntp::params
# ===========================
#
# A class that contains params used by the rest of the ntp module.
#
class ntp::params {
  $servers = [
    '0.us.pool.ntp.org',
    '1.us.pool.ntp.org',
    '2.us.pool.ntp.org',
    '3.us.pool.ntp.org',
  ]

  if ($::kernel == 'Linux') {
    $config_file = '/etc/ntp.conf'
  }
  if ($::kernel == 'Windows') {
    $config_file = 'c:\\ntp\\etc\\ntp.conf'
  }

  $servicename = $::osfamily ? {
    'RedHat' => 'ntpd',
    default  => 'ntp',
  }
}
