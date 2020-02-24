# Overview of Configuration files

This Script is designed to be flexible. use `--config-file FILENAME`

- Remote configuration is displayed as `[  R-Config  ]` in the logs and on the screen. To hide it use `--hide-config`
- Check [Sample YAML](/yaml) configuration file [here.](/yaml)

!!! tip "Using config file"

    - If you are testing, it might be a good idea to use a local file which holds this configuration data. In that  case use `-C <filename>` option.
    - After you customize, might want to use simulate flag. `sudo ./after-effects -s -C config.yml -Y`
    - If both `-C` and `--remote-yaml` are used, local config file takes priority, and remote file is **completely** ignored.

## Autopilot mode

Setting `"AUTOPILOT=true"` or `--autopilot` will run all the tasks specified in the YAML file. The order in which tasks are run is as follows.

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

## Reserved Environment Variables

Prefix `AE_` is reserved along with `GITHUB_` as they are used for configuration and testing.
