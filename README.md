# Ubuntu / Debian Post Installation Script

Effortless way to setup your fresh Ubuntu, Linux Mint and Debian installation.

[![build][build-badge]][build-link]
[![release][release-ci-badge]][release-ci-link]
[![docs][docs-ci-badge]][docs-ci-link]
[![netlify][netlify-badge]][netlify]
[![version][version]][changelog]
[![license][gpl-badge]][license]
![dl](https://img.shields.io/github/downloads/tprasadtp/ubuntu-post-install/total?logo=github&label=DL)

![Bash](https://static.prasadt.com/logo64/bash.png)

## How to use this

### 1. Get the script

#### Using latest stable version (Recommended)

```console
wget https://github.com/tprasadtp/ubuntu-post-install/releases/latest/download/after-effects -O after-effects
wget https://github.com/tprasadtp/ubuntu-post-install/releases/latest/download/sha256sums.txt -O sha256sums.txt
sha256sum -c sha256sums.txt
```

#### Using latest master branch

```console
wget https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/after-effects -O after-effects
```

### 2. Setup your YAML configuration file

Setup YAML file to suit your needs. Change PPAs, add or delete packages to list etc.
Please see [Configuration](https://ae.prasadt.com/configuration/) & [Tasks](https://ae.prasadt.com/tasks/).

[![Configuration-Page](https://img.shields.io/badge/Info-Configuration-blue.svg)](https://ae.prasadt.com/configuration/)
[![Tasks-Page](https://img.shields.io/badge/Info-Tasks-green.svg)](https://ae.prasadt.com/tasks/)

### 3. Run the script

Run the script as **root**.

Sample configuration can be found in `config` directory.

```console
  chmod +x after-effects
  sudo ./after-effects <path-to-your-config or url to config file>
```

## See in Action

![inaction](docs/assets/recordings/ubuntu-focal.gif)

## FAQ & Documentation

See /docs or visit [docs][docs]

## Supported Distributions

[![Ubuntu](https://static.prasadt.com/logo64/ubuntu.png)](https://www.ubuntu.com/desktop)
[![Kubuntu](https://static.prasadt.com/logo64/kubuntu.png)](https://kubuntu.org/)
[![Lubuntu](https://static.prasadt.com/logo64/lubuntu.png)](https://lubuntu.net/)
[![Xubuntu](https://static.prasadt.com/logo64/xubuntu.png)](https://xubuntu.net/)
[![Ubuntu-Mate](https://static.prasadt.com/logo64/ubuntu-mate.png)](https://ubuntu-mate.org/)
[![Ubuntu-Budgie](https://static.prasadt.com/logo64/ubuntu-budgie.png)](https://ubuntubudgie.org/)
[![Ubuntu-Studio](https://static.prasadt.com/logo64/ubuntu-studio.png)](https://ubuntustudio.org/)
[![Linux-Mint](https://static.prasadt.com/logo64/linux-mint.png)](https://www.linuxmint.com/)
[![Debian](https://static.prasadt.com/logo64/debian.png)](https://www.debian.org/)
[![Elementary-OS](https://static.prasadt.com/logo64/elementary-os.png)](https://elementary.io/)

I have not tested the script on the distros listed below. Because they use Ubuntu as their base,
It should work fine. But no promises.

[![Kde-Neon](https://static.prasadt.com/logo64/kde-neon.png)](https://neon.kde.org/)
[![Pop-OS](https://static.prasadt.com/logo64/pop-os.png)](https://system76.com/pop)
[![Bodhi-Linux](https://static.prasadt.com/logo64/bodhi-linux.png)](https://www.bodhilinux.com/)
[![Peppermint-OS](https://static.prasadt.com/logo64/peppermint-os.png)](https://peppermintos.com/)

For a complete  list of supported distributions [click here](https://ae.prasadt.com/faq/distros/).

## Features

- [Install packages](https://ae.prasadt.com/tasks/#install-apt-packages)
- [Add repositories](https://ae.prasadt.com/tasks/#add-repositories)
- [Remove pre installed](https://ae.prasadt.com/tasks/#purge-unwanted-packages)
- [Add PPAs](https://ae.prasadt.com/tasks/#add-personal-package-archives-ppa)
- [Install deb packages](https://ae.prasadt.com/tasks/#install-debian-package-archives-deb-files)
- [Install static binaries](https://ae.prasadt.com/tasks/#install-static-binaries)
- [Install snap packages](https://ae.prasadt.com/tasks/#installing-snap-packages)

Also handles adding several tweaks and fixes necessary to add repositories and PPAs, supports completely non-interactive mode, so that you can let it run while you have moaar ☕

## Supported External repositories

| Name                    | Key               | Packages                                                     |
| ----------------------- | ----------------- | ------------------------------------------------------------ |
| [Brave Browser][]       | brave_browser     | brave-browser                                                |
| Docker                  | docker            | docker-ce, docker-ce-rootless-extras, docker-ce-cli          |
| [GitHub - CLI][]        | github            | gh                                                           |
| [Google - Bazel][]      | bazel             | bazel                                                        |
| Google - Chrome         | chrome            | google-chrome-stable, google-chrome-beta                     |
| Google - Cloud SDK      | googlecloud       | google-cloud-sdk, kubectl, google-cloud-sdk-minikube         |
| [Google - gVisor][]     | gvisor            | runsc                                                        |
| Hashicorp               | hashicorp         | terraform, consul, nomad, vault, boundary, waypoint          |
| Mendeley desktop        | mendeley          | mendeleydesktop                                              |
| Microsoft - Azure CLI   | azurecli          | azure-cli                                                    |
| Microsoft - Edge        | edge              | microsoft-edge-dev                                           |
| Microsoft - Skype       | skype             | skypeforlinux                                                |
| Microsoft - Teams       | teams             | teams, teams-insiders                                        |
| Microsoft - VSCode      | vscode            | code, code-insiders, code-exploration                        |
| [Podman][] (via OBS)    | podman            | podman, podman-plugins, cri-o-runc, cri-tools, buildah, crun |
| ProtonVPN Client        | protonvpn         | protonvpn                                                    |
| ROS                     | ros               |                                                              |
| ROS2                    | ros2              |                                                              |
| Signal                  | signal            | signal-desktop                                               |
| Slack Desktop           | slack             | slack-desktop                                                |
| Spotify Client          | spotify           | spotify-client                                               |
| Sublime Text Editor     | sublimetext       | sublime-text                                                 |
| Vivaldi                 | vivaldi           | vivaldi-stable                                               |
| Wine HQ                 | winehq            | winehq-stable, winehq-staging                                |
| [Ubuntu - Universe][]   | ubuntu_universe   |                                                              |
| [Ubuntu - Multiverse][] | ubuntu_multiverse |                                                              |
| [Ubuntu - Restricted][] | ubuntu_restricted |                                                              |
| [Debian - contrib][]    | debian_contrib    |                                                              |
| [Debian - non-free][]   | debian_nonfree    |                                                              |

> Support for adding `multiverse`, `universe`, `restricted`(on Ubuntu), `contrib` and `non-free` (on Debian) is considered beta. Use with caution!

## Issues & Help

- Please check [FAQ][FAQ] & [known issues][known-issues].
- Please include the log file and terminal output while opening an issue.

## Contributing & Forks

See [Contributing and forks](/CONTRIBUTING.md)

## Alternatives

- [snwh/ubuntu-post-install](https://github.com/snwh/ubuntu-post-install):  Has few features like setting up dotfiles, but has limited config options and requires shell to be interactive. Only few external repositories are supported.
- [Ansible](https://ansible.com) : Requires python on your system. Much more deteministic and better idempotency. There are plenty of roles and collections available on ansible-galaxy. But it adds more complexity and you have to write your own playbooks.

![Analytics](https://ga-beacon.prasadt.com/UA-101760811-3/github/ubuntu-post-install?flat)

[FAQ]: https://ae.prasadt.com/faq/dependencies/
[docs]: https://ae.prasadt.com/
[known-issues]: https://ae.prasadt.com/faq/errors/
[changelog]: https://ae.prasadt.com/changelog/

[build-badge]: https://github.com/tprasadtp/ubuntu-post-install/workflows/build/badge.svg
[build-link]: https://github.com/tprasadtp/ubuntu-post-install/actions?query=workflow%3Abuild
[release-ci-badge]: https://github.com/tprasadtp/ubuntu-post-install/workflows/release/badge.svg
[release-ci-link]: https://github.com/tprasadtp/ubuntu-post-install/actions?query=workflow%3Arelease

[docs-ci-badge]: https://github.com/tprasadtp/ubuntu-post-install/workflows/docs/badge.svg
[docs-ci-link]: https://github.com/tprasadtp/ubuntu-post-install/actions?query=workflow%3Adocs

[netlify-badge]: https://api.netlify.com/api/v1/badges/887c3d5c-5203-46b9-a31d-67cada282f36/deploy-status
[netlify]: https://app.netlify.com/sites/ubuntu-post-install/deploys

[version]: https://img.shields.io/github/v/release/tprasadtp/ubuntu-post-install?label=version

[commit]: https://img.shields.io/badge/dynamic/json.svg?label=commit&style=flat&url=https://ae.prasadt.com/commit.json&query=commit.id
[commit-deployed-ts]: https://img.shields.io/badge/dynamic/json.svg?label=on&style=flat&url=https://ae.prasadt.com/commit.json&query=ts
[deployed]: https://img.shields.io/badge/dynamic/json.svg?label=deployed&color=success&style=flat&prefix=%23&url=https://ae.prasadt.com/commit.json&query=build.number

[gpl-badge]: https://img.shields.io/badge/License-GPLv3-ff69b4
[license]: https://github.com/tprasadtp/ubuntu-post-install/blob/master/LICENSE

[Brave Browser]: https://brave.com/linux/
[GitHub - CLI]: https://cli.github.com
[Google - gVisor]: https://gvisor.dev
[Podman]: https://podmain.io
[Google - Bazel]: https://bazel.build
[Ubuntu - Universe]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Ubuntu - Restricted]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Ubuntu - Multiverse]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Debian - contrib]: https://www.debian.org/doc/debian-policy/ch-archive#s-contrib
[Debian - non-free]: https://www.debian.org/doc/debian-policy/ch-archive#s-non-free
