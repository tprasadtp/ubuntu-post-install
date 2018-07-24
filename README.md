# Ubuntu / Debian Post Installation Script

Effortless way to setup your fresh Ubuntu, Linux Mint, Debian installs. Please read the [FAQ](https://ae.prasadt.com/faq/dependencies/) & the [Docs](https://ae.prasadt.com/getting-started/)
before trying out.

[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.svg?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)
[![Latest Version](https://img.shields.io/badge/dynamic/json.svg?label=Version&style=flat&url=https://ae.prasadt.com/api/json/version.json&query=version.name&prefix=V-)](https://github.com/tprasadtp/ubuntu-post-install/)
[![license](https://img.shields.io/github/license/tprasadtp/ubuntu-post-install.svg?style=flat)](https://github.com/tprasadtp/ubuntu-post-install/blob/master/LICENSE)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/tprasadtp/ubuntu-post-install.svg?style=flat)
[![Code Climate](https://shields-staging.herokuapp.com/codeclimate/issues/tprasadtp/ubuntu-post-install.svg?style=flat&label=Shellcheck%20and%20Markdown%20Issues)](https://codeclimate.com/github/tprasadtp/ubuntu-post-install/issues)

[![Bash](https://static.prasadt.com/logo64/bash.png)](https://github.com/tprasadtp/ubuntu-post-install)

## URLs

```bash
Github URL: https://github.com/tprasadtp/ubuntu-post-install
Github URL: https://github.com/tprasadtp/after-effects-ubuntu
```

## How to use this

Install your choice of Ubuntu/Debian or its derivative as you would( If you wish to automate that too, you can use `preseed.cfg file`)

### Step 1: Get the script

#### Without Git

Run this in Terminal

```console
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash
```

#### With Git

If you already have git on your system already you can use,

```console
git clone --depth 1 https://github.com/tprasadtp/ubuntu-post-install.git && cd ubuntu-post-install
```

If you already have cloned the repo, you can use git to get the latest changes.

### Step 2: Update the lists or your YAML configuration file

Update the list files or YAML file to suit your needs. Change PPAs, add or delete packages to list, tweak flags etc.
Please see [Configuration](https://ae.prasadt.com/config/#package-lists) & [Tasks](https://ae.prasadt.com/tasks/#what-can-it-do).

[![Configuration-Page](https://img.shields.io/badge/Info-Configuration-blue.svg)](https://ae.prasadt.com/config/#package-lists)
[![Tasks-Page](https://img.shields.io/badge/Info-Tasks-green.svg)](https://ae.prasadt.com/tasks/#what-can-it-do)

### Step 3: Run the script

Run the script as **root**. You will get an error if you do not run the script as root.

- To use default YAML configuration, which can be found here `https://ae.prasadt.com/api/config.yml`

  ```console
    sudo ./after-effects -Y
  ```

- To use local list files in `data`

  ```console
    sudo ./after-effects -L
  ```

> If you are running this in a docker container, you probably are root and its possible that you might be missing `sudo`. So In that case just run it as `./after-effects`. Be warned! You might be missing several dependencies of the script!!

### Step 4: Contribute

Contribute tweaks, improvements ideas back upstream.
Please note that `gh-pages` branch is derivative master. This project uses `mkdocs` for documentation. You can use docker-compose to test documentation site.

## FAQ & Documentation

See /docs or visit [https://after-effects.prasadt.com](https://after-effects.prasadt.com).

![Uptime Robot status](https://img.shields.io/uptimerobot/status/m780628218-79e4106657d18a5abccd3565.svg?style=flat)
![Uptime Robot ratio (7 days)](https://img.shields.io/uptimerobot/ratio/7/m780628218-79e4106657d18a5abccd3565.svg?style=flat)

## Supported Distributions

[![Ubuntu](https://static.prasadt.com/logo64/ubuntu.png)](https://www.ubuntu.com/desktop)
[![Kubuntu](https://static.prasadt.com/logo64/kubuntu.png)](https://kubuntu.org/)
[![Lubuntu](https://static.prasadt.com/logo64/lubuntu.png)](https://lubuntu.net/)
[![Xubuntu](https://static.prasadt.com/logo64/xubuntu.png)](https://xubuntu.net/)
[![Ubuntu-Mate](https://static.prasadt.com/logo64/ubuntu-mate.png)](https://ubuntu-mate.org/)
[![Ubuntu-Budgie](https://static.prasadt.com/logo64/ubuntu-budgie.png)](https://ubuntubudgie.org/)
[![Ubuntu-Studio](https://static.prasadt.com/logo64/ubuntu-studio.png)](https://ubuntustudio.org/)
[![Ubuntu-Gnome](https://static.prasadt.com/logo64/ubuntu-gnome.png)](https://ubuntugnome.org/)
[![Linux-Mint](https://static.prasadt.com/logo64/linux-mint.png)](https://www.linuxmint.com/)
[![Debian](https://static.prasadt.com/logo64/debian.png)](https://www.debian.org/)

I have not tested the script on following distros. Because they use ubuntu as their base,
It should work fine. But no promises.

[![Kde-Neon](https://static.prasadt.com/logo64/kde-neon.png)](https://neon.kde.org/)
[![Pop-OS](https://static.prasadt.com/logo64/pop-os.png)](https://system76.com/pop)
[![Bodhi-Linux](https://static.prasadt.com/logo64/bodhi-linux.png)](https://www.bodhilinux.com/)
[![Peppermint-OS](https://static.prasadt.com/logo64/peppermint-os.png)](https://peppermintos.com/)
[![Elementary-OS](https://static.prasadt.com/logo64/elementary-os.png)](https://elementary.io/)
[![Zorin-OS](https://static.prasadt.com/logo64/zorin-os.png)](https://zorinos.com/)

A Complete  list of supported distributions is given below.

| Distribution      | Code name/Version     | Supported      | Notes                         |
| :---------------- | :-------------------- | -------------- | :---------------------------- |
| Ubuntu 18.04      | Bionic Beaver         | Yes            |
| Ubuntu 16.04      | Xenial Xerus          | Yes            |
| Ubuntu 14.04      | Trusty Thar           | Yes            |
| Ubuntu 18.10      | Cosmic Cuttlefish     | --             | Only use it for testing       |
| Ubuntu 17.10      | Artful Aardvark       | No             | Reached EOL on July 20th 2018 |
| Ubuntu 17.10      | Zesty Zapus           | No             | Reached EOL on Jan 13th 2018  |
| Linux Mint 17     | Quina                 | Yes            |
| Linux-Mint 17.1   | Rebecca               | Yes            |
| Linux-Mint 17.2   | Rafaela               | Yes            |
| Linux-Mint 17.3   | Rosa                  | Yes            |
| Linux Mint 18     | Sarah                 | Yes            |
| Linux-Mint 18.1   | Serena                | Yes            |
| Linux-Mint 18.2   | Sonya                 | Yes            |
| Linux-Mint 18.3   | Sylvia                | Yes            |
| Linux Mint 19     | Tara                  | Yes            |
| Debian 8          | Jessie                | Yes            |
| Debian 9          | Stretch               | Yes            |
| Elementary-OS     | Freya                 | Yes            | Not tested                    |
| Elementary-OS 0.4 | Loki                  | Yes            | Not tested                    |
| Elementary-OS 5.0 | Juno                  | Yes            | Not tested                    |
| Budgie Remix      | 16.04                 | Yes            |
| PoP! OS           | 17.10 & 18.04         | Yes            | Not tested                    |
| Linux-Lite        | 3.X                   | Yes            | (Based on Ubuntu 16.04)       |
| Zorin-OS          | 12.X                  | Yes            | (Based on Ubuntu 16.04)       |
| Bodhi Linux       | 4                     | Yes            | (Based on Ubuntu 16.04)       |
| KDE Neon          | Based on Ubuntu LTS   | Might be buggy | Not Tested                    |
| Peppermint 9      | Based on Ubuntu 18.04 | Yes            | Not Tested                    |
| Peppermint 8      | Based on Ubuntu 16.04 | Yes            | Not tested                    |

## Features

[![APT-Packages](https://img.shields.io/badge/Install_Packages-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-apt-packages)
[![Add-Repo](https://img.shields.io/badge/Add_Repositories-Limited-yellow.svg)](https://ae.prasadt.com/tasks/#add-repositories)
[![Remove-Pre-installed](https://img.shields.io/badge/Purge_Pre_Installed-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#purge-unwanted-packages)
[![PIP](https://img.shields.io/badge/PIP_Packages-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-python-packages-via-pip)
[![Add-PPA](https://img.shields.io/badge/Add_PPAs-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#add-personal-package-archives-ppa)
[![Purge-PPA](https://img.shields.io/badge/Purge_PPA-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#what-can-it-do)
[![Install-Debs](https://img.shields.io/badge/Install_.DEB_Packages-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-debian-package-archives-deb-files)
[![Install-Static-Binaries](https://img.shields.io/badge/Install_Static_Binaries-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-static-binaries)

## Issues & Help

- Please check [FAQ](https://ae.prasadt.com/faq/dependencies/) & [Known Errors](https://ae.prasadt.com/faq/errors/).
- Please include the log file and terminal output in your report.
- **Never** set environment variable `CI=true` & `TRAVIS=true` unless you are running CI tests or are sure of its effects.

## Contributing & Forks

See [Contributing and forks](/CONTRIBUTING)

[![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)](https://prasadt.com/google-analytics-beacon)
