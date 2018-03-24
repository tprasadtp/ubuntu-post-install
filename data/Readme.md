# Data files for Ubuntu Post Installation Script

## Build Status

[![Build Status](https://travis-ci.org/tprasadtp/ubuntu-post-install-data.svg?branch=master)](https://travis-ci.org/tprasadtp/ubuntu-post-install-data)

This repository is licensed under MIT license. However, [ubuntu-post-install is licensed under GPL3](https://github.com/tprasadtp/ubuntu-post-install/blob/master/LICENSE).

## Why a submodule

As it becomes increasingly tedious to maintain the project with config fils and code in same directory and pull requests from other users are not easy because  they would like to modify the list files for their needs. Keeping the script separate from the lists files help people contribute and eases the development.

## Whats in it

This repository serves as submodule for `ubuntu-post-install` repository, containing the `.list` files and configuration and other metadata (in future) which are specific to my needs.

Package lists

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
| multimedia | Tools to edit photos and videos, video players and editors and downloaders. Tools like mpv, darktable, kdenlive. | Yes |
| productivity | Email, Chat, Office tools, Document converters etc. | Yes |
| security | Security related tools | Yes |
| utilities | Utilities and Tools | Yes |
| wine | Wine related packages like winetricks | Yes |
| xenial-above | Packages re not available in xenial or below in Ubuntu repositories, but are available in 16.10 and later. | No (But is added during travis tests) |
| latex | Latex related packages | Yes |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File | Contents | Used by function | Link to section |
|:-----|:---------|:-----------------|:----------------|
| gsettings | Various gsettings | None Yet | NA |
| purge | List of packages to be purged | `purge_not_required` | [Link](#purge-unwanted-packages) |
| ppa | List of ppas to be added | `add_ppas` | [Link](#l#add-ppas) |
| deb-files | List of DEB files to be installed | `install_debs` | [Link](#l#add-ppas) |
| get.mlist | Used by get-after-effects.sh to download required list files | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) | --- |


## Use

Only for use with
[ubuntu-post-install](https://github.com/tprasadtp/ubuntu-post-install) repository.
Make sure you clone ubuntu-post-install with --recursive options to clone this submodule.

## How to write your list files

Please check [How Can I configure ubuntu-post-install for my needs?](https://github.com/tprasadtp/ubuntu-post-install/blob/master/README.md#what-all-this-script-can-do-and-how-can-i-configure-it-for-my-needs)