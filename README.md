# Ubuntu Post Installation Script : after-effects

Effortless way to setup your Fresh ubuntu installs. Please read the [FAQ](#fix-for-latest-ubuntu-releases)
before trying out.

[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.png?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)
[![Latest Version](https://img.shields.io/github/release/tprasadtp/ubuntu-post-install/all.png?label=Latest)](https://github.com/tprasadtp/ubuntu-post-install/releases)

## URLs

```bash
Github URL: https://github.com/tprasadtp/ubuntu-post-install
Github URL: https://github.com/tprasadtp/after-effects-ubuntu
```

## How to use this?

### Step 0: Install Ubuntu/Linux-Mint/Elementary/Ubuntu Derivative

Install (if you haven't already) your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use preseed.cfg file)

### Step 1: Get the script

#### Without Git

Run this in Terminal

```sh
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash
```

#### With Git

If you already have git on your system you can use,

```bash
git clone --depth 1 https://github.com/tprasadtp/ubuntu-post-install.git && cd ubuntu-post-install
```

### Step 2: Update the lists to suit your needs (Optional)

Update the list files to suit your needs. Change PPAs, add or delete packages to list, tweak booleans etc.

### Step 3: Run the script

Run the script as **root**. You will get an error if you do not run the script as root.

```sh
sudo ./after-effects
```

> If you are running this in a docker container, you probably are root and its possible that you might be missing `sudo`. So In that case just run it as `./after-effects`. Be warned! You might be missing several dependecies of the script!!

### Step 4: Contribute!

Contribute tweaks, improvements ideas back upstream.

## Oh no! It crashed :(

Well that shouldn't have happened. If it does, see [Script Crashes](#what-if-script-or-ubuntu-crashes) and consider opening an issue on Github.

## Contributing & Forks

See [Contributing and forks](./.github/CONTRIBUTING)

## FAQ

### What are its dependencies? What do I need on my system to run this?

Usually nothing extra! Your base Ubuntu install comes with all the commands/utilities this script uses, unless you are running this on Ubuntu docker image.

- The script itself depends on following utilities which are usually present on a typical Ubuntu/Ubuntu based installation. `lsb-release, whiptail, wget, iputils-ping, bash`
- Some functions of the script (Add, Remove PPAs and add Repositories) depend on following packages.

``` sh
apt-transport-https
ca-certificates
curl
ppa-purge
software-properties-common
python-pip
python3-pip
```

They will be installed if necessary, without confirmation.

### What all distributions are supported

- In short? Ubuntu, its official flavors (Kubuntu,Ubuntu Mate etc), Linux Mint and Elementary.

```none
Ubuntu 18.04        Bionic Beaver
Ubuntu 17.10        Artful Aardvark
Ubuntu 16.04        Xenial Xerus
Ubuntu 14.04        Trusty Thar
Ubuntu 18.10        Cosmic Canimal [Not yet supported, Only use for testing & development.]

Official Ubuntu Flavors for above mentioned Ubuntu releases.
(Kubuntu, Ubuntu MATE, Ubuntu Budgie (17.10 & 18.04), Ubuntu-GNOME (14.04, 16.04)
Lubuntu, Xubuntu, Ubuntu Studio, Edubuntu)
---------------------------------------------------------------------------------------

Linux Mint 17       Quina
Linux-Mint 17.1     Rebecca
Linux-Mint 17.2     Rafaela
Linux-Mint 17.3     Rosa
Linux Mint 18       Sarah
Linux-Mint 18.1     Serena
Linux-Mint 18.2     Sonya
Linux-Mint 18.3     Sylvia
Linux Mint 19       Tara [Not Yet Supported]
----------------------------------------------------------------------------------------

Elementary-OS       Freya
Elementary-OS       Loki
Budgie Remix        Unofficial Ubuntu flavor based on Ubuntu 16.04
PoP!_OS             17.10 & 18.04

----------------------------------------------------------------------------------------

Linux-Lite          3.X (Based on Ubuntu 16.04)
Zorin-OS            12.X (Based on Ubuntu 16.04)
Bodhi Linux         4 (Based on Ubuntu 16.04)
----------------------------------------------------------------------------------------

```

- Though 32 bit is supported, Testing in Travis CI, containers and locally all are done using 64 bit machine and containers. If something breaks please report it and use it with caution on 32 bit machines.
- Support for Ubuntu Pre-release builds, Elementary OS Juno are **experimental** and things might break. They have not been released in stable release channels and are considered development versions of the release. It is strongly advised to use them in a chroot or a virtualized environments and not as a daily driver.
- Linux mint 18.3 & later uses a new App-Store, from which you can directly install Chrome and other popular tools. There may be some conflicts in the `/etc/apt/sources.list.d`. Where, a single repository might be configured multiple times with same priority. Use it with caution. The scripts are not tested on Travis on Linux Mint.

> **Script will exit, if it cannot recognize the distribution.**

### What if I get an error saying Unknown Distribution/Release

That usually means you are running a Distribution which is not supported or too old or a derivative which is not recognized by the script. However it also might be possible that `lsb-release` package is missing from your system. Since the script depends on it for determining what is the code-name of the release it will fail.
You might see ans error like this,

``` none
./after-effects: line 41: lsb_release: command not found
./after-effects: line 42: lsb_release: command not found
./after-effects: line 43: lsb_release: command not found
./after-effects: line 44: lsb_release: command not found
[    Notice     ] Following details were recognized by the Script.
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

### What if I get an error saying this release of Ubuntu is no longer supported

``` none
[      EOL      ] This release of Ubuntu is no longer supported.
[    Notice     ] zesty reached EOL on January 13th, 2018.
[    Notice     ] Please use a supported version of Ubuntu.
[     Info      ] Please visit the link below for information on how to upgrade.
```

This Simply means that you are using a version of Ubuntu that is no longer supported.
Please visit https://help.ubuntu.com/community/EOLUpgrades to see how to Upgrade. If its a fresh install, It is recommended that you re-install latest supported version of Ubuntu(LTS or otherwise)

## Linux Mint 17.X and PPA priorities

> This applies only for Linux Mint 17, 17.1 17.2

- For some reason, The Mint team decided to make their repository packages set with a priority of 700 in order to overwrite Ubuntu’s priorities. PPAs typically issue a priority of 500, so due to the priority that Mint set, packages provided by the PPA which are already in the official mint repository (upstream Ubuntu as well) are completely ignored. Workaround is to set the priorities to lower for default repositories say 500 in /etc/apt/preferences.d/ or to increase priorities of PPAs to higher (more than 700).
- This was changed in Linux Mint 17.3 and no need to change the priorities unless it provides upstream Linux Mint packages. The release notes for mint 17.3 says
> The "upstream" component of the Linux Mint repositories was kept at priority 700. All other components ("main", "import", "backport", "romeo") as well as the "extra" repository, had their priority lowered to 500.

### What all command line options do I have and how do I use them?

#### Simulating package installation

- . **`-s` or `--simulate`**

  - This will simulate installing packages mentioned in the lists (More on that later) using the apt-get inbuilt dry-run option `apt-get install -s` to simulate the installation of packages. Nothing will be downloaded except repository metadata  (deb files if option is chosen). Packages will not be installed.
  - This option can be used to check if the files in the lists are compatible/available in the repository.
  - When this option is passed, upgrade_system will not be run. Only a list of packages upgradeable will be listed in the log file.
  - Installation of DEB files also behaves similarly. It uses `dpkg -i --dry-run` to simulate installation.
  - Its a very good idea to simulate installation when you have reconfigured the apps and packages in the list to check what might be error prone.
  - In case of DEB files, they **WILL*- be downloaded unlike apt-get package installs.

  - **Simulate flag will not simulate Adding Repositories or PPAs.**
  - If you want to revert them please use Reset Repositories option.

#### Fix for latest Ubuntu Releases

- **`-f` or `--fix`**

  Usually it takes a while for additional Repositories (Docker, Google Cloud SDK etc) to add support for latest release of Ubuntu. However we can use the previous release for which
  packages are available. So usually using packages built for previous release works fine most of the time. This is also good fix if you are running a alpha or beta release of Ubuntu.
  Following repositories  which use this fix.

  ```bash
  google-cloud-sdk
  gcsfuse
  insync
  Docker-CE
  WineHQ
  ```

  - By default this option is disabled.
  - Use `sudo ./after-effects -f` or `sudo ./after-effects --fix` to enable this.
  - Repositories like Spotify and Google Chrome do not use code names in their repository URLs. So the above workaround is not necessary.
  - Derivatives of Ubuntu will use the codename of Ubuntu on which they are based. For example Linux mint 18.2 Serena will use codename xenial since it is based on Ubuntu 16.04 Xenial Xerus
  - This option applies only for the latest release mentioned in the variable `code_name_latest_release`. and will be ignored if the release is not latest.
  - Variables in current version are (As of Dec 2017) change them if necessary.

  ```bash
  readonly code_name_latest_release="bionic"
  readonly codename_previous_release="artful"
  readonly codename_upcoming_release="cosmic"
  ```

  > If you are using a pre release version of Ubuntu, you can use `--pre-release` flag to apply the above mentioned fix to pre-release version of Ubuntu. This flag can be used independent of `--fix`. If both are used together then both flags will be applied if the release is upcoming-release. otherwise if the release is stable only `--fix` flag will be valid and `--pre-release` is ignored. This is how it works:  If the repositories are  not available for latest stable release as well, go back a release. Ex. If the pre-release is 18.04 and the repo is not available for 17.10 as well, we use 17.04 repositories. Usually happens in first few days of development cycle of 18.04.

#### Say Yes To All

- **`-y` or `--yes`**

  From v3.0 onward you will be asked for confirmation before performing the task selected. If you would like to bypass this on a CI environments like TRAVIS or for any other reason, you can do so by running the script with `sudo ./after-effects -y` or `sudo ./after-effects --yes`

#### Purge not required pacakges

- **`-d` or `--deboalt`**
  Usually Ubuntu comes with some pre-installed games, packages which you sometimes do not need. This option is a switch to used in purging these packages mentioned in the subsequent sections. Since it is possible that user might purge necessary packages like sudo or other core system components, these just acts like a barrier from accidentally doing so.

  > This flag **MUST** be passed, if you intend to purge packages from system. Otherwise you will receive an error.

#### Delete log file

- **`-l` or `--delete-log`**

  Just a quick way to delete logs generated by this script.
  > If you pass -l in the beginning rest of the commands will be ignored, as the script exits after deleting the log!

#### Keep Downloaded DEB Files

- **`-k` or `--keep-debs`**

Keeps packages cached by APT and downloaded DEB packages.
Default behavior is to clean apt cache and delete downloaded DEB packages.

#### Pre and Post task hooks for scripts
See [Link](#pre-and-post-task-hooks)

## What all This Script can do? and How Can I configure it for my needs?

This Script is designed to be flexible. Configurations live in directory `/data`. There are .list files for each purpose containing the necessary data and are easy to configure for your needs.

### Package lists

| File | Contents | Present in app-list |
|:-----|:---------|:--------|
| linux-mint.list | Specific for Linux Mint | No |
| gnome-online-accounts.list | Specific for 16.04. For 17.04 and above use `goa.list` | No |
| basic | List of packages which usually come pre-installed. Please don't add if you are not sure what you are doing. | No |
| github-bot-essentials.list | Project specific | No |
| administration | Administration Tools like Synaptic | Yes |
| development | Used for development tasks eg: rake | Yes |
| exten-repo | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs | Yes |
| goa | Gnome online accounts specific packages. These are necessary to get goa working properly in Empathy. Use only on 17.04 and above. For 16.04 use gnome-online-accounts | Yes |
| multimedia | Tools to edit photos and videos, video players and editors. | Yes |
| productivity | Email, Chat, Office tools, Document converters etc. | Yes |
| security | Security related tools | Yes |
| utilities | Utilities and Tools | Yes |
| wine | Wine related packages like winetricks | Yes |
| xenial-above | Packages are not available in xenial or below in Ubuntu repositories, but are available in 16.10 and later. | No (But is added during travis tests) |
| latex | Latex related packages | Yes |
| pip   | Python 2 pip package list | Yes |
| pip3  | Python 3 pip package list | Yes |
---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File | Contents | Used by function | Link to section |
|:-----|:---------|:-----------------|:----------------|
| gsettings | Various gsettings | None Yet | NA |
| purge | List of packages to be purged | `purge_not_required` | [Link](#purge-unwanted-packages) |
| ppa | List of ppas to be added | `add_ppas` | [Link](#l#add-ppas) |
| deb-files | List of DEB files to be installed | `install_debs` | [Link](#l#add-ppas) |
| get.mlist | Used by get-after-effects.sh to download required list files | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) | --- |
|pip2/3| Python packages (Installed System wide) | _install_pip_packages | [Link](#install-pip-packages)
|pip-dep.apt | Any APT dependencies which might be required by pip packages | [Link](#install-pip-packages) |
|pre-script | List of bash scripts to be run before any of the tasks begin | NA |
|post-script | List of scripts which can be run after all the tasks are completed | NA |

> After you customize, might want to use simulate flag. `sudo ./after-effects -s`

### Update Repositories

This will update repository metadata. Errors might occur if there is missing key or mis-configured repositories.
> Sometimes it is possible that some errors might occur even though the log says successfully updated. Its because script checks for exit status of the apt-get update command and its zero even if there are some errors. So use it with caution.

### Upgrade packages to Latest

This will perform Update repositories as well as it will upgrade all the upgradeable packages on the system.

> If simulate argument is passed, then only list of upgradeable packages will be written to log, and upgrade will not be performed.

### Add Common Repositories

This will add the following repositories.

- Insync
- Google-Cloud-SDK
- Google-Cloud GCSFUSE
- Docker-CE (default add repository)
- WineHQ (Latest wine builds): By default this repository is not added.
  > Please note that the above repositories are sometimes not updated for latest Ubuntu release and most certainly will not be available for upcoming release of Ubuntu(Alpha/Beta). It might take some time till the repositories are available for the latest release. Use -f or --fix command line option or --pre-release in case you are using a Development version of ubuntu to revert using latest available version of repositories (usually previous Ubuntu release or in case of Beta/Alpha latest stable release of ubuntu). [For more info see command line options.](#fix-for-latest-ubuntu-releases)
- Google Chrome
  > Please note that Google Chrome doesn't support 32 bit architecture, please use Chromium.
- Google Earth
- Spotify
- Visual Studio Code
- Signal Desktop
- Mendeley Desktop

Following repositories are conditional and are determined based on the flags or conditions set.

- Canonical Partner repositories

  Canonical partner repositories are not configured or enabled for derivatives of Ubuntu because thee might be some conflicts.

- WineHQ & Docker-Community-Edition (default is to add repositories)

  WineHQ and Docker-CE have a boolean switch mentioned in beginning of the script and by default are as follows. Change according to your needs. If you re using 16.04 and above leaving this unchanged is the best option.

  ```bash
  #============================ Switches/ bools ================================
  # Latest wine builds
  readonly add_winehq_repo=true

  #Docker community edition
  readonly add_docker_repo=true

  #Mendeley Desktop
  readonly add_mendeley_repo=true
  ```

### Add PPAs

- PPAs can be added using the configuration file in data directory `./data/ppa.list`
- This file **SHOULD** contain only one ppa entry per line (No comments or anything else anywhere in the file) in the format ppa:<author>/ppa for example `ppa:mozillateam/firefox-next` The file will be read and the PPAs will be added from the list.
- Logs will  show entry in the format `[<date and time>] [  PPA  ] <log>`

#### Note:

- PPAs should be checked before they are added to the list. Sometimes PPAs listed in the file may not be available for all releases.

### Install Apps

- Packages can be installed by using configuration lists in the data directory. This works similar to ppa list However its slightly different.
- There is one master list or list of lists which contains the path to the list files from which the packages are to be installed.
- This master list should contain the path to list files relative to script in following manner, `<dir-relative-to-script>/<list file>`. For example if you have a list file security.list in data directory, then entry should look exactly like `data/security.list`
- packages in the files will not be installed if that file does not appear in the master list.
- It helps keeping things separate for separate machines or needs. Minimal edit is required to switch from one list to another than rewriting the entire list file.
- The Master list is named `app-list.list` and **MUST** only contain the list files one entry per line. **NO** comments or anything else is allowed.
- Individual list files for different needs are to be written in similar way containing name of the package to be installed in one package per line format as before. similar to all the lists there **SHOULD NOT** be any comments or text or empty lines in those list files.
- You can split files according to your needs and write your list of packages to be installed and only include the lists in the master list file which you intend to install.
- It is a good idea to include packages from external repositories in a different list than others because they might fail sometimes.
- Make sure that all the packages in the lists are available for your release. Using `-s` command line option helps. Also check for the logs for any errors or conflicts.

### Install DEB packages

This will install deb files specified in the list deb-files.list

- Logs will  show entry in the format `[<date and time>] [  PKG  ] <log>` for dpkg actions and
- APT Logs will  show entry in the format `[<date and time>] [  APT  ] <log>` for actions performed by apt commands. (`apt-get install -f` for missing packages)
- **Simulate** option will use `--dry-run` option in dpkg to Simulate DEB installation.
- Configuration file is similar to that of PPA and package lists, but with one difference.
- Each DEB file to be installed should have following entry.
- URL to the deb file which can be accessed using wget  [ tab or space ] Name of the deb file without any spaces or special chars except hyphen.
- For example to install Atom Editor the deb-files.list should look like below.

```text
https://atom-installer.github.com/v1.21.1/atom-amd64.deb  ATOM-Editor.deb
```

- First part is the URL to the deb file separated by a tab name of the file.
  > Please note that deb file will be  saved with the name mentioned in the file. (DEB file is named **exactly** as mentioned in the second field. So if you want them to be named with extension .deb include that in the second field and avoid illegal chars)

### Install Python packages (pip)

This will install system wide python packages using pip. There are two lists. `pip.list` and `pip3.list` for python 2 and python 3 respectively.
Pre-requisite is that python-pip package is pre installed, If not , will be installed anyway.

- The list files follow similar configuration as package list files. One item per line.
- Simulate flag will skip installing packages, unless `TRAVIS=true`.

> Don't mix Python 3 packages with Python 2 packages.

### Purge Unwanted Packages

This will purge Unwanted packages from the system.

- The packages mentioned in the list purge.list will be purged
- The format of the purge.list is similar to that of packages, one packages per line of the file and no comments or anything else.
> It is necessary to pass command line argument `-d` or `--deboalt` to run this task. Otherwise task will be aborted.

### Reset repositories

- This will reset the repositories added by this script, and purge ppas added by this script in the list ppa.list.
- This will **NOT** reset or remove repositories added by the DEB files.
- Simulate option has no effect on this action and ppa-purge **WILL*- downgrade packages if necessary.

  > This will **NOT** remove PPAs or repositories you have added manually or those added while installing DEB files.

### Pre and Post task hooks
Since version 4.0, it is possible to run list of shell-scripts (listed in pre/post-script.list), before any of the tasks like installing or adding repositories begin as well as after all the tasks are completed. Please note that currently no checks are being made if all the tasks completed successfully. The scripts are executed, regardless of the exit status of the tasks.

Invoking scripts requires two flags to be passed.

- `--enable-pre` for pre task scripts
- `--enable-post` for post task scripts.
- Configurations are similar to package lists, one line per script. Please include complete path for the shell-scripts.
- Empty lines are ignored.
- If you wish to run python or other code, please use shell-script as wrapper.

#### Honoring simulate flag
Check for environment variable `AE_SIMULATE`. By default its false and is set to true, if `--simulate or -s` falg is used.


### All In one

This will perform Following actions. (In the following order)

- Update repository metadata
- Upgrade packages
- Add repositories
- Add PPAs in the list file
- Install Apps
- Install DEB files

This option will honor --yes and --simulate options as individual tasks would do.

### Delete logs

A log file is generated containing all the output generated by the apt and other commands and contain generic information and errors .

- This task will delete the log file `after-effects.log`.
- Log file is located in the directory `after-effects-logs` in folder which you ran thin script.
- Sometimes errors might not be written to log file but displayed on screen and vice-versa.
- Please verify that everything went okay before deleting the logs.

## Screenshots

![Details](./screenshots/details.png)
![Whiptail-Options](./screenshots/whiptail.png)

## Troubleshooting and Other details

### Logs

Logs are written to a file `<current-dir>/after-effects-logs/after-effects.log`. Timestamps in the logs may not be accurate because some commands buffer outputs.

### What if script or Ubuntu crashes?

Simple. Reboot (Force it if necessary). If you know where it was stuck/crashed, just re-run the task(s) which were not completed. If you dont know, go and check log file. Each task is labelled and is clearly logged before starting and after completing. Just run the tasks which did not complete. You dont have to re-download the packages you have already downloaded, because they are already cached by apt-get.

Remember, some operations of the script can be very lengthy and can involve lots of downloads (If you used default list files, expect up to 2 GB of traffic). So, it might appear that script is stuck because cursor stops blinking. However it is not the case. If you are unsure please check the logs. In rare cases where your Ubuntu crashed while installing a DEB file which has unmet dependencies, you might see broken packages error. In that case run `sudo apt-get install -f` to fix the broken packages and re run the script. If you see any errors or script crashes please do not hesitate to open an issue on Github.

### Support for Fedora/ Scientific Linux / Open SUSE / Debian / <put your favorite distro>

Its in the pipeline, but I cannot guarantee anything. Since I do not use anything other than Open SUSE very often, so it might take a while. But you can modify this script very easily to achieve that. You need to do the following things,

- Replace apt-get with their equivalents (dnf or zypper or yum etc)
- Replace/Modify package names
- Change add-repositories function to point to .repo files
- Debian users might be able to use this script, but PPA function cannot be used.

### What about Settings?

On the way!

## To-Do

- [ ] Create a script chain to execute other scripts once all the tasks are complete.
- [ ] Gsettings and dotfiles
- [ ] Option to upload log file to pastebin
- [ ] Fork and add Open SUSE support
- [ ] Send a notification (Slack? Hipchat? Hangouts Chat?) after tasks are complete. Helpful if you are using ssh.

## CI and Testing

Following Tests are done on travis-ci.

- `shellcheck` every executable script (Job #build.1)
- Test on Artful container (Job #build.2)
- Test on Xenial container (Job #build.3)
- Test on Trusty (Host) (Job #build.4) (Soon to be removed)
- Test on Bionic Beaver (Job #build.5)
> Trusty tests do not install indicator-kdeconnect, peek, openjdk-8-jdk, gnome-todo , gnome-calendar, polari and their PPAs (if available) as they are not available for trusty . Please modify your lists accordingly.

- Test on Cosmic Canimal (Job #build.6) from `http://cdimage.ubuntu.com/ubuntu-base/daily/`
- Dockerfiles used for building the image are in `/dockerfiles` directory, they use official Ubuntu base images with script dependencies.
- Dockerfile for Bionic is using `http://cdimage.ubuntu.com/ubuntu-base/daily` root file system, as official images are not available yet.
- Test scripts are located in `/tests` directory.
- Since its a time consuming process only simulated install is done on CI. Linux mint and Elementary are not tested in containers as of now, but will be in the future.
- It is possible that there might be some errors specific to your setup. Please report if so. It is **Strongly** advised to try install apps and deb files in simulate mode first before proceeding with actual installation.

Use this script with caution! Though I have tested it on VMs and Travis something might break in your setup. Check the logs if script appears to be stuck.
> Never set Environment variable `TRAVIS=true` unless you are running on TRAVIS or are sure of its effects

[![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)](https://prasadt.com/google-analytics-beacon)
