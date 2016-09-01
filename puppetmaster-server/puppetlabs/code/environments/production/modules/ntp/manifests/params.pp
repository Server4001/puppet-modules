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
}
