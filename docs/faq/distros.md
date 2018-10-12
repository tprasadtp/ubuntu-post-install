# Supported Distros

In short? Ubuntu, its official flavors (Kubuntu,Ubuntu Mate etc), Linux Mint and Elementary.

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

I have not tested the script on following distros, but since they use ubuntu as their base,
It should work fine. But no promises.

[![Kde-Neon](https://static.prasadt.com/logo64/kde-neon.png)](https://neon.kde.org/)
[![Pop-OS](https://static.prasadt.com/logo64/pop-os.png)](https://system76.com/pop)
[![Bodhi-Linux](https://static.prasadt.com/logo64/bodhi-linux.png)](https://www.bodhilinux.com/)
[![Peppermint-OS](https://static.prasadt.com/logo64/peppermint-os.png)](https://peppermintos.com/)
[![Elementary-OS](https://static.prasadt.com/logo64/elementary-os.png)](https://elementary.io/)
[![Zorin-OS](https://static.prasadt.com/logo64/zorin-os.png)](https://zorinos.com/)

??? info "About 32 bit & ARM Support"

    - Though 32 bit & ARM is supported, Testing in Travis CI, containers and locally all are done using 64 bit machine and containers. If something breaks please report it and use it with caution on 32 bit machines.
    - Some repositories are not available for ARM and 32 bit architecture.
    - Since 17.10 Ubuntu no longer provides 32 bit ISO images. You have to use Ubuntu flavors like Lubuntu. Xubuntu or use minimal ISO.

!!! warning "Warning!"
    **Script will exit, if it cannot recognize the distribution.**

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

??? info "Pre-Release and development builds"

    - Support for Ubuntu Pre-release builds, Elementary OS Juno are **experimental** and things might break.
    - They have not been released in stable release channels and are considered development versions of the release.
    - It is strongly advised to use them in a chroot or a in a VM and **not** as a daily driver.
    - Debian Buster is in testing. Please use it with caution.

??? info "New App-store on Linux Mint 18.3 and above"
    Linux mint 18.3 & later releases uses a new App-Store, from which you can directly install Chrome and other popular tools. There may be some conflicts in the `/etc/apt/sources.list.d`. Where, a single repository might be configured multiple times with same priority. Use it with caution. The scripts are not tested on Travis on Linux Mint.
