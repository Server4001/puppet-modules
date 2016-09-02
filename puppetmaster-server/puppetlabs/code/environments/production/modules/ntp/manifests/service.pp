# Class: ntp::service
# ===========================
#
# A class that manages the state of the ntp service.
#
class ntp::service inherits ntp {
  $servicename = $ntp::servicename

  service { 'ntp':
    name   => $servicename,
    ensure => 'running',
    enable => true,
  }
}
