# == Class application_docker_stack::params
#
# This class is meant to be called from application_docker_stack.
# It sets variables according to platform.
#
class application_docker_stack::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'application_docker_stack'
      $service_name = 'application_docker_stack'
    }
    'RedHat', 'Amazon': {
      $package_name = 'application_docker_stack'
      $service_name = 'application_docker_stack'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
