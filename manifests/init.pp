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
        String[1]               $content,
        Boolean                 $enable,
        Variant[Boolean, Enum['running', 'stopped']] $ensure,
        Array[String[1], 1]     $packages,
        String[1]               $service,
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
            owner   => 'ddclient',
            group   => 'ddclient',
            mode    => '0600',
            seltype => 'ddclient_etc_t',
            content => $content,
    } ->

    service { $service:
        ensure     => $ensure,
        enable     => $enable,
        hasrestart => true,
        hasstatus  => true,
    }

}
