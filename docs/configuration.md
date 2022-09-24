# Overview of Configuration files

This Script is designed to be flexible and uses YAML to declare its configurations.

- Check [Sample YAML](/yaml) configuration file [here.](/yaml)
- Current config API version is 3.
- Configuration YAML **MUST** declare its API version via `api:` key. Currently only supported version is `3`.
- YAML file should be a valid YAML & indented with **2 SPACES**.

## Autopilot mode

Using`--autopilot` will run all the tasks specified in the YAML file. The order in which tasks are run is as follows.

- Update
- Upgrade packages
- Add repositories
- Add PPAs (Only on Ubuntu & its derivatives)
- Install packages
- Install .deb packages
- Purge unwanted packages
- Install static binaries
- Install snap packages

## Reserved Environment Variables

Prefix `AE_` and `GITHUB_` are reserved as they are used for configuration and testing.
