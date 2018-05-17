# Dependencies

## What do I need to run this?

Usually nothing extra! Your base Ubuntu install comes with all the commands/utilities this script uses, unless you are running this on Ubuntu docker image.

???+ tip "Core dependencies"
    The script depends on following utilities which are usually present on a typical Ubuntu/Ubuntu based installation. If these packages are not installed, script will exit with error code 1. 

    - lsb-release, for determining the release and distribution.
    - whiptail, to display the menu.
    - wget, to get deb packages, report stats, get version information.
    - iputils-ping, to test connectivity.
    - bash

## Additional packages installed

Some tasks might install packages automatically, which are required to perform certain actions.

???+ info "Additional APT packages installed"
    Some apt packages will be installed automatically, as they are necessary to perform selected tasks.

    ### For repository related tasks
    - apt-transport-https
    - ca-certificates
    - curl
    - ppa-purge
    - software-properties-common

    ### For installing python packages
    - python-pip (for python 2)
    - python3-pip (for python 3)
