# What can it do?

## Add Repositories

This task can add the following repositories.

| Name                    | Key               | Packages                                                     |
| ----------------------- | ----------------- | ------------------------------------------------------------ |
| [Brave Browser][]*      | brave_browser     | brave-browser                                                |
| Docker                  | docker            | docker-ce, docker-ce-rootless-extras, docker-ce-cli          |
| [deCONZ][]*             | deconz            | deconz                                                       |
| [Element.io][element]*  | element_io        | element-desktop                                              |
| [GitHub - CLI][]        | github            | gh                                                           |
| [Google - Bazel][]*     | bazel             | bazel                                                        |
| Google - Chrome*        | chrome            | google-chrome-stable, google-chrome-beta                     |
| Google - Cloud SDK*     | googlecloud       | google-cloud-sdk, kubectl, google-cloud-sdk-minikube         |
| [Google - gVisor][]     | gvisor            | runsc                                                        |
| Hashicorp*              | hashicorp         | terraform, consul, nomad, vault, boundary, waypoint          |
| Mendeley desktop*       | mendeley          | mendeleydesktop                                              |
| Microsoft - Azure CLI*  | azurecli          | azure-cli                                                    |
| Microsoft - Edge*       | edge              | microsoft-edge-dev                                           |
| Microsoft - Skype*      | skype             | skypeforlinux                                                |
| Microsoft - Teams*      | teams             | teams, teams-insiders                                        |
| Microsoft - VSCode      | vscode            | code, code-insiders, code-exploration                        |
| [Miniconda][]*          | miniconda         | conda                                                        |
| NeuroDebian*            | neurodebian       | https://neuro.debian.net/                                    |
| [Podman][] (via OBS)*   | podman            | podman, podman-plugins, cri-o-runc, cri-tools, buildah, crun |
| ProtonVPN Client*       | protonvpn         | protonvpn                                                    |
| ROS                     | ros               |                                                              |
| ROS2                    | ros2              |                                                              |
| Signal*                 | signal            | signal-desktop                                               |
| Slack Desktop*          | slack             | slack-desktop                                                |
| Spotify Client*         | spotify           | spotify-client                                               |
| Sublime Text Editor*    | sublimetext       | sublime-text                                                 |
| Vivaldi*                | vivaldi           | vivaldi-stable                                               |
| Wine HQ*                | winehq            | winehq-stable, winehq-staging                                |
| [Ubuntu - Universe][]   | ubuntu_universe   |                                                              |
| [Ubuntu - Multiverse][] | ubuntu_multiverse |                                                              |
| [Ubuntu - Restricted][] | ubuntu_restricted |                                                              |
| [Debian - contrib][]    | debian_contrib    |                                                              |
| [Debian - non-free][]   | debian_nonfree    |                                                              |

- `azurecli` is not supported on Ubuntu 18.04, Debian 9, 10 and their derivatives.
- `winehq` is not supported on Ubuntu 18.04, Debian 9, 10 and their derivatives.
- `*` Only amd64/x86_64 is supported. ARM CPUs like Raspberry Pi/Nvidia Tegra are not
 supported.

