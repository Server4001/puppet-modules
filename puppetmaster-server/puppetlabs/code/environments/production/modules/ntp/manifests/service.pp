# Class: ntp::service
# ===========================
#
# A class that manages the state of the ntp service.
#
class ntp::service {
  $servicename = $::osfamily ? {
    'RedHat' => 'ntpd',
    default  => 'ntp',
  }

  service { 'ntp':
    name   => $servicename,
    ensure => 'running',
    enable => true,
  }
}
