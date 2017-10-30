# Ubuntu After Effects

A bash script to setup your fresh install of ubuntu. Please read the FAQ before trying out.


###  Build Status
[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.svg?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)


### Releases
[![Latest Version](https://img.shields.io/github/release/tprasadtp/ubuntu-post-install/all.svg?label=Latest)](https://github.com/tprasadtp/ubuntu-post-install/releases) [![Latest Version](https://img.shields.io/github/release/tprasadtp/ubuntu-post-install.svg?label=Stable)](https://github.com/tprasadtp/ubuntu-post-install/releases) [![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)](https://github.com/tprasadtp/ubuntu-post-install/commits/master)

### License
[![license](https://img.shields.io/github/license/tprasadtp/ubuntu-post-install.svg)](https://github.com/tprasadtp/ubuntu-post-install)


### URL
```
Github URL: https://github.com/tprasadtp/ubuntu-post-install
Github URL: https://github.com/tprasadtp/after-effects-ubuntu
```


### Changelogs


#### _v3.0_
 Following Changes are in v3.0
* ##### Confirmation dialogs
  - Add Confirmation dialog using whiptail for Actions like Adding PPA, Repositories, Installing Apps, and Deb files
  - Provide an option via command line to bypass the confirmation dialog for ci and automated environments or when its too annoying

* #### Improvements to Simulate option
  - If the simulate option is selected then Only calculate the upgrade but do not perform upgrade.
  - Added Simulation options. Helpful when just want to change somethings and test scripts without really downloading and installing packages
  - Simulate option is by default false and can be toggled by passing `-s` or `--simulate` while running the script via command line
* #### Partner repositories and Derivatives
  - Do not Enable Canonical Partner repositories in Ubuntu derivatives as they are enabled in installer or are different than Ubuntu. This leaves Partner repositories as they were before
* #### Purge Unwanted Packages
  - Fix a bug in PPA purge function where it would wait for user confirmation
  - Add a feature to purge not required packages, usually games and boaltware which comes preloaded  with the install. It is necessary to pass a flag `-d` via command line to purge them while running the script since its dangerous
* ##### Logs & Console messages
  - Improved logging . Redirecting errors and adding time-stamps works better.
* ##### Travis CI and Docker Testing
  - Added Dockerfiles used for test cases since base Ubuntu image does not have few necessary packages (`ping, wget, lsb-release, whiptail, iputils-ping`) and configuration required. Since most of these are bound to present on Ubuntu/Ubuntu Server/ Ubuntu derivatives it is not necessary to add them in the script.
  - Added Docker and Travis CI detection . Now the logs will indicate if the script is running in Container or Travis CI
  - Test Script on Travis CI in parallel using jobs.
  - Test Script on Trusty using Travis Host
  - Test Script on Xenial, Artful and Zesty using Docker image build using Dockerfiles.
* #### Others
  - Fixed Bugs
  - Fixed Typos and spell errors
  - Fixed a bug where exiting script via pressing escape would cause message to be printed twice
  - Improved exit status handling

#### _v2.0_
  - Complete rewrite from scratch
  - Improvements in logging and console output
  - Reduced verbosity in terminal output
  - Flexible with packages and deb files
  - Reduced complex dependencies
  - Easy to configure
  - Add Simulate install option for installing deb files and apps. Easier to test scripts now .


#### _v1.0_
  * Initial upload.


## FAQ
### What this script/repository for?
This Script is for automating the installation and configuration of a Fresh Ubuntu/Linux-Mint/Elementary installation.

### What are its dependencies? What do I need on my system to run this?
Usually nothing extra! Your base Ubuntu install comes with all the commands/utilities this script uses, unless you are running this on Ubuntu docker image.
* The script itself depends on following utilities which are usually present on a typical Ubuntu/Ubuntu based installation.
`lsb-release, whiptail, iputils-ping, bash`
* Some functions of the script (Add, Remove PPAs and add Repositoris) depend on following dependencies
```
apt-transport-https
ca-certificates
curl
ppa-purge
software-properties-common
```
They will be installed if necessary, without confirmation.

### What all distributions are supported/recognized by this script?
* In short? Ubuntu, its official flavors (Kubuntu,Ubuntu Mate etc) and Linux Mint and Elementary derivatives of the supported Ubuntu release.
* Currently Supported Ubuntu versions and their Linux Mint and Elementary counterparts are supported. But Travis CI tests are run only on Ubuntu versions.
* Following is the list of distributions/versions supported.
```
Ubuntu 17.04        Zesty Zapus
Ubuntu 17.10        Artful Aardvark
Ubuntu 16.04        Xenial Xerus
Ubuntu 14.04        Trusty Thar
Linux Mint 17       Quina
Linux-Mint 17.1     Rebecca
Linux-Mint 17.2     Rafaela
Linux-Mint 17.3     Rosa
Linux Mint 18       Sarah
Linux-Mint 18.1     Serena
Linux-Mint 18.2     Sonya
Linux-Mint 18.3     Sylvia (Upcoming Release)
Elementary-OS       Freya
Elementary-OS       Loki
Elementary-OS       Juno (Upcoming Release)
Official Ubuntu Flavors for above mentioned Ubuntu releases.
```
* Though 32 bit is supported, Testing in CI , containers and locally all are done using 64 bit machine, host, vm and containers. If something breaks please report it and use it with caution.  

> Script will **exit** if it does not recognize the distribution.

### What if I get an error saying Unknown Distribution/Release?
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
* It means that you do not have _lsb-release_ package installed. It happens usually on docker containers. See [What are its dependencies? What do I need on my system to run this?](#what-are-its-dependencies-what-do-i-need-on-my-system-to-run-this)
* Install `lsb-release` package using `apt-get -y install lsb-release`
* In the case above you are probably missing other dependencies as well. It might be a good idea to install those dependencies first.


## What all command line options do I have and how do I use them?
### Simulating package installation
> `-s ` or ` --simulate`

* This will simulate installing packages mentioned in the lists (More on that later) using the apt-get inbuilt dry-run option `apt-get install -s ` to simulate the installation of packages. Nothing will be downloaded except repository metadata and the packages will not be installed.
* This option can be used to check if the files in the lists are compatible/available in the repository.
* When this option is passed, upgrade_system will not be run. Only a list of packages upgradable will be listed in the log file.
* Installation of DEB files also behaves similarly. It uses `dpkg -i --dry-run` to simulate installation.
* Its a very good idea to simulate installation when you have reconfigured the apps and packages in the list to check what might be error prone.
* However, in case of DEB files, they **WILL** be downloaded unlike apt-get package installs.

> * **Simulate flag will not simulate Adding Repositories or PPAs.**
> * If you want to revert them please use Reset Repositories option.

### Fix for latest Ubuntu Releases
> `-f` or `--fix`

Usually it takes a while for additional Repositories (Docker. google cloud sdk etc) to add support for latest release of Ubuntu. However we can use the previous release for which
packages are available. So usually using packages built for previous release works fine most of the time. This is also good fix if you are running a alpha or beta release of Ubuntu.
Following repositories  which use this fix.
* By default this option is disabled.
* Use `sudo ./after-effects -f` or `sudo ./after-effects --fix` to enable this.
```
google-cloud-sdk
gcsfuse
insync
Docker-CE
WineHQ
```
* Repositories like Spotify and google chrome do not use codenames in their repository urls. So the above workaround is not necessary.
* Derivatives of Ubuntu will use the codename of ubuntu on which they are based. for example Linux mint 18.2 Serena will use codename xenial since it is based on Ubuntu 16.04 Xenial Xerus
* This option applies only for the latest release mentioned in the variable `code_name_latest_release`. and will be ignored if the release is not latest.
* Variables in current version are
```
readonly code_name_latest_release="artful"
readonly codename_previous_release="zesty"
```
change them if necessary.

### Say Yes To All
> `-y` or `--yes`

From v3.0 onwards you will be asked for confirmation before performing the task selected. If you would like to bypass this on a CI environments like TRAVIS or for any other reason, you can do so by running the script with `sudo ./after-effects -y` or `sudo ./after-effects --yes`

### Purge not required pacakges
> `-d` or `--deboalt`

Usually Ubuntu comes with some pre-installed games, packages which you sometimes do not need. This option is a switch to used in purging these packages mentioned in the subsequent sections. Since it is possible that user might purge necessary packages like sudo or other core system componetnts, these just acts like a barrier from accidentally doing so.
> This flag **MUST** be passed if you intend to purge packages from system. Otherwise you will receive an error.

### Delete log file
> `-l` or `--log`

Just a quick way to delete logs generated by this script.
>  **WARNING**

> If you pass -l in the beginning rest of the commands will be ignored, as the script exits it after Deleting the log!


## What all This Script can do? and How Can I configure it for my needs?

This Script is written to be as flexible as possible. The script itself does not contain any packages or ppas to be added or deb files to installed. Configurations live in directory /data. There are .list files for each purpose containing the necessary data and are easy to configure for your needs.

##### Update Repositories
This will update Repositories metadata. Errors might occur if there is missing key or misconfigured Repositories.
> Sometimes it is possible that some errors might occur even though the log says successfully updated. Its because script checks for exit status of the apt-get update command and its zero in spite of those errors use caution.

##### Upgrade packages to Latest
This will perform Update repositories as well as it will upgrade all the upgradeable packages on the system.

> If simulate argument is passed, then only list of upgradeable packages will be written to log, and upgrade will not be performed.

##### Add Common Repositories
This will add the following repositories.
* Google Chrome
* Google Earth

  > Please note that Google Chrome doesn't support 32 bit architecture.

* Spotify
* Insync
* Google-Cloud-SDK
* Google-Cloud GCSFUSE
* Docker-CE (default add repository)
> Please note that the above repositories are sometimes not updated for latest Ubuntu release. It might take some time till the repositories are available for the latest release. Use -f or --fix command line option to revert using latest available version of repositories (usually previous Ubuntu release). [For more info see command line options.](#fix-for-latest-ubuntu-releases)


Following repositories are conditional and are determined based on the flags or conditions set.
* Canonical Partner repositories

  Canonical partner repositories are not configured or enabled for derivatives of Ubuntu because they have their own config file.

* WineHQ (default doesnot add)

  WineHQ and Docker-CE have a boolean switch mentioned in beginning of the script and by default are as follows. Change according to your needs. If you re using 16.04 and above leaving this unchanged is the best option.


```
#============================ Switches/ bools ================================
# Latest wine builds
readonly add_winehq_repo=false

#Docker community edition
readonly add_docker_repo=true
```

#### Add PPAs
* PPAs can be added using the configuration file in data directory `./data/ppa.list`
* This file **SHOULD** contain only one ppa entry per line (NO comments or anything else anywhere in the file)
in the format ppa:<author>/ppa for example `ppa:mozillateam/firefox-next`
The file will be read and the PPAs will be added from the list.
* Logs will  show entry in the format `[<date and time>] [  PPA  ] <log>`

#### Install Apps
* Packages can be installed by using configuration lists in the data directory. This works similar to ppa list However its slightly different.
* There is one master list or list of lists which contains the path to the list files from which the packages are to be installed.
* This master list should contain the full path/ relative to the root of the project to the file containing the list.
* packages in the files will not be installed if that file does not appear in the master list.
* It helps keeping things separate for separate machines or needs. Minimal edit is required to switch from one list to another than rewriting the entire list file.
* The Master list is named `app-list.list` and **MUST** only contain the list files one entry per line. **NO** comments or anything else is allowed.
* individual list files for different needs are to be written in similar way containing name of the package to be installed in one package per line format as before. similar to all the lists there **SHOULD NOT** be any comments or text or empty lines in those list files.
* You can split files according to your needs and write your list of packages to be installed and only include the lists in the master list file which you intend to install.
* It is a good idea to include packages from external repositories in a different list than others because they might fail sometimes.
* Make sure that all the packages in the lists are avail for your release. Using -s command line option helps. Also check for the logs for any errors or Conflicts.

#### Install DEB files
This will install deb files specified in the list deb-files.list
* Logs will  show entry in the format `[<date and time>] [  PKG  ] <log>` for dpkg actions and
* APT Logs will  show entry in the format `[<date and time>] [  APT  ] <log>` for actions performed by apt commands. (`apt-get install -f` for missing packages)
* **Simulate** option will use `--dry-run` option in dpkg to Simulate DEB installation.
* Configuration file is similar to that of PPA and package lists, but with one difference.
* Each DEB file to be installed should have following entry.
* URL to the deb file which can be accessed using wget <tab or space> Name of the deb file without any spaces or special chars except hyphen.
* For example to install Atom Editor the deb-files.list should look like below.
```
https://atom-installer.github.com/v1.21.1/atom-amd64.deb  ATOM-Editor.deb
```
first part is the URL to the deb file separated by a tab name of the file.
> Please note that deb file will be  saved with the name mentioned in the file (Exactly as mentioned in the second field. So if you want them to be named with extension .deb include that in the second field and avoid illegal chars)

#### Purge Unwanted Packages
This will purge Unwanted packages from the system.
* The packages mentioned in the list purge.list will be purged
* The format of the purge.list is similar to that of packages, one packages per line of the file and no comments or anything else.
> It is necessary to pass command line argument `-d` or `--deboalt` to run this task. Otherwise task will be aborted.

#### Reset repositories
* This will reset the repositories added by this script, and purge ppas added by this script in the list ppa.list.
* This will **NOT** reset or remove repositories added by the DEB files (Visual Studio Code does it so does Mendeley and many others)
* Simulate option has no effect on this action and ppa-purge **WILL** downgrade packages if necessary.

  > This will **NOT** remove ppas or repositories you have added manually!

#### All In one
This will perform Following actions
* Update repository metadata
* Upgrade pacakges
* Add repositories
* Add PPAs in the list file
* Install Apps
* Install DEB files

This option will honor --yes and --simulate options as individual tasks would do.

#### Delete log file
A log file is generated containing all the output generated by the apt and other commands and contain generic information and errors .
* This task will delete the log file.
* Log file is located in the directory `minchu-logs` in folder which you ran thin script.
* Sometimes errors might not be written to log file but displayed on screen and vice-versa.
* Please verify that everything went okay by Checking the log file.


## How to use this?
* Install Your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use preseed.cfg file)
* Download this repository `wget https://github.com/tprasadtp/ubuntu-post-install/archive/master.zip`
* Unzip this file
* change your current directory to the extracted folder
* Run the script as root `sudo ./after-effects`
  > It is essential to run this script as root since most actions performed by the script require root privileges. However if you are running this in a docker container, you probably are root and its possible that you might be missing `sudo` as well. So In that case just run it as `./after-effects`

## Screenshots
![Details](/screenshots/details.png)
![Whiptail-Options](/screenshots/whiptail.png)

## CI and Testing
Following Tests are done on travis-ci.

* shellcheck every executable script (Job #build.1)
* Run the Script in simulate mode on Travis CI in Ubuntu Trusty image (Job #build.2)
* Run the Script in simulate mode on Travis CI in docker image built using Dockerfiles in `/dockerfiles` directory
* Test on Artful container (Job #build.3)
* Test on Xenial container (Job #build.4)
* Test on Zesty  container (Job #build.5)
* Dockerfiles used for building the image are in `/dockerfiles` directory, they use official ubuntu base images with script dependencies.
* Test scripts are located in `/tests` directory.
> Since its a time consuming process only simulated install is done on CI. Linux mint and Elementary are not tested in containers as of now, but will be in the future.

Use this script with caution! Though I have tested it on VMs and Travis something might break.
