# Ubuntu Post Installation Script : after-effects

Effortless way to setup your fresh Ubuntu, Linux Mint, Debian installs. Please read the [FAQ](https://ae.prasadt.com/faq/dependencies/) & the [Docs](https://ae.prasadt.com/getting-started/)
before trying out.

[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.svg?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)
[![Latest Version](https://img.shields.io/badge/dynamic/json.svg?label=Version&style=flat&url=https://new-badges--ubuntu-post-install.netlify.com/api/json/version.json&query=version.number&prefix=v)](https://github.com/tprasadtp/ubuntu-post-install/)

## URLs

```bash
Github URL: https://github.com/tprasadtp/ubuntu-post-install
Github URL: https://github.com/tprasadtp/after-effects-ubuntu
```

## How to use this?

Install your choice of Ubuntu/Debian or its derivative as you would( If you wish to automate that too, you can use `preseed.cfg file`)

### Step 1: Get the script

#### Without Git

Run this in Terminal

```sh
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash
```

Or if you want to use YAML configuration & not download or use .list files

```sh
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash -s -- -r
```

#### With Git

If you already have git on your system already you can use,

```bash
git clone --depth 1 https://github.com/tprasadtp/ubuntu-post-install.git && cd ubuntu-post-install
```

If you already have cloned the repo, you can use git to get the latest changes.

### Step 2: Update the lists or your YAML configuration file

Update the list files or YAML file to suit your needs. Change PPAs, add or delete packages to list, tweak flags etc.
Please see [Configuration](https://ae.prasadt.com/config/#package-lists) & [Tasks](https://ae.prasadt.com/tasks/#what-can-it-do).

### Step 3: Run the script

Run the script as **root**. You will get an error if you do not run the script as root.

- To use default YAML configuration, which can be found here `https://ae.prasadt.com/api/config.yml`
  ```sh
    sudo ./after-effects -Y
  ```

- To use local list files in `data`
```sh
  sudo ./after-effects -L
```

> If you are running this in a docker container, you probably are root and its possible that you might be missing `sudo`. So In that case just run it as `./after-effects`. Be warned! You might be missing several dependencies of the script!!

### Step 4: Contribute!

Contribute tweaks, improvements ideas back upstream.
Please note that `gh-pages` branch is complete derivative of master. Please checks docs directory for documentation. This project uses `mkdocs` for documentation. You can use docker-compose to test documentation site.

## FAQ & Documentation

See /docs or visit [https://after-effects.prasadt.com](https://after-effects.prasadt.com).

## Security
Well, this isn't very secure or meant to be.
- The script is signed with gpg key id `BA19B5162553B1BF`.
- You can verify them manually or via `./after-effects --verify`
- GPG signature of the script is also available at `api/gpg?version="VERSION_NUMBER"`

## Supported Distributions

A Complete  list of supported distributions is given below.

 Distribution    | Code name/Version |  Supported  | Notes
:----------------|:------------------|-------------|:------
Ubuntu 18.04     | Bionic Beaver     | Yes         |
Ubuntu 16.04     | Xenial Xerus      | Yes         |
Ubuntu 14.04     | Trusty Thar       | Yes         |
Ubuntu 18.10     | Cosmic Cuttlefish | --          | Only use it for testing
Ubuntu 17.10     | Artful Aardvark   | No          | Reached EOL July 2018
Ubuntu 17.10     | Zesty Zapus       | No          | Reached EOL Jan 13th 2018
Linux Mint 17    | Quina             | Yes         |
Linux-Mint 17.1  | Rebecca           | Yes         |
Linux-Mint 17.2  | Rafaela           | Yes         |
Linux-Mint 17.3  | Rosa              | Yes         |
Linux Mint 18    | Sarah             | Yes         |
Linux-Mint 18.1  | Serena            | Yes         |
Linux-Mint 18.2  | Sonya             | Yes         |
Linux-Mint 18.3  | Sylvia            | Yes         |
Linux Mint 19    | Tara              | Yes         | Not tested
Elementary-OS    | Freya             | Yes         | Not tested
Elementary-OS    | Loki              | Yes         | Not tested
Elementary-OS    | Juno              | Yes         | Not tested
Budgie Remix     | 16.04             | Yes         |
PoP! OS          | 17.10 & 18.04     | Yes         | Not tested
Linux-Lite       | 3.X               | Yes         | (Based on Ubuntu 16.04)
Zorin-OS         | 12.X              | Yes         | (Based on Ubuntu 16.04)
Bodhi Linux      | 4                 | Yes         | (Based on Ubuntu 16.04)
Debian 8         | Jessie            | Yes         |
Debian 9         | Stretch           | Yes         |

## Oh no! It crashed :(

- Well that shouldn't have happened. If it does, see [Script Crashes](https://ae.prasadt.com/faq/crash/) and consider opening an issue on Github.
- Please include the log file and terminal output if you can in the issue..
- **Never** set environment variable `CI=true` & `TRAVIS=true` unless you are running CI tests or are sure of its effects.

## Contributing & Forks

See [Contributing and forks](./.github/CONTRIBUTING)

## Credits

[![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)](https://prasadt.com/google-analytics-beacon)
