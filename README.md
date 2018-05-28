# Ubuntu Post Installation Script : after-effects

Effortless way to setup your fresh Ubuntu installs. Please read the [FAQ](https://ae.prasadt.com/faq/dependencies/) & the [Docs](https://ae.prasadt.com/getting-started/)
before trying out.

[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install.png?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install)
[![Latest Version](https://img.shields.io/github/release/tprasadtp/ubuntu-post-install/all.png?label=Latest)](https://github.com/tprasadtp/ubuntu-post-install/releases)

## URLs

```bash
Github URL: https://github.com/tprasadtp/ubuntu-post-install
Github URL: https://github.com/tprasadtp/after-effects-ubuntu
```

## How to use this?

### Step 0: Install Ubuntu/Linux-Mint/Elementary/Ubuntu/Debian or its derivative

Install (if you haven't already) your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use `preseed.cfg file`)

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

Update the list files to suit your needs. Change PPAs, add or delete packages to list, tweak flags etc.
Please see [Configuration](https://ae.prasadt.com/config/#package-lists) & [Tasks](https://ae.prasadt.com/tasks/#what-can-it-do)

### Step 3: Run the script

Run the script as **root**. You will get an error if you do not run the script as root.

```sh
sudo ./after-effects
```

> If you are running this in a docker container, you probably are root and its possible that you might be missing `sudo`. So In that case just run it as `./after-effects`. Be warned! You might be missing several dependencies of the script!!

### Step 4: Contribute!

Contribute tweaks, improvements ideas back upstream.
Please note that `gh-pages` branch is complete derivative of master. Please checks docs directory for documentation. This project uses `mkdocs` for documentation. You can use docker-compose to test documentation site.

## FAQ & Documentation

See /docs or visit [https://after-effects.prasadt.com](https://after-effects.prasadt.com).

## Supported Distributions

A Complete  list of supported distributions is given below.

Distribution     | Code name/Version |   Supported | Notes
:----------------|:------------------|-------------|:------
Ubuntu 18.04     | Bionic Beaver     | Yes         |
Ubuntu 17.10     | Artful Aardvark   | Yes         |
Ubuntu 16.04     | Xenial Xerus      | Yes         |
Ubuntu 14.04     | Trusty Thar       | Yes         |
Ubuntu 18.10     | Cosmic Cuttlefish | --          | Only use it for testing
Linux Mint 17    | Quina             | Yes         |
Linux-Mint 17.1  | Rebecca           | Yes         |
Linux-Mint 17.2  | Rafaela           | Yes         |
Linux-Mint 17.3  | Rosa              | Yes         |
Linux Mint 18    | Sarah             | Yes         |
Linux-Mint 18.1  | Serena            | Yes         |
Linux-Mint 18.2  | Sonya             | Yes         |
Linux-Mint 18.3  | Sylvia            | Yes         |
Linux Mint 19    | Tara              | Not Yet     | Will be in the future
Elementary-OS    | Freya             | Yes         |
Elementary-OS    | Loki              | Yes         |
Elementary-OS    | Juno              | Yes         | Not tested.   
Budgie Remix     | 16.04             | Yes         |
PoP! OS          | 17.10 & 18.04     | Yes         |
Linux-Lite       | 3.X               | Yes         | (Based on Ubuntu 16.04)
Zorin-OS         | 12.X              | Yes         | (Based on Ubuntu 16.04)
Bodhi Linux      | 4                 | Yes         | (Based on Ubuntu 16.04)
Debian 8         | Jessie            | Yes         |
Debian 9         | Stretch           | Yes         |

## Oh no! It crashed :(

Well that shouldn't have happened. If it does, see [Script Crashes](https://ae.prasadt.com/faq/crash/) and consider opening an issue on Github.

## Contributing & Forks

See [Contributing and forks](./.github/CONTRIBUTING)


[![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)](https://prasadt.com/google-analytics-beacon)
