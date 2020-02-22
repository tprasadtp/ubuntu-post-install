# Dependencies

## What do I need to run this

Usually nothing extra! Your base Ubuntu install comes with all the commands/utilities this script uses, unless you are running this on Ubuntu docker image.

### Core dependencies

The script depends on following utilities which are usually present on a typical Ubuntu/Ubuntu based installation. If these packages are not installed, script will exit with error code 1.

!!! tip "Install Dependencies"

    ```console
    sudo apt-get install -y --no-install-recommends whiptail coreutils iputils-ping procps wget
    ```

- `whiptail`, to display the menu.
- `coreutils` cut, tr, grep etc.
- `wget`, to get deb packages, report stats, get version information.
- `iputils-ping`, to test connectivity.
- `procps` to check running processes
- `awk`, `sed` to parse configs
- bash (4.x)

!!! warning "Note on Debian"
    Debian releases, [especially in docker] images sometimes do not have `ps` binary from `procps` pre installed. Please install the dependency packages before running the script.

## Additional packages installed

Some tasks might install packages automatically, which are required to perform certain actions.

???+ info "Additional APT packages installed"
    Some apt packages will be installed automatically, as they are necessary to perform selected tasks.

    ### For repository related tasks
    - apt-transport-https
    - ca-certificates
    - curl
    - gnupg2
    - software-properties-common

    ### For installing python packages
    - python-pip (for python 2)
    - python3-pip (for python 3)

    ### For resetting repositories
    - ppa-purge

    Additional dependencies of these packages will also be installed.
