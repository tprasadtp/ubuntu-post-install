# Overview of Configuration files

This Script is designed to be flexible. use `--config-file FILENAME`

- Check [Sample YAML](/yaml) configuration file [here.](/yaml)

## Autopilot mode

Using`--autopilot` will run all the tasks specified in the YAML file. The order in which tasks are run is as follows.

- Update
- Upgrade packages
- Add repositories
- Add PPAs [if supported]
- Install packages
- Install .deb packages
- Purge unwanted Packages
- Install snap packages

## Reserved Environment Variables

Prefix `AE_` and `GITHUB_` are reserved as they are used for configuration and testing.
