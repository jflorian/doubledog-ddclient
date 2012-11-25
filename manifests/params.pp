# modules/ddclient/manifests/params.pp
#
# Synopsis:
#       Parameters for the ddclient puppet module.
#
# Parameters:
#       Name__________  Notes_  Description___________________________
#
#       name                    instance name
#
#       ensure          1       instance is to be present/absent
#
# Notes:
#
#       1. Default is 'present'.


class ddclient::params {

    case $::operatingsystem {
        Fedora: {

            $service_name = 'ddclient'
            $packages = [
                'ddclient',
            ]

        }

        default: {
            fail ("The ddclient module is not yet supported on ${operatingsystem}.")
        }

    }

}
