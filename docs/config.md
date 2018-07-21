# Overview of Configuration files

This Script is designed to be flexible. Configurations live in directory `/data` & sample YAML configurations are in `api`.

## Configuration using  lists

These files contain list of apt packages which can be installed. Please see [Installing APT packages](tasks/apt) for more information.

| File | Contents | Present in app-list |
|:-----|:---------|:--------|
| basic | List of packages which usually come pre-installed. Please don't add if you are not sure what you are doing. | No |
| administration | Administration Tools like Synaptic | Yes |
| development | Used for development tasks eg: rake | Yes |
| extern | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs | No (But is added during Travis tests for supported releases) |
| multimedia | Tools to edit photos and videos, video players and editors. | Yes |
| productivity | Email, Chat, Office tools, Document converters etc. | Yes |
| security | Security related tools | Yes |
| utilities | Utilities and Tools | Yes |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File | Contents | Used by function | Link to section |
|:-----|:---------|:-----------------|:----------------|
| gsettings | Various gsettings | None Yet | NA |
| purge | List of packages to be purged | `purge_not_required` | [Link](tasks/#purge-unwanted-packages) |
| ppa | List of ppas to be added | `add_ppas` | [Link](tasks/#add-personal-package-archives-ppa) |
| deb | List of DEB files to be installed (csv) | `install_debs` | [Link](tasks/#install-debian-package-package-archives-deb-files)|
| get.mlist | Used by get-after-effects.sh to download required list files | NA | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) | --- |
|pip2/pip3| Python packages (Installed System wide) | _install_pip_packages | [Link](tasks/#install-python-packages-via-pip)

!!! tip
    After you customize, might want to use simulate flag. `sudo ./after-effects -s -L`

## YAML File

The script can fetch data from remote default remote endpoint or the one mentioned via --api-endpoint. This file or API response is in yaml. It contains following details.

- Script version, Config version ,if script is blacklisted, if so which release to fallback to. JSON data is available via `/api/json/`.
- Some flags and features mentioned in the script can be overridden remotely.
- Remote configuration is displayed as `[  R-Config  ]` in the logs and on the screen.
- Use a simple node or any other server which returns a valid configuration in `yaml` based on a query string appended to api-endpoint.

!!! tip "Use local file"

    - If you are testing, it might be a good idea to use a local file which holds this configuration data. In that  case use `-C <filename>` option.
    - After you customize, might want to use simulate flag. `sudo ./after-effects -s -C config.yml -Y`

## Automate

Setting `"AUTOPILOT=true"` will run all the tasks specified in the YAML file, or if `-L` list option is used, then all tasks are run in following order

- Update
- Upgrade
- Add Reposiories
- Add PPAs [if supported]
- Install packages
- Install DEB packages
- Install Python2 Modules
- Install Python 3 Modules
- Purge unwanted Packages
