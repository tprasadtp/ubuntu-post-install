# Command line options

## YAML Configuration file

!!! snippet "Usage"

    ```console
    ./after-effects --config-file <filename>
    ```

    OR

    ```console
    ./after-effects -C <filename>
    ```


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

- This option will simulate installing packages mentioned in the config, using the apt-get in-built dry-run option `apt-get install -s` to simulate the installation of packages.
- This option can be used to check if the config is compatible/available in the repository.
- Installation of DEB files also behaves similarly. It uses `dpkg -i --dry-run` to simulate installation.
- Its a very good idea to simulate installation when you have reconfigured the apps and packages in the config to check what might be error prone.
- DEB package files, binaries **will** be downloaded unlike apt-get package installs.

??? bug "Exceptions - Not everything can be simulated"

     - **Simulate flag will not simulate adding Repositories or PPAs.**
     - If you want to revert the changes please use **Reset Repositories** option.
     - PPAs and repositories **will** be added regardless of the flag.
     - Python package installation cannot be simulated. (pip lacks support for it) The script will skip installing apt dependencies and python packages, if simulate option is used.
     - APT package upgrades and apt repository metadata updates cannot be simulated. Only a list of packages will be shown in the logs.
     - Simulate flag will **NOT** simulate installing dependencies for adding or deleting repositories and PPAs.

## Skip Version Checks

!!! snippet "Usage"

    ```console
    ./after-effects --no-version-check
    ```
    OR

    ```console
    ./after-effects -N
    ```

Script will warn you and exit if you are not running latest version of the script. You can skip that by using the above option.
This will also disable reporting usage stats.

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

Usually it takes a while for additional Repositories (Docker, Google Cloud SDK etc) to add support for latest release of Ubuntu. However we can use the previous release for which packages are available. So, using packages built for previous release works fine most of the time. This is also good fix if you are running a alpha or beta release of Ubuntu. These options only work on Ubuntu or distros using ubuntu code-names and Linux Mint.

- By default this option is disabled.
- Repositories like Spotify and Google Chrome do not use code names in their repository URLs. So the above workaround is not necessary.
- Derivatives of Ubuntu will use the code name of Ubuntu on which they are based. For example Linux mint 18.2 Serena will use code name `xenial` as it is based on Ubuntu 16.04 Xenial Xerus
- This option applies only for the latest release mentioned in the variable `code_name_latest_release`. and will be ignored if the release is not latest.

## Fix fallback to LTS

!!! snippet "Usage"

    ```console
    ./after-effects --fix-mode-lts
    ```

Use LTS as fallback. This flag should be used in conjunction with `--fix` Otherwise it will be ignored. Instead of using previous Ubuntu release this will use the Last LTS release. i.e if you are on disco and use this bionic repositories will be used. Please use this with caution as it may not work.


??? danger "Note for Pre-Release/ development version of Ubuntu/Debian"

    - If you are using a pre-release version of Ubuntu, you can use `--pre-release` flag to apply the above mentioned fix to pre-release version of Ubuntu.
    - This flag can be used independent of `--fix`. If both are used together then both flags will be applied if the release is upcoming-release.
    - If the release is stable, only `--fix` flag will be valid and `--pre-release` is ignored.
    - Eg:  If the repositories are  not available for latest stable release as well, go back a release. Ex. If the pre-release is 18.04 and the repositories is not available for 17.10 as well, we use 17.04 repositories. Usually happens in first few days of development cycle of 18.04.

## Purge not required packages

!!! snippet "Usage"

    ```console
    ./after-effects -d
    ```

    OR

    ```console
    ./after-effects --purge
    ```

Usually Ubuntu comes with some pre-installed games, packages which you might not need. This option is a switch to used in purging these packages mentioned in the subsequent sections. Since it is possible that user might purge necessary packages like sudo or other core system components, these just acts like a barrier from accidentally doing so.

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
    If you pass `-l`  rest of the commands will be ignored, as the script exits after deleting the log!

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

## Hide configuration data

!!! snippet "Usage"

    ```
    ./after-effects --hide-config
    ```

  OR

    ```console
    ./after-effects -H
    ```

