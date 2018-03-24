# Data files for Ubuntu Post Installation Script

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