!!! warning "ROS Releases & Ubuntu/Debian versions"
    - ROS repository only supports certain Ubuntu/Debian distributions. You can find more info at [ROS-Wiki](http://wiki.ros.org/ROS/Installation)
    - Though Ubuntu derivatives might work, they are not supported.

Example yaml configuration snippet is given below.

```yaml
api: 3
config:
  # Enabled Tasks
  tasks:
    update: true
    # Add Repos
    # individual repos flags are mentioned under config.add_repo key
    repo: true
  # Repository Flags
  add_repo:
    azurecli: true
    bazel: true
    brave_browser: true
    chrome: true
    docker: true
    edge: true
    element_io: true
    github: true
    googlecloud: true
    gvisor: true
    hashicorp: true
    mendeley: true
    miniconda: true
    neurodebian: true
    podman: true
    protonvpn: true
    ros: true
    ros2: true
    signal: true
    skype: true
    spotify: true
    slack: true
    sublimetext: true
    teams: true
    vivaldi: true
    vscode: true
    winehq: true
    # Debian
    debian_nonfree: true
    debian_contrib: true
    # Ubuntu
    ubuntu_universe: true
    ubuntu_multiverse: true
    ubuntu_restricted: true
```

### Note about WineHQ repository and i386 packages

If you chose to add WineHQ repository, i386 architecture is automatically enabled **AFTER** adding WineHQ repository.

### Note about Podman repository

Podman repository(provided by Kubic project) also provides golang package for some reason. So please be careful while installing golang via apt.

## Add personal package archives (PPA)

List of PPAs `config.ppa`

```yaml
api: 3
config:
  ppa:
    # With prefix ppa:
    - ppa:yubico/stable
    # Without prefix ppa:
    - kicad/kicad-5.1-releases
```

## Install apt packages

There are seven list of packages under key `config.install.apt.<category>`

1. administration - Contains Administrative packages
2. security - Contains Security related tools and packages
3. productivity - Office tools, writing tools, LateX, document tools and other
productivity tools, Email clients, browsers, IM clients etc.
4. multimedia - Multimedia tools like media players, audio converters and players etc.
5. development - IDEs, languages [go, python, ruby, rust, java etc],
Containers [docker lxc rkt etc], Python libraries, compilers [gcc, clang]
SDKs [AWS SDK, Google Cloud SDK, open-jdk, Tensor Flow], headers and libraries.
Anything related to development and `-dev` or `-devl` packages.
6. other - Everything which does not fit in the above categories.
Themes, Tools, Utilities etc.
7. external - Any packages which are provided by PPAs, or repositories not present in
base Ubuntu distribution. There's a possibility that the repository might not
be added or may be unavailable or offline. So Keeping the list separate from
others packages minimizes errors if there are any.

This classification is only for ease of use and need not be strictly followed. You can put
`vlc` package in `security`, it will be installed without issues.

### Special list of packages - Purge list

There is a special package list `config.purge` containing list of packages to be
purged from the system. This only applies if purge flag is set and purge task is enabled (when autopilot is active)

```yaml
api: 3
config:
  purge:
    - gnome-mines
    - gnome-sudoku
    - aisleriot
    - gnome-mahjongg
```

## Install Debian package archives (.deb files)

This will install deb files specified in the YAML config under `config.install.debs`.

- Each entry is URL to the deb file. URL MUST be `http` or `https`, ftp URLs are not supported!

```yaml
api: 3
config:
  install:
    debs:
      - https://atom-installer.github.com/v1.21.1/atom-amd64.deb
```

## Install Static binaries to /usr/local/bin

This will install binaries in YAML config under `config.install.binaries`.

- **Simulate** option **will** download the binary but not install it.
- Configuration is of format `binary-name::URL`. Binary name **MUST** mach regex `^([a-zA-z0-9_-]+)$`.
- For example, to install `kubectl`, the entry should look like below.

```yaml
api: 3
config:
  install:
    binaries:
      - kubectl::https://storage.googleapis.com/kubernetes-release/release/v1.20.1/bin/linux/amd64/kubectl

```

## Purge Unwanted Packages

This will purge Unwanted packages from the system.

- The packages mentioned in list `config.purge` in yaml.
!!! warning
    It is necessary to pass command line argument `-d` or  set `config.flags.purge_enabled: true` in config.

## Installing Snap packages

Script can install snap packages from snap-store. You **MUST** specify the classic snaps with prefix `classic::` See example below. Edge snaps **MUST** be prefixed with `edge::`

```yaml
api: 3
config:
  install:
    snaps:
      - htop
      - classic::vscode
      - classic::edge::hugo


```

## All In one

This will perform Following actions. (In the following order)

- Update repository metadata
- Upgrade packages
- Add repositories
- Add PPAs
- Install APT packages
- Install DEB files
- Install static binaries
- Install snap packages

This option will honor `--autopilot` and `--simulate` options as individual tasks would do.

## AUTOPILOT Mode

Using `--autopilot` will skip all UI prompts and confirmations.
This mode requires you to specify tasks to be run if using YAML config. Example snippet is given below.

```yaml
api: 3
config:
  # Enabled Tasks
  tasks:
    update: true
    upgrade: true
    # Add Repos
    # individual repos flags are mentioned under config.add_repo
    repo: true
    # Add PPAs
    ppa: true
    # APT Packages
    apt: true
    # Whether to purge packages mentioned in config.purge
    purge: true
    # DEB packages
    debs: true
    # Staic binaries
    binaries: true
    # Snap packages
    snaps: true
```

| Name                                                                                       | Key           |
| ------------------------------------------------------------------------------------------ | ------------- |
| Update APT Metadata(Same as running `apt-get update`)                                      | `update`      |
| Upgrade packages                                                                           | `upgrade`     |
| [Add Repositories](#add-repositories)                                                      | `add_repo`    |
| [Add personal package archives (PPA)](#add-personal-package-archives-ppa)                  | `ppa`         |
| [Install apt packages](#install-apt-packages)                                              | `apt`         |
| [Install Debian package archives (.deb files)](#install-debian-package-archives-deb-files) | `debs`        |
| [Install Static binaries to /usr/local/bin](#install-static-binaries-to-usrlocalbin)       | `binaries`    |
| [Purge Unwanted Packages](#purge-unwanted-packages)                                        | `purge`       |
| [Installing Snap packages](#installing-snap-packages)                                      | `snaps`       |

## Delete logs

A log file is generated containing all the output generated by the apt and other commands

- This task will delete the log file `after-effects.log` in logs folder


[Miniconda]: https://www.anaconda.com/blog/rpm-and-debian-repositories-for-miniconda
[Brave Browser]: https://brave.com/linux/
[deCONZ]: https://phoscon.de/en/conbee/install#ubuntu
[element]: https://element.io
[GitHub - CLI]: https://cli.github.com
[Google - gVisor]: https://gvisor.dev
[Podman]: https://podmain.io
[Google - Bazel]: https://bazel.build
[Ubuntu - Universe]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Ubuntu - Restricted]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Ubuntu - Multiverse]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Debian - contrib]: https://www.debian.org/doc/debian-policy/ch-archive#s-contrib
[Debian - non-free]: https://www.debian.org/doc/debian-policy/ch-archive#s-non-free
