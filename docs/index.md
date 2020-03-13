# After-Effects

<small>An Effortless & Simple post-installation script for Ubuntu, Linux Mint and Debian </small>


![build](https://github.com/tprasadtp/ubuntu-post-install/workflows/build/badge.svg)[![Netlify Status](https://api.netlify.com/api/v1/badges/887c3d5c-5203-46b9-a31d-67cada282f36/deploy-status)](https://app.netlify.com/sites/ubuntu-post-install/deploys)
[![Latest Version](https://img.shields.io/badge/dynamic/json.svg?label=Version&style=flat&url=https://ae.prasadt.com/config/version.json&query=version.name&prefix=V-)](https://github.com/tprasadtp/ubuntu-post-install/)
[![What's new?](https://img.shields.io/badge/dynamic/json.svg?label=Whats%20New&style=flat&url=https://ae.prasadt.com/config/version.json&query=version.changelog)](https://ae.prasadt.com/changelogs/)
[![license](https://img.shields.io/github/license/tprasadtp/ubuntu-post-install.svg?style=flat)](https://github.com/tprasadtp/ubuntu-post-install/blob/master/LICENSE)

## Why

Upgrading a Linux machine comes with lot of headache. Somethings might break, somethings might not work or you might just want to
start fresh. Beauty of Linux is almost everything is scriptable. Re-installing is just a matter of putting your favorite distribution on USB, install and configuring it. If you do it often and over a fleet of machines, then its a pain. You can run a few scripts to automate it, but they are not so flexible. A package changed its name? PPA not available for the current release? You need to edit your script, test it and run it.


[![Bash](https://static.prasadt.com/logo64/bash.png)](https://ae.prasadt.com)


## How to


## Step 1: Get the script

```console
wget -q https://ae.prasadt.com/get -O after-effects
```

## Step 2: Update the config to suit your needs

Update the config files to suit your needs. Please see [Configuration](/configuration/) & [Tasks](/tasks/) for more details. Some example configs can be found [here](https://github.com/tprasadtp/ubuntu-post-install/tree/master/config).

## Step 3: Run it

Run the script as **root**. You will get an error if you do not run the script as root.

```console
chmod +x after-effects
sudo ./after-effects -C <your config.yml>
```

## Supported Distros

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

!!! tip "Tip"
    Please check [Supported-Distros](/faq/distros/) for complete list of supported distributions.

## Features

- Adding Repositories (Limited set of curated repositories only at the moment)
- Remove Preinstalled packages
- Install Python2/3 system packages. (Its highly recommended to use `virtualenv` for your projects, **ONLY** install pip packages which are absolutely essential.)
- Add PPAs (Ubuntu & Ubuntu derivatives only)
- `deb` packages
- Classic, Edge and Stable snap packages.

## Screenshots

[![Details](assets/images/details.png)](assets/images/details.png)
[![Details](assets/images/whiptail.png)](assets/images/whiptail.png)
