# Class: dnsdist::config
#
# This class configures dnsdist
#
# Requires:
#   concat
#


class dnsdist::config (
  $webserver,
  $webserver_pass,
  $carbonserver,
  $control_socket,
  $server_policy,
  $listen_addresses,
  $number_of_cpus,
  $version
){

  concat { '/etc/dnsdist/dnsdist.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['dnsdist'],
    require => [Package['dnsdist']]
  }

  concat::fragment { 'global-header':
    target  => '/etc/dnsdist/dnsdist.conf',
    content => template('dnsdist/dnsdist.conf-header.erb'),
    order   => '10';
  }

  concat::fragment { 'acl-header':
    target  => '/etc/dnsdist/dnsdist.conf',
    content => 'setACL({',
    order   => '40';
  }

  concat::fragment { 'acl-footer':
    target  => '/etc/dnsdist/dnsdist.conf',
    content => "})\n",
    order   => '49';
  }

}