Hides displaying configuration data in the output.

## Remote YAML configuration file

!!! snippet "Usage"

    ```console
    ./after-effects --remote-yaml <URL to YAML file>
    ```

    OR

    ```console
    ./after-effects -R <URL to YAML file>
    ```

You can specify YAML file to use. Script will fetch it and parse it.The file should be available without any interactive logins.

!!! warning
    - If using GitHub gists, please provide raw gist URL.
    - You should only use trusted remote configurations. As its a bash script a malicious remote configuration can cause remote code to execute on your system.


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

Following might be reported. (Nothing more than that)

- A UUID generated for each execution, (its random and is not persistent across runs),
- Last exit code.
- System Architecture (x64/x86/ARM/ARM64).
- Total execution time.
- Distribution name (Ubuntu, Linux Mint etc.)
- Distribution code name (bionic, artful etc)
- Timezone and system language

??? question "Privacy Concerns?"

    - If you are freaking out, its a shell script !! You can literally look into it and check what's collected. Why if you ask? I mostly use it on a bunch of machines/VMs and would like to keep an eye on how it did.
    - Data will be stored in AWS DynamoDB and Google Firebase Real-time Database.
    Data will not be shared with any third party. Period. Only me or my team members will have access
    to it. If you run a search query on google, it probably collects more data than me. API endpoints/PaaS/IaaS provider may log your IP addresses, but script does not and WILL not collect IP addresses(local or otherwise).
    - Script will not collect your full config file either. Just flags used (like simulate, fix etc)
    - If you flood the reporting endpoints, you might get HTTP 429 errors as reporting endpoints have rate limits.

## Version

!!! snippet "Usage"

    ```console
    ./after-effect -v
    ```

    OR

    ```console
    ./after-effects --version
    ```

This will display version info. You do **not** have to be root to run this. For all the other tasks you need to be root or use sudo.

## Autopilot Mode

Autopilot mode is designed to run the script in a non interactive manner. Please see Autopilot in tasks for more info.

## Help

Displays this help option.

```console
➜ ./after-effects --help

A Post Installation Script for Ubuntu/Debian/Linux Mint
Usage: after-effects   [options]

Non-Action options (can be run as non-root user)
-------------------------------------------------
[-v --version]     Display version info
[-h --help]        Display this help message

Configuration Options
-------------------------------------------------
[-c | --config-file]   Local yaml config file
[-n | --name]          Name of the configuration file to use
                       as a query parameter when -R / --remote-yaml is used
[-R | --remote-yaml]   Use config yaml hosted somewhere else
[-V | --version-file]  Specify a local file from which version info will be read

The following options are "action" options and
these will make changes to your system depending on
tasks chosen.
-------------------------------------------------
[-d | --purge]         Enable Purging packages
[-f | --fix]           Fix codenames for new releases
[-p | --pre-release]   Same as --fix but for beta/alpha releases
[--fix-mode-lts]       Similar to --fix but fallback to last LTS
                        Should be used with --fix
[-k | --keep-debs]     Do not invoke apt-clean & do not delete
                       downloaded deb packages
[-l | --delete-log]    Delete logfile (./log/after-effects.log)
[-s | --simulate]      Try not make changes to system and use --dry-run
                       whenever possible. Please read the documentation
                       at http://ae.prasadt.com/clioptions to know its limits
                       Not everything can be simulated.

Other Options
-------------------------------------------------
[-E | --skip-env-checks]  Skip some env checks
[-N --no-version-checks]  Skip checking for latest version
[-H --hide-config]        Hide configuration table
[-S | --no-stats]         Do not report usage statistics
[--use-uf-mirror | -u]    Use University of Freiburg mirrors
[-A --autopilot]          Enables AUTOPILOT mode(No Prompts)

GitHub & Documentation:
* https://github.com/tprasadtp/ubuntu-post-install
* https://ae.prasadt.com

Contributions & Issues:
-------------------------------------------------
* You are welcome to contribute
* Feel free to create a PullRequest/Issue on Github.
* If it helped go and star the repo
-------------------------------------------------
```
