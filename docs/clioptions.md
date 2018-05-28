# Command line options

## Simulating package installation

!!! snippet "Usage"
    ```
    ./after-effects -s
    ```
    OR
    ```
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

??? bug "Exceptions"
     - **Simulate flag will not simulate or honor adding Repositories or PPAs.**
     - If you want to revert the changes please use **Reset Repositories** option.
     - PPAs and repositories will be added regardless of the flag.
     - Python package installation cannot be simulated. (pip lacks support for it) The script will skip installing apt dependencies and python packages, if simulate option is used.
      it simulate option is used.
     - APT package upgrades and apt repository metadata updates cannot be simulated. Only a list of packages upgrade-able will be listed in the log file in case of upgrades.
     - Simulate flag will not simulate installing dependencies for adding or deleting repositories and PPAs.

## Skip Version Checks

!!! snippet "Usage"
    ```
    ./after-effects --no-version-check
    ```
Script will warn you and exit if you are not running latest version of the script. You can skip that by using the above option.

## Fix for latest Ubuntu releases


!!! snippet "Usage"
    ```
    ./after-effects -f
    ```
    OR
    ```
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
    ```
    ./after-effects -y
    ```
    OR
    ```
    ./after-effects --yes
    ```

From v3.0 onward, you will be asked for confirmation before performing the task selected. If you would like to bypass this on a CI environments like TRAVIS or for any other reason, you can do so by running the script with `sudo ./after-effects -y` or `sudo ./after-effects --yes`

## Purge not required packages

!!! snippet "Usage"
    ```
    ./after-effects -d
    ```
    OR
    ```
    ./after-effects --deboalt
    ```

Usually Ubuntu comes with some pre-installed games, packages which you sometimes do not need. This option is a switch to used in purging these packages mentioned in the subsequent sections. Since it is possible that user might purge necessary packages like sudo or other core system components, these just acts like a barrier from accidentally doing so.

!!! warning  
    This flag **MUST** be passed, if you intend to purge packages from system. Otherwise you will receive an error.

## Delete log file

!!! snippet "Usage"
    ```
    ./after-effects -l
    ```
    OR
    ```
    ./after-effects --delete-log
    ```

Just a quick way to delete logs generated by this script.

!!! bug "Flag priority"
    If you pass `-l` in the beginning rest of the commands will be ignored, as the script exits after deleting the log!

## Keep downloaded DEB files

!!! snippet "Usage"
    ```
    ./after-effects -k
    ```
    OR
    ```
    ./after-effects --keep-debs
    ```
Keeps packages cached by APT and downloaded DEB packages.
Default behavior is to clean apt cache and delete downloaded DEB packages.

!!! bug "Python packages"
    Python package installation does not use cached packages. (It uses `--no-cache-dir` falg)

## Enable pre & post task hooks

!!! snippet "Usage"
    For pre task hooks
    ```
    ./after-effects --enable-pre
    ```
    For post task hooks
    ```
    ./after-effects --enable-post
    ```

There is an option to execute set of scripts defined in configuration files, before and after all the tasks are complete.
They are disabled by default and need to be enabled via `enable-pre` and `--enable-post` options. They can be used independently of each other. See Tasks section for more details on pre-post hooks.

## Do not report statistics

!!! snippet "Usage"
    ```
    ./after-effects --no-stats
    ```
    OR
    ```
    ./after-effects --no-reporting
    ```
Disables reporting statistics back to server.

Following things are reported. (Nothing more than that)

- A UUID generated for each execution, (its random and is not persistent across runs),
- Host-name,
- Last exit code,
- System Architecture (x64/x86/ARM/ARM64),
- Total execution time,
- Distribution name (Ubuntu, Linux Mint etc.),
- Distribution code name (bionic, artful etc),
- Feature/Task(s) selected,
- Flags used,
- Timezone and system language.

!!! warning
    Disabling stat reporting will also disable remote config.

??? question "Privacy Concerns?"
    - If you are freaking out, its a shell script !! You can literally look into it and check what's collected. Why if you ask? I mostly use it on a bunch of machines and would like to keep an eye on how it did.
    - Data will be stored in AWS DynamoDB and Google Firebase Real-time Database.
    Data will not be shared with any third party. Period. Only me or my team members will have access
    to it. If you run a search query on google, it probably collects more data than me. API endpoints may log your IP addresses. (Github, Google and AWS).
    - If you flood the reporting endpoints, you might get HTTP 429 errors as reporting endpoints have rate limits. Script will exit with code 29.
