# Class: dnsdist
#
# This class installs and manages dnsdist
#
# Author
#   Hetzner ZA <kernels@hetzner.co.za>
#
# Version
#   0.2  Refactored release with debian distribution support 
#
# Parameters:
#   $webserver        = '0.0.0.0:80',
#   $webserver_pass   = 'geheim'
#   $control_socket   = '127.0.0.1'
#   $listen_addresses = '0.0.0.0'
#   $distribution     = 'debian'
#
# Requires:
#   concat
#   apt
#
# Sample Usage:
#
#   class { 'dnsdist':
#    webserver        => '192.168.1.1:80',
#    listen_addresses => [ '192.168.1.1' ];
#  }
#

class dnsdist (
  $webserver        = $dnsdist::params::webserver,
  $webserver_pass   = $dnsdist::params::webserver_pass,
  $carbonserver     = $dnsdist::params::carbonserver,
  $control_socket   = $dnsdist::params::control_socket,
  $listen_addresses = $dnsdist::params::listen_addresses,
  $number_of_cpus   = $dnsdist::params::number_of_cpus,
  $version          = $dnsdist::params::version,
  $distribution     = $dnsdist::params::distribution,
  $service_enabled  = $dnsdist::params::service_enabled,
  $service_ensure   = $dnsdist::params::service_ensure,
  $server_policy    = $dnsdist::params::server_policy,
) inherits ::dnsdist::params {

  class { '::dnsdist::service':
    enabled => $service_enabled,
    ensure  => $service_ensure
  }

  class { '::dnsdist::package':
    distribution => $distribution,
    version      => $version
  }

  class { '::dnsdist::config':
    webserver        => $webserver,
    webserver_pass   => $webserver_pass,
    carbonserver     => $carbonserver,
    control_socket   => $control_socket,
    server_policy    => $server_policy,
    listen_addresses => $listen_addresses,
    version          => $version,
    number_of_cpus   => $number_of_cpus
  }

}
