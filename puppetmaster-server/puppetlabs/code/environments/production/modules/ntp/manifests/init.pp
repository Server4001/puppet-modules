# Class: ntp
# ===========================
#
# Installs and manages ntp.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `servers`
# An array of servers to use for syning server time.
#
# Examples
# --------
#
# @example
#    class { 'ntp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Brice Bentler <me@bricebentler.com>
#
# Copyright
# ---------
#
# Copyright 2016 Bentler Design, unless otherwise noted.
#
class ntp (
  $servers = $ntp::params::servers
) inherits ntp::params {
  contain 'ntp::install', 'ntp::config'
}
