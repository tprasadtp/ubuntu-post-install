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

??? info "About 32 bit & ARM Support"

    - Though 32 bit & ARM is supported, Testing in Travis CI, containers and locally all are done using 64 bit machine and containers. If something breaks please report it and use it with caution on 32 bit machines.
    - Some repositories are not available for ARM and 32 bit architecture.
    - Since 17.10 Ubuntu no longer provides 32 bit ISO images. You have to use Ubuntu flavors like Lubuntu. Xubuntu or use minimal ISO.

!!! warning "Warning!"
    **Script will exit, if it cannot recognize the distribution.**

A Complete  list of supported distributions is given below.

| Distribution      | Code name/Version     | Supported      | Notes                         |
| :---------------- | :-------------------- | -------------- | :---------------------------- |
| Ubuntu 19.10      | Eoan Ermine           | Yes            |
| Ubuntu 19.04      | Disco Dingo           | Yes            |
| Ubuntu 18.04      | Bionic Beaver         | Yes            |
| Ubuntu 16.04      | Xenial Xerus          | Yes            |
| Linux Mint 18     | Sarah                 | Yes            |
| Linux-Mint 18.1   | Serena                | Yes            |
| Linux-Mint 18.2   | Sonya                 | Yes            |
| Linux-Mint 18.3   | Sylvia                | Yes            |
| Linux Mint 19     | Tara                  | Yes            |
| Linux Mint 19.1   | Tessa                 | Yes            | Not tested
| Linux Mint 19.2   | Tina                  | Yes            | Not tested
| Linux Mint 19.3   | Tricia                | Yes            | Not tested
| Debian 8          | Jessie                | Yes            | Not tested
| Debian 9          | Stretch               | Yes            |
| Debian 10         | Buster                | Yes            |
| MX Linux          | 19 (Buster)           | Yes            | Not tested
| Elementary-OS 0.4 | Loki                  | Yes            | Not tested                    |
| Elementary-OS 5.0 | Juno                  | Yes            | Not tested                    |
| Elementary-OS 5.1 | Hera                  | Yes            | Tested                        |
| Budgie Remix      | Ubuntu 16.04          | Yes            |
| PoP! OS           | *Ubuntu releases      | Yes            | Not tested                    |
| Linux-Lite        | 3.X                   | Yes            | (Based on Ubuntu 16.04)       |
| Bodhi Linux       | 4                     | Yes            | (Based on Ubuntu 16.04)       |
| Bodhi Linux       | 5                     | Yes            | (Based on Ubuntu 18.04)       |
| KDE Neon          | Based on Ubuntu LTS   | Might be buggy | Not Tested                    |
| Peppermint 9,10   | Based on Ubuntu 18.04 | Yes            | Not Tested                    |
| Peppermint 8      | Based on Ubuntu 16.04 | Yes            | Not tested                    |

??? info "Pre-Release and development builds"

    - Support for Pre-release builds, **experimental** and things might break.
    - It is strongly advised to use them in a chroot or a in a VM and **not** as a daily driver.

??? info "New App-store on Linux Mint 18.3 and above"
    Linux mint 18.3 & later releases uses a new App-Store, from which you can directly install Chrome and other popular tools. There may be some conflicts in the `/etc/apt/sources.list.d`. Where, a single repository might be configured multiple times with same priority. Use it with caution. The scripts are not tested on Travis on Linux Mint.
