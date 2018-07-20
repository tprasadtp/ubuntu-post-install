# Command line options

## Configuration type
You have two options of configuring this script.

1. using .list files in `data`
  ```console
    ./after-effects --lists
  ```
2. Using YAML files [they can be local or remote]
  ```console
    ./after-effects --yaml
  ```
You need to specify which type to use. Not specifying will throw an error. You cannot mix configurations in YAML and lists.


!!! tip "Shorthand flags"
    You can also use short hand version of the flags `-Y` for YAML and `-L` for lists. Please note that lowercase case options have different meaning than uppercase ones.

## Simulating package installation

!!! snippet "Usage"
    ```console
    ./after-effects -s
    ```
    OR
    ```console
    ./after-effects --simulate
    ```

??? tip "This flag/option applies to following tasks"
    - Installing apt packages.
    - Installing Debian package archives (DEBs).
    - Installing Python packages.
    - Upgrading system packages.
    - Purging unwanted packages.

Following details should explain the behavior of this flag. Please do have a look at exceptions, as all tasks cannot be simulated.

- This option will simulate installing packages mentioned in the lists, using the apt-get in-built dry-run option `apt-get install -s` to simulate the installation of packages. Nothing will be downloaded except repository metadata (deb files if option is chosen). Packages will not be installed.
- This option can be used to check if the files in the lists are compatible/available in the repository.
- Installation of DEB files also behaves similarly. It uses `dpkg -i --dry-run` to simulate installation.
- Its a very good idea to simulate installation when you have reconfigured the apps and packages in the list to check what might be error prone.
- In case of DEB package files, they **will** be downloaded unlike apt-get package installs.

??? bug "Exceptions - Not everything can be simulated"
     - **Simulate flag will not simulate adding Repositories or PPAs.**
     - If you want to revert the changes please use **Reset Repositories** option.
     - PPAs and repositories **will** be added regardless of the flag.
     - Python package installation cannot be simulated. (pip lacks support for it) The script will skip installing apt dependencies and python packages, if simulate option is used.
      it simulate option is used.
     - APT package upgrades and apt repository metadata updates cannot be simulated. Only a list of packages upgrade-able will be listed in the log file in case of upgrades.
     - Simulate flag will not simulate installing dependencies for adding or deleting repositories and PPAs.

## Skip Version Checks

!!! snippet "Usage"
    ```console
    ./after-effects --no-version-check
    ```
Script will warn you and exit if you are not running latest version of the script. You can skip that by using the above option.

## Fix for latest Ubuntu releases

!!! snippet "Usage"
    ```console
    ./after-effects -f
    ```
    OR
    ```console
    ./after-effects --fix
    ```

??? tip "This flag/option applies to following repositories"
     - Google Cloud SDK
     - GCSFUSE
     - InSync
     - Docker Community Edition
     - Wine HQ


Usually it takes a while for additional Repositories (Docker, Google Cloud SDK etc) to add support for latest release of Ubuntu. However we can use the previous release for which packages are available. So, using packages built for previous release works fine most of the time. This is also good fix if you are running a alpha or beta release of Ubuntu.

- By default this option is disabled.
- Use `sudo ./after-effects -f` or `sudo ./after-effects --fix` to enable this.
- Repositories like Spotify and Google Chrome do not use code names in their repository URLs. So the above workaround is not necessary.
- Derivatives of Ubuntu will use the code name of Ubuntu on which they are based. For example Linux mint 18.2 Serena will use code name xenial since it is based on Ubuntu 16.04 Xenial Xerus
- This option applies only for the latest release mentioned in the variable `code_name_latest_release`. and will be ignored if the release is not latest.
- Variables in current version are (As of Dec 2017) change them if necessary.

```bash
readonly code_name_latest_release="bionic"
readonly codename_previous_release="artful"
readonly codename_upcoming_release="cosmic"
```

??? danger "Note for Pre-Release/ development version of Ubuntu"
    - If you are using a pre-release version of Ubuntu, you can use `--pre-release` flag to apply the above mentioned fix to pre-release version of Ubuntu.
    - This flag can be used independent of `--fix`. If both are used together then both flags will be applied if the release is upcoming-release.
    - If the release is stable, only `--fix` flag will be valid and `--pre-release` is ignored.
    - This is how it works:  If the repositories are  not available for latest stable release as well, go back a release. Ex. If the pre-release is 18.04 and the repositories is not available for 17.10 as well, we use 17.04 repositories. Usually happens in first few days of development cycle of 18.04.

## Skip confirmation prompts

