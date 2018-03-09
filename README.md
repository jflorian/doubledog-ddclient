<!---
Copyright 2018 John Florian <jflorian@doubledog.org>
SPDX-License-Identifier: GPL-3.0-or-later

This file is part of doubledog-ddclient.

doubledog-ddclient is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by the
Free Software Foundation; either version 3.0 of the License, or (at your
option) any later version.
-->
# ddclient

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with ddclient](#setup)
    * [What ddclient affects](#what-ddclient-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ddclient](#beginning-with-ddclient)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
    * [Defined types](#defined-types)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module lets you manage ddclient.

## Setup

### What ddclient Affects

### Setup Requirements

### Beginning with ddclient

## Usage

## Reference

**Classes:**

* [ddclient](#ddclient-class)

**Defined types:**


### Classes

#### ddclient class

This class manages ddclient.

##### `domains` (required)
An array of domains about which ddclient is providing IP address updates.  A minimum of one is required.

##### `identity` (required)
The login identity to be used to authenticate ddclient to the Dynamic DNS provider.

##### `password` (required)
The login password to be used to authenticate ddclient to the Dynamic DNS provider.

##### `protocol` (required)
The protocol to use to update the Dynamic DNS provider.  This value is not validated beyond enforcing a non-null string.

##### `use` (required)
The mechanism to be used for obtaining the IP address.  This value is not validated beyond enforcing a non-null string.  Example: `'if, if=eth0'`

##### `enable`
Instance is to be started at boot.  Either `true` (default) or `false`.

##### `ensure`
Instance is to be `running` (default) or `stopped`.  Alternatively, a Boolean value may also be used with `true` equivalent to `running` and `false` equivalent to `stopped`.

##### `interval`
The period length in seconds that ddclient waits between checks for IP address changes.  The default is 300 seconds (5 minutes).

##### `packages`
An array of package names needed for the ddclient installation.  The default should be correct for supported platforms.

##### `server`
The DNS hostname of the Dynamic DNS provider to be updated.  Not all providers require this.  The default or `undef` cause this to be ignored.

##### `service`
The service name of the ddclient daemon.  The default should be correct for supported platforms.

##### `ssl`
Use SSL support.  Either `true` (default) or `false`.

##### `syslog`
Update messages are to be sent to the system logger.  Either `true` (default) or `false`.


### Defined types


## Limitations

Tested on modern Fedora releases, but likely to work on any Red Hat variant.  Adaptations for other operating systems should be trivial as this module follows the data-in-module paradigm.  See `data/common.yaml` for the most likely obstructions.  If "one size can't fit all", the value should be moved from `data/common.yaml` to `data/os/%{facts.os.name}.yaml` instead.  See `hiera.yaml` for how this is handled.

This should be compatible with Puppet 3.x and is being used with Puppet 4.x as well.

## Development

Contributions are welcome via pull requests.  All code should generally be compliant with puppet-lint.
