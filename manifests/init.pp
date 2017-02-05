# modules/ddclient/manifests/init.pp
#
# == Class: ddclient
#
# Manages the ddclient daemon on a host.
#
# === Authors
#
#   John Florian <jflorian@doubledog.org>
#
# === Copyright
#
# Copyright 2012-2017 John Florian


class ddclient ( $content=undef ) {

    include 'ddclient::params'

    package { $ddclient::params::packages:
        ensure  => installed,
    }

    file {
        default:
            seluser => 'system_u',
            selrole => 'object_r',
            subscribe => Package[$ddclient::params::packages],
            ;
        '/etc/sysconfig/ddclient':
            owner   => 'root',
            group   => 'root',
            mode    => '0640',
            seltype => 'etc_t',
            source  => 'puppet:///modules/ddclient/sysconfig',
            ;
        '/etc/ddclient.conf':
            owner   => 'ddclient',
            group   => 'ddclient',
            mode    => '0600',
            seltype => 'ddclient_etc_t',
            content => $content,
    }

    service { $ddclient::params::service_name:
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        subscribe  => [
            File['/etc/ddclient.conf'],
            Package[$ddclient::params::packages],
        ],
    }

}
