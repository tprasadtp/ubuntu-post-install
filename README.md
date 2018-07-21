# Ubuntu Post Installation Script - after-effects

Effortless way to setup your fresh Ubuntu, Linux Mint, Debian installs. Please read the [FAQ](https://ae.prasadt.com/faq/dependencies/) & the [Docs](https://ae.prasadt.com/getting-started/)
before trying out.

[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.svg?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)
[![Latest Version](https://img.shields.io/badge/dynamic/json.svg?label=Version&style=flat&url=https://ae.prasadt.com/api/json/version.json&query=version.name&prefix=V-)](https://github.com/tprasadtp/ubuntu-post-install/)
[![license](https://img.shields.io/github/license/tprasadtp/ubuntu-post-install.svg?style=flat)](https://github.com/tprasadtp/ubuntu-post-install/blob/master/LICENSE)
![GitHub repo size in bytes](https://img.shields.io/github/repo-size/tprasadtp/ubuntu-post-install.svg?style=flat)
[![Code Climate](https://shields-staging.herokuapp.com/codeclimate/issues/tprasadtp/ubuntu-post-install.svg?style=flat&label=Shellcheck%20and%20Markdown%20Issues)](https://codeclimate.com/github/tprasadtp/ubuntu-post-install/issues)

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

### Step 3: Run the script

Run the script as **root**. You will get an error if you do not run the script as root.

- To use default YAML configuration, which can be found here `https://ae.prasadt.com/api/config.yml` Recommended

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
Please note that `gh-pages` branch is complete derivative of master. Please checks docs directory for documentation. This project uses `mkdocs` for documentation. You can use docker-compose to test documentation site.

## FAQ & Documentation

See /docs or visit [https://after-effects.prasadt.com](https://after-effects.prasadt.com).

![Uptime Robot status](https://img.shields.io/uptimerobot/status/m780628218-79e4106657d18a5abccd3565.svg?style=flat)
![Uptime Robot ratio (7 days)](https://img.shields.io/uptimerobot/ratio/7/m780628218-79e4106657d18a5abccd3565.svg?style=flat)

## Supported Distributions

<img alt="xubuntu-logo" src="https://static.xubuntu.org/xubuntu_brand/Logo/SVG/icon.svg" width="64">
<img alt="mate-ubuntu-logo" src="https://upload.wikimedia.org/wikipedia/commons/0/07/Ubuntu_MATE_rondel_logo.svg" width="64">
<img alt="ubuntu-budgie" src="https://raw.githubusercontent.com/UbuntuBudgie/assets/master/Logos/budgie-remix-logo-large.svg?sanitize=true" width="64">
<img alt="lubuntu" src="https://upload.wikimedia.org/wikipedia/commons/3/3a/Lubuntu_logo_only.svg" width="64">
<img alt="ubuntu-logo" src="https://upload.wikimedia.org/wikipedia/commons/a/ab/Logo-ubuntu_cof-orange-hex.svg" width="64">
<img alt="kubuntu-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Kubuntu_logo.svg/100px-Kubuntu_logo.svg.png" width="64">
<img alt="mint-logo" src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Linux_Mint_logo_without_wordmark.svg" width="64">
<img alt="elementary-logo" src="https://upload.wikimedia.org/wikipedia/commons/d/db/Elementary_logo.svg" width="64">
<img alt="debian-logo" src="https://upload.wikimedia.org/wikipedia/commons/6/66/Openlogo-debianV2.svg" width="56">
<img alt="ubuntu-studio-logo" src="https://upload.wikimedia.org/wikipedia/commons/4/4a/Ubuntustudio_v3_logo_only.svg" width="64">
<img alt="bodhi-linux-logo" src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Bodhi_linux_logo.png" width="64">
<img alt="kde-neon-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Neon-logo.svg/240px-Neon-logo.svg.png" width="64">
<img alt="peppermint-logo" src="https://upload.wikimedia.org/wikipedia/commons/6/62/PEPPERMINT.png" width="64">
<img alt="zorin-logo" src="https://upload.wikimedia.org/wikipedia/commons/0/0f/Zorin_OS_7_logo.png" width="64">

A Complete  list of supported distributions is given below.

| Distribution      | Code name/Version     | Supported      | Notes                        |
| :---------------- | :-------------------- | -------------- | :--------------------------- |
| Ubuntu 18.04      | Bionic Beaver         | Yes            |
| Ubuntu 16.04      | Xenial Xerus          | Yes            |
| Ubuntu 14.04      | Trusty Thar           | Yes            |
| Ubuntu 18.10      | Cosmic Cuttlefish     | --             | Only use it for testing      |
| Ubuntu 17.10      | Artful Aardvark       | No             | Reached EOL in July 2018     |
| Ubuntu 17.10      | Zesty Zapus           | No             | Reached EOL in Jan 13th 2018 |
| Linux Mint 17     | Quina                 | Yes            |
| Linux-Mint 17.1   | Rebecca               | Yes            |
| Linux-Mint 17.2   | Rafaela               | Yes            |
| Linux-Mint 17.3   | Rosa                  | Yes            |
| Linux Mint 18     | Sarah                 | Yes            |
| Linux-Mint 18.1   | Serena                | Yes            |
| Linux-Mint 18.2   | Sonya                 | Yes            |
| Linux-Mint 18.3   | Sylvia                | Yes            |
| Linux Mint 19     | Tara                  | Yes            | Not tested                   |
| Elementary-OS     | Freya                 | Yes            | Not tested                   |
| Elementary-OS 0.4 | Loki                  | Yes            | Not tested                   |
| Elementary-OS 5.0 | Juno                  | Yes            | Not tested                   |
| Budgie Remix      | 16.04                 | Yes            |
| PoP! OS           | 17.10 & 18.04         | Yes            | Not tested                   |
| Linux-Lite        | 3.X                   | Yes            | (Based on Ubuntu 16.04)      |
| Zorin-OS          | 12.X                  | Yes            | (Based on Ubuntu 16.04)      |
| Bodhi Linux       | 4                     | Yes            | (Based on Ubuntu 16.04)      |
| Debian 8          | Jessie                | Yes            |
| Debian 9          | Stretch               | Yes            |
| Kde Neon          | Based on Ubuntu LTS   | Might be buggy | Not Tested                   |
| Peppermint 9      | Based on Ubuntu 18.04 | Yes            | Not Tested                   |
| Peppermint 8      | Based on Ubuntu 16.04 | Yes            | Not tested                   |

## Oh no! It didn't work

- Well that shouldn't have happened. If it does, see [Script Errors](https://ae.prasadt.com/faq/crash/) and consider opening an issue on Github.
- Please include the log file and terminal output if you can in the issue..
- **Never** set environment variable `CI=true` & `TRAVIS=true` unless you are running CI tests or are sure of its effects.

## Contributing & Forks

See [Contributing and forks](/CONTRIBUTING)

## Credits

[![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)](https://prasadt.com/google-analytics-beacon)
