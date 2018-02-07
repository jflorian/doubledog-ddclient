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

**Defined types:**


### Classes


### Defined types


## Limitations

Tested on modern Fedora releases, but likely to work on any Red Hat variant.  Adaptations for other operating systems should be trivial as this module follows the data-in-module paradigm.  See `data/common.yaml` for the most likely obstructions.  If "one size can't fit all", the value should be moved from `data/common.yaml` to `data/os/%{facts.os.name}.yaml` instead.  See `hiera.yaml` for how this is handled.

This should be compatible with Puppet 3.x and is being used with Puppet 4.x as well.

## Development

Contributions are welcome via pull requests.  All code should generally be compliant with puppet-lint.
