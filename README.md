# Ubuntu Post Installation Script : after-effects

A bash script to setup your fresh install of Ubuntu. Please read the [FAQ](#fix-for-latest-ubuntu-releases)
 before trying out.

# Project Status Data
##  Build Status
[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.svg?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)

## Releases
[![Latest Version](https://img.shields.io/github/release/tprasadtp/ubuntu-post-install/all.svg?label=Latest)](https://github.com/tprasadtp/ubuntu-post-install/releases) [![Latest Version](https://img.shields.io/github/release/tprasadtp/ubuntu-post-install.svg?label=Stable)](https://github.com/tprasadtp/ubuntu-post-install/releases) [![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)](https://github.com/tprasadtp/ubuntu-post-install/commits/master)

## License
[![license](https://img.shields.io/github/license/tprasadtp/ubuntu-post-install.svg)](https://github.com/tprasadtp/ubuntu-post-install)


## URLs
```sh
# Main repository
Github URL: https://github.com/tprasadtp/ubuntu-post-install
Github URL: https://github.com/tprasadtp/after-effects-ubuntu

# Data Submodule
Github URL: https://github.com/tprasadtp/ubuntu-post-install-data
```



# How to use this?
## Step 0: Install Ubuntu
- Install (if you haven't already) your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use preseed.cfg file)

## Step 1: Get the script
### CLI way (Git not required)
  - Run this in Terminal

  ```sh
  wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash
  ```

### With Git
  - If you already have git on your system you can use
  ```sh
  git clone --recursive --depth 1 https://github.com/tprasadtp/ubuntu-post-install.git && cd ubuntu-post-install
  ```

### Without Git GUI way (mostly)
  - Use git or the command line way it's much much easier trust me!!
  - Download this repository [here](https://github.com/tprasadtp/ubuntu-post-install/archive/master.zip)
  - Download the list files from [here](https://github.com/tprasadtp/ubuntu-post-install-data/archive/master.zip)
  - Unzip these files.
  - Move all the .list files in `ubuntu-post-install-data-master` to `ubuntu-post-install-master/data/` directory.
  - make sure that `after-effects` is executable.
  - Open Terminal in current directory and execute after-effects as root. `sudo ./after-effects`


## Step 2: Update the lists to suit your needs (Optional)
Update the list files to suit your needs. Change PPAs, add or delete packges to list, tweak booleans etc.

> First time you might want to use simulate flag. `sudo ./after-effects -s`

## Step 3: Run the script
Run the script as **root**
```sh
sudo ./after-effects
```

> It is essential to run this script as root since most actions performed by the script require root privileges. However if you are running this in a docker container, you probably are root and its possible that you might be missing `sudo`. So In that case just run it as `./after-effects` Be warned! You might be missing several other dependencies as well!!

## Step 4: Contribute back!
Contribute tweaks, improvements ideas back upstream. No matter how small the change is
I really appreciate feedback and contributions.

## Contributing & Forks
See [Contributing and forks](./.github/CONTRIBUTING)

# FAQ
## What this script/repository for?
This Script is for automating the installation and configuration of a Fresh Ubuntu/Linux-Mint/Elementary installation.

## What are its dependencies? What do I need on my system to run this?
Usually nothing extra! Your base Ubuntu install comes with all the commands/utilities this script uses, unless you are running this on Ubuntu docker image.
- The script itself depends on following utilities which are usually present on a typical Ubuntu/Ubuntu based installation.
`lsb-release, whiptail, wget, iputils-ping, bash`
- Some functions of the script (Add, Remove PPAs and add Repositoris) depend on following dependencies.
```
apt-transport-https
ca-certificates
curl
ppa-purge
software-properties-common
```
They will be installed if necessary, without confirmation.

## What all distributions are supported/recognized by this script?
- In short? Ubuntu, its official flavors (Kubuntu,Ubuntu Mate etc) and Linux Mint and Elementary derivatives of the supported Ubuntu release.
- Currently Supported Ubuntu versions and their Linux Mint and Elementary counterparts are supported. But Travis CI tests are run only on Ubuntu versions.
- Following is the list of distributions/versions supported.
```
Ubuntu 17.10        Artful Aardvark
Ubuntu 18.04        Bionic Beaver (Experimental Support for Upcoming Release)  
Ubuntu 17.04        Zesty Zapus
Ubuntu 16.04        Xenial Xerus
Ubuntu 14.04        Trusty Thar
Linux Mint 17       Quina
Linux-Mint 17.1     Rebecca
Linux-Mint 17.2     Rafaela
Linux-Mint 17.3     Rosa
Linux Mint 18       Sarah
Linux-Mint 18.1     Serena
Linux-Mint 18.2     Sonya
Linux-Mint 18.3     Sylvia
Elementary-OS       Freya
Elementary-OS       Loki
Elementary-OS       Juno (Upcoming Release)
Official Ubuntu Flavors for above mentioned Ubuntu releases.
```
- Though 32 bit is supported, Testing in Travis CI, containers and locally all are done using 64 bit machine, host, vm and containers. If something breaks please report it and use it with caution.
- Support for Ubuntu 18.04 Daily builds, Elementary OS Juno and Mint 18.3 is **experimental** and things might break. They have not been released in stable release channels and are considered beta/ alpha or development versions of the release. It is strongly advised to use them in a chroot or a virtualized environments and not as a daily driver.
- Linux mint 18.3 uses a new appstore from which you can directly install Chrome and other popular tools. There may be some conflicts in the `/etc/apt/sources.list.d` where single repository is configured multiple times with same priority. Use it with caution. The scripts are not tested on Travis on Linux Mint. However in most cases it should be fine as it works well with Xenial.
- Tests for Bionic are done using docker images from `https://partner-images.canonical.com/core/bionic/` or `http://cdimage.ubuntu.com/ubuntu-base/daily` and are **allowed*- to fail on travis CI jobs.

>   **Script will exit if it does not recognize the distribution.**

## What if I get an error saying Unknown Distribution/Release?
That usually means you are running a Distribution which is not supported or too old or a derivative which is not recognized by the script. However it also might be possible that `lsb-release` package is missing from your system. Since the script depends on it for determining what is the codename of the release it will fail.
You might see ans error like this,
```
./after-effects: line 41: lsb_release: command not found
./after-effects: line 42: lsb_release: command not found
./after-effects: line 43: lsb_release: command not found
./after-effects: line 44: lsb_release: command not found
[    Notice     ] Following details were recognised by the Script.
[     Info      ] Distro:
[     Info      ] Version:
[     Info      ] Code Name:
[     Info      ] Architecture: amd64
[     Info      ] Path for sources.list.d: /etc/apt/sources.list.d
[    WARNING    ] Will automatically assume yes for all the options available in the script!
[   Simulating  ] is set to true
[  Derivatives  ] Checking for Ubuntu based Distributions
[     Error!    ] Unknown Distribution/Release.
[    Notice     ] This Script is not designed to run on this () distro/release.
```
- It means that you do not have _lsb-release_ package installed. It happens usually on docker containers. See [What are its dependencies? What do I need on my system to run this?](#what-are-its-dependencies-what-do-i-need-on-my-system-to-run-this)
- Install `lsb-release` package using `apt-get -y install lsb-release`
- In the case above you are probably missing other dependencies as well. It might be a good idea to install those dependencies first.

## Linux Mint 17.X and PPA priorities
> This applies only for Linux Mint 17, 17.1 17.2

- For some reason, The Mint Team decided to make their repository packages set with a priority of 700 in order to overwrite Ubuntu’s priorities. PPAs typically issue a priority of 500, so due to the priority that Mint set, packages provided by the PPA which are already in the official mint repository (upstream Ubuntu as well) are completely ignored. workaround is to set the priorities to lower for default repositories say 500 in /etc/apt/preferences.d/ or to increase priorities of PPAs to higher (more than 700).
- This was changed in Linux Mint 17.3 and no need to change the priorities unless it provides upstream Linux Mint packages.
The release notes for mint 17.3 says

>  The "upstream" component of the Linux Mint repositories was kept at priority 700.
All other components ("main", "import", "backport", "romeo") as well as the "extra" repository, had their priority lowered to 500.

## What all command line options do I have and how do I use them?
### Simulating package installation
- . **`-s` or `--simulate`**

  - This will simulate installing packages mentioned in the lists (More on that later) using the apt-get inbuilt dry-run option `apt-get install -s ` to simulate the installation of packages. Nothing will be downloaded except repository metadata  (deb files if option is chosen). Packages will not be installed.
  - This option can be used to check if the files in the lists are compatible/available in the repository.
  - When this option is passed, upgrade_system will not be run. Only a list of packages upgradeable will be listed in the log file.
  - Installation of DEB files also behaves similarly. It uses `dpkg -i --dry-run` to simulate installation.
  - Its a very good idea to simulate installation when you have reconfigured the apps and packages in the list to check what might be error prone.
  - In case of DEB files, they **WILL*- be downloaded unlike apt-get package installs.

  - **Simulate flag will not simulate Adding Repositories or PPAs.**
  - If you want to revert them please use Reset Repositories option.

## Fix for latest Ubuntu Releases
- **`-f` or `--fix`**

  Usually it takes a while for additional Repositories (Docker. google cloud sdk etc) to add support for latest release of Ubuntu. However we can use the previous release for which
  packages are available. So usually using packages built for previous release works fine most of the time. This is also good fix if you are running a alpha or beta release of Ubuntu.
  Following repositories  which use this fix.
  ```
  google-cloud-sdk
  gcsfuse
  insync
  Docker-CE
  WineHQ
  ```
  - By default this option is disabled.
  - Use `sudo ./after-effects -f` or `sudo ./after-effects --fix` to enable this.

  - Repositories like Spotify and google chrome do not use codenames in their repository urls. So the above workaround is not necessary.
  - Derivatives of Ubuntu will use the codename of ubuntu on which they are based. For example Linux mint 18.2 Serena will use codename xenial since it is based on Ubuntu 16.04 Xenial Xerus
  - This option applies only for the latest release mentioned in the variable `code_name_latest_release`. and will be ignored if the release is not latest.
  - Variables in current version are (As of Dec 2017)
  ```
  readonly code_name_latest_release="artful"
  readonly codename_previous_release="zesty"
  readonly codename_upcoming_release="bionic"
  ```
  change them if necessary.

  > If you are using a pre release version of Ubuntu, you can use `--pre-release` falg to apply the above mentioned fix to pre-release version of ubuntu. This flag can be used independent of `--fix`. If both are used together then both flags will be applied if the release is upcoming-release. otherwise if the release is stable only `--fix` flag will be valid and `--pre-release` is ignored.
  This is how it works:  If the repositories are  not available for latest stable release as well, go back a release.
  Eg. If the pre-release is 18.04 and the repo is not available for 17.10 as well, we use 17.04 repositories.
  Usually happens in first few days of development cycle of 18.04.


## Say Yes To All
- **`-y` or `--yes`**

  From v3.0 onwards you will be asked for confirmation before performing the task selected. If you would like to bypass this on a CI environments like TRAVIS or for any other reason, you can do so by running the script with `sudo ./after-effects -y` or `sudo ./after-effects --yes`

## Purge not required pacakges
- **`-d` or `--deboalt`**

  Usually Ubuntu comes with some pre-installed games, packages which you sometimes do not need. This option is a switch to used in purging these packages mentioned in the subsequent sections. Since it is possible that user might purge necessary packages like sudo or other core system componetnts, these just acts like a barrier from accidentally doing so.

  > This flag **MUST** be passed if you intend to purge packages from system. Otherwise you will receive an error.

### Delete log file
- **`-l` or `--delete-log`**

  Just a quick way to delete logs generated by this script.
  > If you pass -l in the beginning rest of the commands will be ignored, as the script exits after deleting the log!


# What all This Script can do? and How Can I configure it for my needs?

This Script is written to be as flexible as possible. The script itself does not contain any packages or ppas to be added or deb files to installed. Configurations live in directory /data. There are .list files for each purpose containing the necessary data and are easy to configure for your needs.

## Update Repositories
This will update repository metadata. Errors might occur if there is missing key or mis-configured repositories.
> Sometimes it is possible that some errors might occur even though the log says successfully updated. Its because script checks for exit status of the apt-get update command and its zero even if there are some errors. So use it with caution.

## Upgrade packages to Latest
This will perform Update repositories as well as it will upgrade all the upgradeable packages on the system.

> If simulate argument is passed, then only list of upgradeable packages will be written to log, and upgrade will not be performed.

## Add Common Repositories
This will add the following repositories.
- Insync
- Google-Cloud-SDK
- Google-Cloud GCSFUSE
- Docker-CE (default add repository)
- WineHQ (Latest wine builds): By default this repository is not added.
> Please note that the above repositories are sometimes not updated for latest Ubuntu release and most certainly will not be available for upcoming release of Ubuntu(Alpha/Beta). It might take some time till the repositories are available for the latest release. Use -f or --fix command line option or --pre-release in case you are using a Development version of ubuntu to revert using latest available version of repositories (usually previous Ubuntu release or in case of Beta/Alpha latest stable release of ubuntu). [For more info see command line options.](#fix-for-latest-ubuntu-releases)

- Google Chrome
  > Please note that Google Chrome doesn't support 32 bit architecture use Chromium.

- Google Earth
- Spotify
- Visual Studio Code

Following repositories are conditional and are determined based on the flags or conditions set.
- Canonical Partner repositories

  Canonical partner repositories are not configured or enabled for derivatives of Ubuntu because they have their own config file.

- WineHQ & Docker-Community-Edition (default do not add)

  WineHQ and Docker-CE have a boolean switch mentioned in beginning of the script and by default are as follows. Change according to your needs. If you re using 16.04 and above leaving this unchanged is the best option.


```
#============================ Switches/ bools ================================
# Latest wine builds
readonly add_winehq_repo=false

#Docker community edition
readonly add_docker_repo=true
```

## Add PPAs
- PPAs can be added using the configuration file in data directory `./data/ppa.list`
- This file **SHOULD** contain only one ppa entry per line (NO comments or anything else anywhere in the file)
in the format ppa:<author>/ppa for example `ppa:mozillateam/firefox-next`
The file will be read and the PPAs will be added from the list.
- Logs will  show entry in the format `[<date and time>] [  PPA  ] <log>`

### Note:
- PPAs should be checked before they are added to the list. Sometimes PPAs listed in the file may not be available for all releases
- Peek ppa is not available for trusty and is not included in tests.
- **PPAs are not added on travis tests on Pre-Release/Beta/Daily builds of Ubuntu.**

## Install Apps
- Packages can be installed by using configuration lists in the data directory. This works similar to ppa list However its slightly different.
- There is one master list or list of lists which contains the path to the list files from which the packages are to be installed.
- This master list should contain the full path/ relative to the root of the project to the file containing the list.
- packages in the files will not be installed if that file does not appear in the master list.
- It helps keeping things separate for separate machines or needs. Minimal edit is required to switch from one list to another than rewriting the entire list file.
- The Master list is named `app-list.list` and **MUST** only contain the list files one entry per line. **NO** comments or anything else is allowed.
- Individual list files for different needs are to be written in similar way containing name of the package to be installed in one package per line format as before. similar to all the lists there **SHOULD NOT** be any comments or text or empty lines in those list files.
- You can split files according to your needs and write your list of packages to be installed and only include the lists in the master list file which you intend to install.
- It is a good idea to include packages from external repositories in a different list than others because they might fail sometimes.
- Make sure that all the packages in the lists are available for your release. Using `-s` command line option helps. Also check for the logs for any errors or conflicts.

## Install DEB files
This will install deb files specified in the list deb-files.list
- Logs will  show entry in the format `[<date and time>] [  PKG  ] <log>` for dpkg actions and
- APT Logs will  show entry in the format `[<date and time>] [  APT  ] <log>` for actions performed by apt commands. (`apt-get install -f` for missing packages)
- **Simulate** option will use `--dry-run` option in dpkg to Simulate DEB installation.
- Configuration file is similar to that of PPA and package lists, but with one difference.
- Each DEB file to be installed should have following entry.
- URL to the deb file which can be accessed using wget <tab or space> Name of the deb file without any spaces or special chars except hyphen.
- For example to install Atom Editor the deb-files.list should look like below.
```
https://atom-installer.github.com/v1.21.1/atom-amd64.deb  ATOM-Editor.deb
```
first part is the URL to the deb file separated by a tab name of the file.
> Please note that deb file will be  saved with the name mentioned in the file. (DEB file is named **exactly** as mentioned in the second field. So if you want them to be named with extension .deb include that in the second field and avoid illegal chars)

## Purge Unwanted Packages
This will purge Unwanted packages from the system.
- The packages mentioned in the list purge.list will be purged
- The format of the purge.list is similar to that of packages, one packages per line of the file and no comments or anything else.
> It is necessary to pass command line argument `-d` or `--deboalt` to run this task. Otherwise task will be aborted.

## Reset repositories
- This will reset the repositories added by this script, and purge ppas added by this script in the list ppa.list.
- This will **NOT** reset or remove repositories added by the DEB files.
- Simulate option has no effect on this action and ppa-purge **WILL*- downgrade packages if necessary.

  > This will **NOT** remove PPAs or repositories you have added manually or those added while installing DEB files.

## All In one
This will perform Following actions. (In the following order)
- Update repository metadata
- Upgrade packages
- Add repositories
- Add PPAs in the list file
- Install Apps
- Install DEB files

This option will honor --yes and --simulate options as individual tasks would do.

## Delete log file
A log file is generated containing all the output generated by the apt and other commands and contain generic information and errors .
- This task will delete the log file `after-effects.log`.
- Log file is located in the directory `after-effects-logs` in folder which you ran thin script.
- Sometimes errors might not be written to log file but displayed on screen and vice-versa.
- Please verify that everything went okay by checking the log file.


# Screenshots
![Details](/screenshots/details.png)
![Whiptail-Options](/screenshots/whiptail.png)


# Logs
Logs are written to a file `<current-dir>/after-effects-logs/after-effects.log`. Timestamps in the logs may not be accurate because some commands buffer outputs.

# CI and Testing
Following Tests are done on travis-ci.

- shellcheck every executable script (Job #build.1)
- Run the Script in simulate mode on Travis CI in Ubuntu Trusty image (Not since Version 3.1)
- Run the Script in simulate mode on Travis CI in docker image built using Dockerfiles in `/dockerfiles` directory
- Test on Artful container (Job #build.2)
- Test on Xenial container (Job #build.3)
- Test on Zesty  container (Job #build.4) (Will be deprecated in January 2018)
- Test on Bionic Beaver daily images (Job #build.5) from `http://cdimage.ubuntu.com/ubuntu-base/daily/`
- Dockerfiles used for building the image are in `/dockerfiles` directory, they use official Ubuntu base images with script dependencies.
- Dockerfile for Bionic is using `http://cdimage.ubuntu.com/ubuntu-base/daily` root file system, as official images are not available yet.
- Test scripts are located in `/tests` directory.
- Since its a time consuming process only simulated install is done on CI. Linux mint and Elementary are not tested in containers as of now, but will be in the future.
- It is possible that there might be some errors specific to your setup. Please report if so. It is **Strongly** advised to try install apps and deb files in simulate mode first before proceeding with actual installation.

Use this script with caution! Though I have tested it on VMs and Travis something might break in your setup. Check the logs if script appears to be stuck.


# Changelogs

## _v3.2_
  - Drop CI tests on Trusty Its painful to maintain lists for Trusty as many PPAs and packages are not available or have a different name. Trusty is still supported but Travis CI tests will not be run on Trusty as host or in container. So use it with caution. End user will probably change the list anyway so it doesn't matter.  
  - Switch to submodules for data directory
  - List files have their own repo now.

## _v3.1_
 ##### Added Support for Ubuntu Bionic Beaver
  - Added Support for Upcoming Ubuntu release bionic.
  - Added an option to use repository for last stable release on bionic.
  - Use Ubuntu Base 18.04 LTS (Bionic Beaver) daily build to build docker image.
  - Allow Bionic tests to fail on Travis CI.
  - Dockerfiles & tests for bionic.
  - Inform in script if running on Upcoming release.
  - Drop google-cloud-sdk from fix_repo_not_available. Use `--pre-release` if using beta/alpha Ubuntu release.
  - Add Visual studio to repos instead of deb files
  - Rename logging directory to after-effects





## _v3.0_

**Following Changes are in v3.0**

- ##### Confirmation dialogs
  - Add Confirmation dialog using whiptail for Actions like Adding PPA, Repositories, Installing Apps, and Deb files
  - Provide an option via command line to bypass the confirmation dialog for ci and automated environments or when its too annoying

- #### Improvements to Simulate option
  - If the simulate option is selected then Only calculate the upgrade but do not perform upgrade.
  - Added improved Simulate options. Helpful when just want to change somethings and test scripts without really downloading and installing packages
  - Simulate option is by default false and can be toggled by passing `-s` or `--simulate` while running the script via command line
- #### Partner repositories and Derivatives
  - Do not Enable Canonical Partner repositories in Ubuntu derivatives as they are enabled in installer or are different than Ubuntu. This leaves Partner repositories as they were before
- #### Purge Unwanted Packages
  - Fix a bug in PPA purge function where it would wait for user confirmation
  - Add a feature to purge not required packages, usually games and boaltware which comes preloaded  with the install. It is necessary to pass a flag `-d` via command line to purge them while running the script since its dangerous
- ##### Logs & Console messages
  - Improved logging . Redirecting errors and adding time-stamps works better.
- ##### Travis CI and Docker Testing
  - Added Dockerfiles used for test cases since base Ubuntu image does not have few necessary packages (`ping, wget, lsb-release, whiptail, iputils-ping`) and configuration required. Since most of these are bound to present on Ubuntu/Ubuntu Server/ Ubuntu derivatives it is not necessary to add them in the script.
  - Added Docker and Travis CI detection . Now the logs will indicate if the script is running in Container or Travis CI
  - Test Script on Travis CI in parallel using jobs.
  - Test Script on Trusty using Travis Host
  - Test Script on Xenial, Artful and Zesty using Docker image build using Dockerfiles.
- #### Others
  - Fixed Bugs
  - Fixed Typos and spell errors
  - Fixed a bug where exiting script via pressing escape would cause message to be printed twice
  - Improved exit status handling

## _v2.0_
  - Complete rewrite from scratch
  - Improvements in logging and console output
  - Reduced verbosity in terminal output
  - Flexible with packages and deb files
  - Reduced complex dependencies
  - Easy to configure
  - Add Simulate install option for installing deb files and apps. Easier to test scripts now .


## _v1.0_
  - Initial upload.

[![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)](https://prasadt.com/google-analytics-beacon)
