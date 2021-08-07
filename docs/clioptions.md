# Command line options

## Help

Displays this help option.
<pre>./after-effects<font color="#00AFFF">-h</font>
A Post Installation Script for Ubuntu, Debian,
Linux-Mint, elementaryOS, Pop!_OS, MX Linux etc.

<font color="#FFD700">USAGE: </font>
  [sudo] ./after-effects [OPTION]... config-file|config-url

<font color="#D7FF87">OPTIONS:</font>
  -v,  --version      Display version info.
  -h,  --help         Display this help message.

<font color="#FF8700">CONFIGURATION:</font>
  -A, --autopilot     Enables AUTOPILOT mode(No Prompts).
  -d, --purge         Enable Purging packages.
  -f, --fix           Fix codenames for new releases.
  --fix-mode-lts      Use prevoous LTS release as fallback when using --fix (Ubutnu only).
  -p, --pre-release   Same as --fix but for beta/alpha releases of Ubuntu and Debian.
  -k, --keep-debs     Do not invoke apt-clean after installing packages.
  -l, --delete-log    Delete the logfile. (./log/after-effects.log)

<font color="#FF87D7">LOGS:</font>
  --debug             Prints debug logs.
  --trace             Prints trace level logs which includes output from apt-get and other commands.

<font color="#949494">DEBUG:</font>
<font color="#949494">  -s, --simulate      Try not to make changes to system. See Docs for limitaions!</font>
<font color="#949494">  --no-env-checks     Skip some env checks.</font>
<font color="#949494">  --no-version-check  Skip checking for latest version.</font>
<font color="#949494">  --nx                Just process config and exit.</font>

<font color="#FFAFFF">DOCUMENTATION &amp; BUGS: </font>
  Report bugs to      <font color="#00FFFF">https://ae.prasadt.com/issues</font>
  Documentation       <font color="#00FFFF">https://ae.prasadt.com</font>
  License             <font color="#00FFFF">GPLv3</font>

</pre>

## Simulating package installation

!!! snippet "Usage"

    ```console
    ./after-effects -s <config-file|config-url>
    ```

    OR

    ```console
    ./after-effects --simulate <config-file|config-url>
    ```

??? tip "This flag/option applies to following tasks"

    - Installing apt packages.
    - Installing Debian package archives (DEBs).
    - Installing Python packages.
    - Upgrading system packages.
    - Purging unwanted packages.

Please do have a look at exceptions, as all tasks cannot be simulated.

- This option will simulate installing packages mentioned in the config, using the apt-get's dry-run option.
- This option can be used to check if the configuration and for testing.
- Installation of DEB files also behaves in a similar way. It uses `dpkg -i --dry-run` to simulate installation.
- Its a very good idea to simulate installation when you have reconfigured the apps and packages in the config to check what might be error prone.
- DEB package files and binaries **will** be downloaded unlike apt-get package installs.

??? bug "Exceptions - Not everything can be simulated"

      - **Simulate flag will not simulate adding Repositories or PPAs.**
      - APT package upgrades and apt repository metadata updates cannot be simulated.
      - Snap package installation cannot be simulated
      - In case of static binaries, file will be downloaded, but installation will be skipped.

## Skip Version Checks

!!! snippet "Usage"

    ```console
    ./after-effects --no-version-check <config-file|config-url>
    ```

Script will warn you and exit if you are not running latest version of the script. You can skip that by using the above option.


## Fix for latest Ubuntu releases

!!! snippet "Usage"

    ```console
    ./after-effects -f <config-file|config-url>
    ```

    OR

    ```console
    ./after-effects --fix <config-file|config-url>
    ```

Usually it takes a while for additional repositories (Docker,etc) to add support for latest release of Ubuntu. However we can use the previous release for which packages might be available. Using packages built for previous release works fine most of the time.

- Repositories like Spotify and Google Chrome do not use code names in their repository URLs. So the above workaround is not necessary.
- Derivatives of Ubuntu will use the code name of Ubuntu on which they are based. For example Linux mint 20.2 Uma will use code name `focal` as it is based on Ubuntu 20.04 Focal Fossa
- This option applies only for the latest release and will be ignored if the release is not latest.
- This options cannot be applied for PPAs

??? danger "Note for Pre-Release/ development version of Ubuntu/Debian"

    - If you are using a pre-release version of Ubuntu, you can use `--pre-release` flag to apply the above mentioned fix to pre-release version of Ubuntu.
    - This flag can be used independent of `--fix`. If both are used together then both flags will be applied if the release is upcoming-release.
    - If the release is stable, only `--fix` flag will be valid and `--pre-release` is ignored.

## Fix fallback to LTS

!!! snippet "Usage"

    ```console
    ./after-effects --fix-mode-lts --fix <config-file|config-url>
    ```

Use LTS as fallback. This flag should be used in conjunction with `--fix` Otherwise it will be ignored. Instead of using previous Ubuntu release this will use the last LTS release. i.e if you are on `21.04` and `20.04` repositories will be used. Please use this with caution as it may not work. This has no effect on Debian and its derivatives.


## Purge not required packages

!!! snippet "Usage"

    ```console
    ./after-effects -d <config-file|config-url>
    ```

    OR

    ```console
    ./after-effects --purge <config-file|config-url>
    ```

Usually Ubuntu comes with some pre-installed games, packages which you might not need. This option is a switch to used in purging these packages mentioned in the subsequent sections.

!!! warning

    - This flag **MUST** be passed, if you intend to purge packages from system. Otherwise you will receive an error.
    - If you are using YML config file you **MUST** set `purge_enabled: true` under config.flags. See Example YAML file for more info.

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
    If you pass `-l` rest of the commands will be ignored, as the script exits after deleting the log!

## Keep downloaded DEB files

!!! snippet "Usage"

    ```console
    ./after-effects -k <config-file|config-url>
    ```

    OR

    ```console
    ./after-effects --keep-debs <config-file|config-url>
    ```

Keeps packages cached by APT. Default behavior is to clean apt cache.

## Version

!!! snippet "Usage"

    ```console
    ./after-effect -v
    ```

    OR

    ```console
    ./after-effects --version
    ```

This will display version info. You do **not** have to be root to run this.

## Autopilot Mode

Autopilot mode is designed to run the script in a non interactive manner. Please see Autopilot in tasks for more info.

!!! snippet "Usage"

    ```console
    ./after-effect -A <config-file|config-url>
    ```

    OR

    ```console
    ./after-effects --autopilot <config-file|config-url>
    ```
