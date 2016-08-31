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
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
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
class ntp {
  contain 'ntp::install'
}
