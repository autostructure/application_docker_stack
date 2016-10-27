# Class: application_docker_stack
# ===========================
#
# Full description of class application_docker_stack here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class application_docker_stack {

  ec2_instance { 'consul0':
    ensure          => running,
    image_id        => hiera('aws_ami'),
    instance_type   => 't2.micro',
    #subnet          => 'vagrant',
    monitoring      => true,
    security_groups => ['puppet'],
    user_data       => epp(
      'application_docker_stack',
        {
          role => 'consul_server',
        }
      ),
  }

  ec2_instance { 'consul1':
    ensure          => running,
    image_id        => hiera('aws_ami'),
    instance_type   => 't2.micro',
    #subnet          => 'vagrant',
    monitoring      => true,
    security_groups => ['puppet'],
    user_data       => epp(
      'application_docker_stack',
        {
          role => 'consul_server',
        }
      ),
  }

  # validate parameters here

  # class { '::application_docker_stack::install': } ->
  # class { '::application_docker_stack::config': } ~>
  # class { '::application_docker_stack::service': } ->
  # Class['::application_docker_stack']
}
