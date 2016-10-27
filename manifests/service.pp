# == Class application_docker_stack::service
#
# This class is meant to be called from application_docker_stack.
# It ensure the service is running.
#
class application_docker_stack::service {

  service { $::application_docker_stack::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
