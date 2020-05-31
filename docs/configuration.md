# Overview of Configuration files

This Script is designed to be flexible. use `--config-file FILENAME`

- Check [Sample YAML](/yaml) configuration file [here.](/yaml)

## Autopilot mode

USing`--autopilot` will run all the tasks specified in the YAML file. The order in which tasks are run is as follows.

- Update
- Upgrade
- Add Repositories
- Add PPAs [if supported]
- Install packages
- Install DEB packages
- Install Python2 Modules [If supported]
- Install Python 3 Modules
- Purge unwanted Packages
- Install Snap packages

## Reserved Environment Variables

Prefix `AE_` and `GITHUB_` are reserved as they are used for configuration and testing.
