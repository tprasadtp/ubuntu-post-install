# After-Effects

<small>An effortless post install script for Ubuntu </small>

## Why

Upgrading a Linux machine comes with lot of headache. Somethings might break, somethings might not work or you might just want to
start fresh. Beauty of Linux is almost everything is scriptable. Re-installing is just a matter of putting your favorite distribution on USB, install and configuring it. If you do it often and over a fleet of machines, then its a pain. You can run a few scripts to automate it, but they are not so flexible. A package changed its name? PPA not available for the current release? You need to edit your script, test it and run it.

## How

What if your script could be "configured"? Just add the package you want to install to your config file. No need to search through code to do it. Separating your preferences and package lists from the script frees you from writing the script every time a new release comes around. This project helps you do just that. Its poor man's Chef. Most of your preferences and configurations are separate from script.

## Really? A shell-script

[![Bash](https://static.prasadt.com/logo64/bash.png)](https://ae.prasadt.com)

Yes! Because it has almost zero dependencies. No need to have Python or Ruby or other dependencies. Someone can edit it to fit their needs too.

## How to

See [Getting Started](/getting-started.md).

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
[![Zorin-OS](https://static.prasadt.com/logo64/zorin-os.png)](https://zorinos.com/)

!!! tip "Tip"
    Please check [Supported-Distros](/faq/distros/) for complete list of supported distros.

## Features

[![APT-Packages](https://img.shields.io/badge/Install_Packages-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-apt-packages)
[![Add-Repo](https://img.shields.io/badge/Add_Repositories-Limited-yellow.svg)](https://ae.prasadt.com/tasks/#add-repositories)
[![Remove-Pre-installed](https://img.shields.io/badge/Purge_Pre_Installed-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#purge-unwanted-packages)
[![PIP](https://img.shields.io/badge/PIP_Packages-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-python-packages-via-pip)
[![Add-PPA](https://img.shields.io/badge/Add_PPAs-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#add-personal-package-archives-ppa)
[![Purge-PPA](https://img.shields.io/badge/Purge_PPA-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#what-can-it-do)
[![Install-Debs](https://img.shields.io/badge/Install_.DEB_Packages-Yes-brightgreen.svg)](https://ae.prasadt.com/tasks/#install-debian-package-archives-deb-files)

## Screenshots

[![Details](assets/images/details.png)](assets/images/details.png)
[![Details](assets/images/whiptail.png)](assets/images/whiptail.png)
