# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# https://docs.puppet.com/guides/tests_smoke.html
#
class { '::ntp':
  servers => [
    '0.us.pool.ntp.org',
    '1.us.pool.ntp.org',
    '2.us.pool.ntp.org',
    '3.us.pool.ntp.org',
  ],
}
