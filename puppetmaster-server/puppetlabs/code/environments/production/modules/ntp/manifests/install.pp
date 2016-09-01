# Class: ntp::install
# ===========================
#
# Install class manages the installation of the ntp package.
#
class ntp::install {
  case $::kernel {
    'Linux': {
      package { 'ntp':
        ensure => installed,
      }
    }
    'Windows': {
      package { 'meinberg-ntp':
        ensure   => latest,
        provider => 'chocolatey',
      }
    }
    default: {
      fail("Sorry, ${::kernel} is unsupported by this ntp module!")
    }
  }
}
