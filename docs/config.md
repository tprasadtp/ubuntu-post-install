# Overview of Configuration files

This Script is designed to be flexible. Configurations live in directory `/data`. For each task containing the necessary data and are easy to configure for your needs.

## Package lists

These files contain list of apt packages which can be installed. Please see [Installing APT packages](tasks/apt) for more information.

| File | Contents | Present in app-list |
|:-----|:---------|:--------|
| linux-mint.list | Specific for Linux Mint | No |
| gnome-online-accounts.list | Specific for 16.04. For 17.04 and above use `goa.list` | No |
| basic | List of packages which usually come pre-installed. Please don't add if you are not sure what you are doing. | No |
| github-bot-essentials.list | Project specific | No |
| administration | Administration Tools like Synaptic | Yes |
| development | Used for development tasks eg: rake | Yes |
| exten-repo | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs | Yes |
| goa | Gnome online accounts specific packages. These are necessary to get Gnome-Online-Accounts working properly in Empathy. Use only on 17.04 and above. For 16.04 use gnome-online-accounts | Yes |
| multimedia | Tools to edit photos and videos, video players and editors. | Yes |
| productivity | Email, Chat, Office tools, Document converters etc. | Yes |
| security | Security related tools | Yes |
| utilities | Utilities and Tools | Yes |
| wine | Wine related packages like winetricks | Yes |
| xenial-above | Packages are not available in Xenial or below in Ubuntu repositories, but are available in 16.10 and later. | No (But is added during Travis tests for supported releases) |
| latex | Latex related packages | Yes |
| pip.apt   | Python 2 APT dependencies | Yes |
| pip3.apt  | Python 3 APT dependencies | Yes |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File | Contents | Used by function | Link to section |
|:-----|:---------|:-----------------|:----------------|
| gsettings | Various gsettings | None Yet | NA |
| purge | List of packages to be purged | `purge_not_required` | [Link](tasks/#purge-unwanted-packages) |
| ppa | List of ppas to be added | `add_ppas` | [Link](tasks/#add-personal-package-archives-ppa) |
| deb-files | List of DEB files to be installed | `install_debs` | [Link](tasks/#install-debian-package-package-archives-deb-files) |
| get.mlist | Used by get-after-effects.sh to download required list files | NA | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) | --- |
|pip2/pip3| Python packages (Installed System wide) | _install_pip_packages | [Link](tasks/#install-python-packages-via-pip)
|pip-dep.apt | Any APT dependencies which might be required by pip packages | [Link](tasks/#install-python-packages-via-pip) |
|pre-script | List of bash scripts to be run before any of the tasks begin | NA |
|post-script | List of scripts which can be run after all the tasks are completed | NA |

!!! tip
    After you customize, might want to use simulate flag. `sudo ./after-effects -s`
