# == Class application_docker_stack::install
#
# This class is called from application_docker_stack for install.
#
class application_docker_stack::install {

  package { $::application_docker_stack::package_name:
    ensure => present,
  }
}
