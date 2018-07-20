# Data files for Ubuntu Post Installation Script

Package lists

| File | Contents | Present in app-list |
|:-----|:---------|:--------|
| github-bot-essentials.list | Project specific | No |
| administration | Administration Tools like Synaptic | Yes |
| development | Used for development tasks eg: rake | Yes |
| exten | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs | Yes |
| multimedia | Tools to edit photos and videos, video players and editors and downloaders. Tools like mpv, darktable, kdenlive. | Yes |
| productivity | Email, Chat, Office tools, Document converters etc. | Yes |
| security | Security related tools | Yes |
| utilities | Utilities and Tools | Yes |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File | Contents | Used by function | Link to section |
|:-----|:---------|:-----------------|:----------------|
| gsettings | Various gsettings | None Yet | NA |
| purge | List of packages to be purged | `purge_not_required` | [Link](#purge-unwanted-packages) |
| ppa | List of ppas to be added | `add_ppas` | [Link](#l#add-ppas) |
| deb-files | List of DEB files to be installed | `install_debs` | [Link](#l#add-ppas) |
| get.mlist | Used by get-after-effects.sh to download required list files | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) | --- |
|pip.list| pip system wide packages | install_pip_packages | [Link](#install-pip-packages)
