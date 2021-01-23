# Changelog

## 7.0.0

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

## 6.3.0

- Added support for Linux Mint 20.1 (Ulyssa).
- Dropped support for Ubuntu 16.04, Elementary OS loki, Linux Mint 18 and Debian 8(stretch).

## 6.2.0

- **New-Repository** Hashicorp Repository (Terraform, Vault Consul etc).
- Fix `-d` and `-k` flags not working properly. [#45](https://github.com/tprasadtp/ubuntu-post-install/issues/45).
- Enable Hirsute Hippo.

## 6.1

- Update Spotify,Duo repo keys
- Enable `focal` for Duo Linux.
- Enable ROS repo for `focal`
- Enable support for Ubuntu 19.10 `groovy`
- Internal changes: Logging
- Fancier terminal output
- Removed `-H /--hide-config` flag, debugging can be done by setting `DEBUG=1`
- From this version onwards, if `--fix` or `--pre-release` is used ROS repos will not be added,
regardless of your config.

## 6.0

- Remove Lists mode
- Drop 32 bit support for x86
- Changes to some flags. Some flags are now dropped or reassigned.
- Drop Python 2 support from focal and other recent distros
- Add support for Ubuntu Focal Fossa, and Mint 20.x
- Fix Google Cloud SDK
- Migrate to GitHub Actions :octicons-octoface:
- Dark Mode
- Fixed Remote YAML (in RC4)
- Fixed whiptail prompts

## 5.5.2

- Support Mint 19.3 Tricia

## 5.5.1

- Support ElementaryOS 5.1 Thanks, [IslamAlam](https://github.com/IslamAlam)

## 5.5.0

- Eoan Support
- Remove Kubernetes repo.
- Option to fallback to LTS releases if using `--fix`
- `--pre-release` flag now supports Debian Bullseye
- Fix Gist URL not working(#17)
- Introduce `--autopilot` flag
- Introduce DEBUG modes (activated on DEBUG=1)

## 5.4.3

- Update repository gpg keys, fix classic snap installs

## 5.4.1

- Support disco

## 5.4.0

- Added support for installing snap packages {edge, stable and classic}

## 5.3.7

- Support for Duo Security for Unix repos

## 5.3.6

- Add ROS repository
- Redirect URLs to version which passed all tests.
- Update docs

## 5.3.4

- Update WineHQ keys.
- Add new wine HQ keys to repo cleanup
- Add new Spotify key to repo cleanup
- Add new warning msg function

## 5.3.3

- Add support for Linux Mint 19.1 Tessa

## 5.3.2

- Promote Cosmic to stable, add initial support for disco (19.04)

## 5.3.1

- Add preliminary support for Debian 10 Buster.
- Fixed typos in documentation.
- Removed old files, Display git tag message in releases.

## 5.3.0

- Move configuration files from /api to /config
- Update Spotify Keys [Fixes Spotify repos]
- Fix a bug which prevented Insync repo being added

## 5.2.0

- New Feature: Static binaries installation
- All script tmp files are now created /tmp/ae/

## 5.1.2

- Fix get script URLS.
- Fix Kubernetes repo url & repos for Linux Mint

## 5.1.0

- Specify YAML config via URL. You can use config YAMLs saved as gists.
