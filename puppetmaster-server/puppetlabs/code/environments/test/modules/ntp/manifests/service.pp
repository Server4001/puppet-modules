# Class: ntp::service
# ===========================
#
# A class that manages the state of the ntp service.
#
class ntp::service inherits ntp {
  $service_name = $ntp::service_name

  service { 'ntp':
    name   => $service_name,
    ensure => 'running',
    enable => true,
  }
}
