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
# This file is part of the doubledog-ddclient Puppet module.
# Copyright 2012-2018 John Florian
# SPDX-License-Identifier: GPL-3.0-or-later


class ddclient (
        Array[String[1], 1]     $domains,
        Boolean                 $enable,
        Variant[Boolean, Enum['running', 'stopped']] $ensure,
        String[1]               $identity,
        Integer[1]              $interval,
        String[1]               $password,
        Array[String[1], 1]     $packages,
        String[1]               $protocol,
        Optional[String[1]]     $server,
        String[1]               $service,
        Boolean                 $ssl,
        Boolean                 $syslog,
        String[1]               $use,
    ) {

    package { $packages:
        ensure => installed,
        notify => Service[$service],
    } ->

    file {
        default:
            seluser => 'system_u',
            selrole => 'object_r',
            notify  => Service[$service],
            ;
        '/etc/sysconfig/ddclient':
            owner   => 'root',
            group   => 'root',
            mode    => '0640',
            seltype => 'etc_t',
            source  => 'puppet:///modules/ddclient/sysconfig',
            ;
        '/etc/ddclient.conf':
            owner     => 'ddclient',
            group     => 'ddclient',
            mode      => '0600',
            seltype   => 'ddclient_etc_t',
            content   => template('ddclient/ddclient.conf.erb'),
            show_diff => false,
    } ->

    service { $service:
        ensure     => $ensure,
        enable     => $enable,
        hasrestart => true,
        hasstatus  => true,
    }

}
