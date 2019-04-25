# Class: dnsdist::params
#
# This class setups up the defaults for the dnsdist class
#
# Parameters:
#   $webserver = '0.0.0.0:80',
#   $webserver_pass = 'geheim'
#   $control_socket = '127.0.0.1'
#   $listen_addresses = '0.0.0.0'
#

class dnsdist::params {

  $carbonserver     = false
  $control_socket   = '127.0.0.1'
  $distribution     = 'ubuntu'
  $listen_addresses = '127.0.0.1'
  $number_of_cpus   = 1
  $service_enabled  = true
  $service_ensure   = true
  $server_policy    = 'firstAvailable'
  $version          = 10
  $webserver        = '127.0.0.1:80'
  $webserver_pass   = 'geheim'

}
