# Dependencies

## What do I need to run this

Usually nothing extra! Your base Ubuntu install comes with all the commands/utilities this script uses.

### Core dependencies

The script depends on following utilities which are usually present on a typical Ubuntu/Ubuntu based installation. If these packages are not installed, script will exit with error code 1.

!!! tip "Install Dependencies"

    ```console
    sudo apt-get install -y --no-install-recommends whiptail coreutils procps wget
    ```

- `whiptail`, to display the menu.
- `coreutils` cut, tr, grep etc.
- `wget`, to get deb packages check for updates etc.
- `procps` to check running processes
- `awk`, `sed` to parse configs
- bash (4.x)


## Additional packages installed

Some tasks might install packages automatically, as required to perform certain actions.

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

    ### For removing PPAs
    - ppa-purge

    Any dependencies of these packages will also be installed.
