partition koha-common
=====================

Secure a multi-tenant Koha server by enabling a separate mount point for each instance

`koha-common` allows system administrators to run multiple instances of Koha on a single server, reducing management overhead and improving resource utilization.

But the pieces of a Koha instance are spread throughout the system, making data portability labor-intensive and complicating disk usage assessment.
This project places all components of a Koha instance under a single path, simplifying management and improving portability.

**Note:** ALWAYS take a backup before attempting this conversion

Installation
------------

Stop any running Koha instances and run `partition.sh` as root (or with sudo):

    service koha-common stop
    ./partition.sh
    service koha-common start

Caveats
-------

Since this package alters `koha-common` core files, `partition.sh` needs to be re-run after every upgrade to `koha-common`.

