
<!-- old changelog-->
- **New Repository** Google - [Bazel](https://bazel.build)
- **New-Repository** Google - [gVisor](https://gvisor.dev)
- **New-Repository** Microsoft - Azure CLI
- **New-Repository** Microsoft - Edge
- **New-Repository** Microsoft - Teams
- **New-Repository** [Podman](https://podmain.io) (via OBS from Kubic Project)
- **New-Repository** ROS2
- **New-Repository** SublimeText
- **BREAKING-CHANGE** Renamed Google chrome repo config from `google` to `chrome`
- **REMOVED** Python packages (Due to low usage and you should use either system package manger
or virtual environments)
- **REMOVED** Resetting repo features. This is because apt-key is deprecated
and keys/sources might have been added by other tools or manually, and
we do not want to change them without referring to thier key ids.
- **REMOVED** Duo for linux repository. It requires additional configuration and is best handled via config mangemment.
- **DISTRO** Drop support for Ubuntu Xenial(16.04) and other derivatives based on it.
- _(Internal)_ Rework adding apt-keys as `apt-key` is deprecated.
- _(Internal)_ Add arch checks for gcsfuse
- _(Internal)_ Logging tweaks

## v6.3.0

- Added support for Linux Mint 20.1 (Ulyssa).
- Dropped support for Ubuntu 16.04, Elementary OS loki, Linux Mint 18 and Debian 8(stretch).

## v6.2.0

- **New-Repository** Hashicorp Repository (Terraform, Vault Consul etc).
- Fix `-d` and `-k` flags not working properly. [#45](https://github.com/tprasadtp/ubuntu-post-install/issues/45).
- Enable Hirsute Hippo.
