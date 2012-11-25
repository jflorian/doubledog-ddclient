# modules/ddclient/manifests/init.pp
#
# Synopsis:
#       Configures a host to run a ddclient daemon.


class ddclient ( $conf_source ) {

    include ddclient::params

    package { $ddclient::params::packages:
        ensure  => installed,
    }

    File {
        seluser => 'system_u',
        selrole => 'object_r',
        subscribe => Package[$ddclient::params::packages],
    }

    file { '/etc/sysconfig/ddclient':
        owner   => 'root',
        group   => 'root',
        mode    => '0640',
        seltype => 'etc_t',
        source  => 'puppet:///modules/ddclient/sysconfig',
    }

    file { '/etc/ddclient.conf':
        owner   => 'ddclient',
        group   => 'ddclient',
        mode    => '0440',
        seltype => 'ddclient_etc_t',
        source  => "${conf_source}",
    }

    service { $ddclient::params::service_name:
        enable          => true,
        ensure          => running,
        hasrestart      => true,
        hasstatus       => true,
        subscribe       => [
            File['/etc/ddclient.conf'],
            Package[$ddclient::params::packages],
        ],
    }

}
