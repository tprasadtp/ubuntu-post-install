# Overview of Configuration files

This Script is designed to be flexible. You have two options of configuring this script.
`list` files directory `/data` & YAML configurations are in `config`.

## Configuration using  lists

These files contain list of apt packages which can be installed. Please see [Installing APT packages](tasks/apt) for more information.

| File           | Contents                                                                                                        |
| :------------- | :-------------------------------------------------------------------------------------------------------------- |
| administration | Administration Tools like Synaptic                                                                              |
| development    | Used for development tasks eg: ruby                                                                             |
| external       | Packages from PPAs or External repositories. eg : Google Chrome, Spotify, Visual Studio Code, Google Cloud SDKs |
| multimedia     | Tools to edit photos and videos, video players and editors.                                                     |
| productivity   | Email, Chat, Office tools, Document converters etc.                                                             |
| security       | Security related tools                                                                                          |
| utilities      | Utilities and Tools                                                                                             |

---
Non package related lists (settings, deb files, delete packages list). The use and format is explained in individual sections.

| File      | Contents                                                     | Used by function      | Link to section                                                                                           |
| :-------- | :----------------------------------------------------------- | :-------------------- | :-------------------------------------------------------------------------------------------------------- |
| gsettings | Various gsettings                                            | None Yet              | NA                                                                                                        |
| purge     | List of packages to be purged                                | `purge_not_required`  | [Link](tasks/#purge-unwanted-packages)                                                                    |
| ppa       | List of ppas to be added                                     | `add_ppas`            | [Link](tasks/#add-personal-package-archives-ppa)                                                          |
| deb       | List of DEB files to be installed (csv)                      | `install_debs`        | [Link](tasks/#install-debian-package-package-archives-deb-files)                                          |
| get.mlist | Used by get-after-effects.sh to download required list files | NA                    | [get-after-effects.sh](https://github.com/tprasadtp/ubuntu-post-install/blob/master/get-after-effects.sh) |
| pip2/pip3 | Python packages (Installed System wide)                      | _install_pip_packages | [Link](tasks/#install-python-packages-via-pip)                                                            |

!!! tip
    After you customize, might want to use simulate flag. `sudo ./after-effects -s -L`

## YAML File

The script can fetch remote YAML data from given url. Use `--remote-yaml` URL If you want to use a local config file, use `--config-file FILENAME` It contains following details.

- If you specify a an option via command line and provide config file which has conflicting option, Config file takes precedence.
- Remote configuration is displayed as `[  R-Config  ]` in the logs and on the screen. To hide it use `--hide-config`
- Check [Sample YAML](/yaml/#yaml-config) configuration file [here.](/yaml/#yaml-config)

!!! tip "Using local file"

    - If you are testing, it might be a good idea to use a local file which holds this configuration data. In that  case use `-C <filename>` option.
    - After you customize, might want to use simulate flag. `sudo ./after-effects -s -C config.yml -Y`
    - If both `-C` and `--remote-yaml` are used, local config file takes priority, and remote file is **completely** ignored.

## Autopilot mode

Setting `"AUTOPILOT=true"` or `--autopilot` will run all the tasks specified in the YAML file, or if `-L` list option is used, then all tasks are executed. the order in which tasks are run is as follows.

- Update
- Upgrade
- Add Repositories
- Add PPAs [if supported]
- Install packages
- Install DEB packages
- Install Python2 Modules
- Install Python 3 Modules
- Purge unwanted Packages
- Install Snap packages

## Reserved Environmenat Variables

Prefix `AE_` is reserved along with `TRAVIS_` as they are used for configuration and testing.
Please do not set CI="true" in your environment variables. they will alter how script honors `--similate` flag and `--autopilot` flag
as they are reserved for testing on CI systems.
