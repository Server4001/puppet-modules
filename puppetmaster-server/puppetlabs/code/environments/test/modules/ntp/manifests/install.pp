# Class: ntp::install
# ===========================
#
# A class that manages the installation of the ntp package.
#
class ntp::install {
  case $::kernel {
    'Linux': {
      package { 'ntp':
        ensure => installed,
      }
    }
    'Windows': {
      file { 'ntp-chocolatey-package':
        path   => 'c:\\meinberg-ntp.4.2.8.nupkg',
        ensure => file,
        source => 'puppet:///modules/ntp/meinberg-ntp.4.2.8.nupkg',
      }
      package { 'meinberg-ntp':
        ensure   => latest,
        provider => 'chocolatey',
        source   => 'c:\\meinberg-ntp.4.2.8.nupkg',
        require  => File['ntp-chocolatey-package'],
      }
    }
    default: {
      fail("Sorry, ${::kernel} is unsupported by this ntp module!")
    }
  }
}
