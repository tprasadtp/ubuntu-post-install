# Overview of Configuration files

This Script is designed to be flexible. Configurations live in directory `/data` & remote sample configuraions are in `cfg`. For each task containing the necessary data and are easy to configure for your needs.

## Package lists

These files contain list of apt packages which can be installed. Please see [Installing APT packages](tasks/apt) for more information.

| File | Contents | Present in app-list |
|:-----|:---------|:--------|
| basic | List of packages which usually come pre-installed. Please don't add if you are not sure what you are doing. | No |
| administration | Administration Tools like Synaptic | Yes |
| development | Used for development tasks eg: rake | Yes |
| exten- | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs | No (But is added during Travis tests for supported releases) |
| multimedia | Tools to edit photos and videos, video players and editors. | Yes |
| productivity | Email, Chat, Office tools, Document converters etc. | Yes |
| security | Security related tools | Yes |
| utilities | Utilities and Tools | Yes except on debian. |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File | Contents | Used by function | Link to section |
|:-----|:---------|:-----------------|:----------------|
| gsettings | Various gsettings | None Yet | NA |
| purge | List of packages to be purged | `purge_not_required` | [Link](tasks/#purge-unwanted-packages) |
| ppa | List of ppas to be added | `add_ppas` | [Link](tasks/#add-personal-package-archives-ppa) |
| deb-files | List of DEB files to be installed (csv) | `install_debs` | [Link](tasks/#install-debian-package-package-archives-deb-files) |
| get.mlist | Used by get-after-effects.sh to download required list files | NA | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) | --- |
|pip2/pip3| Python packages (Installed System wide) | _install_pip_packages | [Link](tasks/#install-python-packages-via-pip)

!!! tip
    After you customize, might want to use simulate flag. `sudo ./after-effects -s`

???+ bug "Exceptions for packages in the list"
     Some packages are not added or available for the some releases.

     **Debian 8**

     - timeshift nautilus-admin
     - utilities.list, xenial-above.list are not added or tested.

     **Debian 9**

     - utilities.list is not added or tested.

     **Trusty**

     - peek, kdeconnect-indicator PPAs
     - openjdk-8-jdk from development.list
     - gnome-calendar, gnome-todo, polari from productivity.list
     - indicator-kdeconnect, peek, yubikey-manager-qt from extern-repo.list
     - xenial-above.list is not added or tested.

## Remote or local config File

The script fetches data from remote default remote endpoint or the one mentioned via --api-endpoint. This file or API respose is in yaml. It containes following details.

- Script version, Config version ,if script is blacklisted, if so which release to fallback to. JSON data is available via `/cfg/json/`.
- Some flags and features mentioned in the script can be overridden remotely.
- Remote configuration is displayed as `[  RCFG  ]` in the logs and on the screen.
- Use a simple node or any other server which returns a valid configuration in `yaml` based on a query string appended to api-endpoint.

!!! tip "Use local file while testing"
    If you are testing, it might be a good idea to use a local file which holds this configuration data. In that  case use `-c <filename>` option.

## Automate
Setting "AUTOPILOT=true" will run all the tasks specified in the yml file, or if `-L` list option is used, then all tasks are run in folowing order
1. Update
2. Upgrade
3. Add Reposiories
4. Add PPAs [if supported]
5. Install packages
6. Install DEB packages
7. Install Python2 Modules
8. Install Python 3 Modules
9. Purge unwanted Packages