!!! snippet "Usage"
    ```console
    ./after-effects -y
    ```
    OR
    ```console
    ./after-effects --yes
    ```

From v3.0 onward, you will be asked for confirmation before performing the task selected. If you would like to bypass this on a CI environments like TRAVIS or for any other reason, you can do so by running the script with `sudo ./after-effects -y` or `sudo ./after-effects --yes`

## Purge not required packages

!!! snippet "Usage"
    ```console
    ./after-effects -d
    ```
    OR
    ```console
    ./after-effects --deboalt
    ```

Usually Ubuntu comes with some pre-installed games, packages which you sometimes do not need. This option is a switch to used in purging these packages mentioned in the subsequent sections. Since it is possible that user might purge necessary packages like sudo or other core system components, these just acts like a barrier from accidentally doing so.

!!! warning
    - This flag **MUST** be passed, if you intend to purge packages from system. Otherwise you will receive an error.
    - If you are using YML config file you **MUST** set   `purge_enabled: true` under config.flags. See Example YAML file for more info.

## Delete log file

!!! snippet "Usage"
    ```console
    ./after-effects -l
    ```
    OR
    ```console
    ./after-effects --delete-log
    ```

Just a quick way to delete logs generated by this script.

!!! warning "Flag priority"
    If you pass `-l` in the beginning rest of the commands will be ignored, as the script exits after deleting the log!

## Keep downloaded DEB files

!!! snippet "Usage"
    ```console
    ./after-effects -k
    ```
    OR
    ```console
    ./after-effects --keep-debs
    ```
Keeps packages cached by APT and downloaded DEB packages.
Default behavior is to clean apt cache and delete downloaded DEB packages.

!!! bug "Python packages"
    Python package installation does not honor this flag.


## Hide Remote/local YAML configuration data

!!! snippet "Usage"
    ```
    ./after-effects --hide-config
    ```
Hides displaying YAML configuration data in the output.

## Prefer Local lists

!!! snippet "Usage"
    ```console
    ./after-effects -L
    ```
    OR
    ```console
    ./after-effects --lists
    ```

Using this option, you can chose to use the lists file which you have locally and not worry about YAML and shit.


## Use Custom Configuration file

!!! snippet "Usage"
    ```console
    ./after-effects --config-file <filename>
    ```
    OR
    ```console
    ./after-effects -C <filename>
    ```

You can prefer using custom configuration file you have stored locally [It should be available via local paths or network share. not via ftp or http]. Enabling this option will disable fetching configuration from api-endpoints mentioned or default endpoints.

## Use Custom Version information file

Script always checks if its running the latest version available. If not it throws an error and exits. If you wish to skip that, please use `--no-version-check`. This is always recommended over using a custom version information file. However it is possible to provide a custom version info file, a YAML file which holds version information.

!!! snippet "Usage"
    ```console
    ./after-effects --version-file <filename>
    ```
    OR
    ```console
    ./after-effects -V <filename>
    ```
Example version files are in `api` directory. All the fields are mandatory.

## Do not report statistics

!!! snippet "Usage"
    ```console
    ./after-effects --no-stats
    ```
    OR
    ```console
    ./after-effects -S
    ```
Disables reporting statistics back to server.

Following things are reported. (Nothing more than that)

- A UUID generated for each execution, (its random and is not persistent across runs),
- Host-name,
- Last exit code,
- Amount of RAM & CPU Model
- Number of GPU & GPU Vendor
- System Architecture (x64/x86/ARM/ARM64),
- Total execution time,
- Distribution name (Ubuntu, Linux Mint etc.),
- Distribution code name (bionic, artful etc),
- Feature/Task(s) selected,
- Flags used,
- Timezone and system language.

??? question "Privacy Concerns?"
    - If you are freaking out, its a shell script !! You can literally look into it and check what's collected. Why if you ask? I mostly use it on a bunch of machines/VMs and would like to keep an eye on how it did.
    - Data will be stored in AWS DynamoDB and Google Firebase Real-time Database.
    Data will not be shared with any third party. Period. Only me or my team members will have access
    to it. If you run a search query on google, it probably collects more data than me. API endpoints may log your IP addresses but script does not and WILL not collect IP addresses. (Github, Google and AWS).
    - If you flood the reporting endpoints, you might get HTTP 429 errors as reporting endpoints have rate limits. Script will exit with code 59.

## Version
!!! snippet "Usage"
    ```console
    ./after-effect -v
    ```
    OR
    ```console
    ./after-effects --version
    ```
This will display version info. You do not have to be root to run this. For all the other tasks you need to be root or use sudo.
