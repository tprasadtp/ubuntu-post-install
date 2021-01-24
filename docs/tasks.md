# What can it do?

## Add Repositories

This task can add the following repositories.

| Name                    | Key               | Packages                                                     |
| ----------------------- | ----------------- | ------------------------------------------------------------ |
| Docker                  | docker            | docker-ce, containerd.io, docker-ce-cli                      |
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
| ROS                     | ros               |                                                              |
| ROS2                    | ros2              |                                                              |
| Signal                  | signal            | signal-desktop                                               |
| Spotify Client          | spotify           | spotify-client                                               |
| Sublime Text Editor     | sublimetext       | sublime-text                                                 |
| Wine HQ                 | winehq            | winehq-stable, winehq-staging                                |
| [Ubuntu - Universe][]   | ubuntu_universe   |                                                              |
| [Ubuntu - Multiverse][] | ubuntu_multiverse |                                                              |
| [Ubuntu - Restricted][] | ubuntu_restricted |                                                              |
| [Debian - contrib][]    | debian_contrib    |                                                              |
| [Debian - non-free][]   | debian_nonfree    |                                                              |

> Support for adding `multiverse`, `universe`, `restricted`(on Ubuntu), `contrib` and `non-free` (on Debian) is considered beta. Use with caution!

??? tip "Using `--fix` flag"
    Please note that the above repositories are sometimes not updated for latest Ubuntu release and most certainly will not be available for upcoming release of Ubuntu(Alpha/Beta). It might take some time till the repositories are available for the latest release. Use -f or --fix command line option or --pre-release in case you are using a development version of Ubuntu to revert using latest available version of repositories (usually previous Ubuntu release or in case of Beta/Alpha latest stable release of Ubuntu). [For more info see command line options.](/clioptions/#fix-for-latest-ubuntu-releases)

!!! warning "ROS Releases & Ubuntu/Debian versions"
    - ROS repository only supports certain Ubuntu/Debian distributions. You can find more info at [ROS-Wiki](http://wiki.ros.org/ROS/Installation)
    - Though Ubuntu derivatives might work, they are not supported.

Example yaml configuration snippet is given below.

```yml
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
    chrome: true
    docker: true
    edge: true
    gcsfuse: true
    github: true
    googlecloud: true
    gvisor: true
    hashicorp: true
    mendeley: true
    podman: true
    ros: true
    ros2: true
    signal: true
    skype: true
    spotify: true
    sublimetext: true
    teams: true
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

### Note about Wine HQ and i386 packages

To install i386 pacakges or packages which have i386 dependencies (eg. wine-stable), you **MUST** enable foreign architectures BEFORE running this script!

### Note abount PodMan repository

Podman repository(Provided by Kubic project) also provides golang package for some reason (ughhh!) so please be careful while installing go via apt.

## Add personal package archives (PPA)

- Only one ppa entry per line (No comments or anything else anywhere in the file) in the format ppa:{author}/{ppa} for example `ppa:mozillateam/firefox-next` The file will be read and the PPAs will be added from the list.
- Logs will  show entry in the format `[date and time] [  PPA-Logs  ] <log>`


## Install apt packages

There are seven list of packages under key config.install.apt.[mentioned from 1-7]

1. administration - Contains Administrative packages
2. security - Contains Security related tools and packages
3. productivity - Office tools, writing tools, LateX, document tools and other
productivity tools, Email clients, browsers, IM clients etc.
4. multimedia - Multimedia tools like media players, audio converters and playes etc.
5. development - IDEs [Spyder, Jetbeans etc], languages [go, python, ruby, rust, java etc],
Containers [docker lxc rkt etc], Python libraries, compilers [gcc, clang]
SDKs [AWS SDK, Google Cloud SDK, open-jdk, Tensor Flow], headers and libraries[ocl-icd-dev],
Anything related to development and -dev or -devl packages.
6. other - Everything which does not fit in the above categories.
Themes, Tools, Utilities etc.
7. external - Any packages which are provided by ppas, or repositories not present in
base Ubuntu distribution. There's a possibility that the repository might not
be added or may be unavailable or offline. So Keeping the list separate from
others packages minimizes errors if there are any.

This classification is only for ease of use and need not be strictly followed. You can put
'vlc' package in 'security', it will still install fine. This classification helps
while writing configs and editing them. Its advised to follow it if your configs
tend to get to couple of hundreds of lines. Also YAML file should be a valid YAML & indented by 2 spaces.

### Special list of packages - Purge list

There is a special package list under key, config.purge  list of apt packages to be
purged from the system.

## Install Debian package archives (.deb files)

This will install deb files specified in the YAML config under `config.install.debian_packages`.

- Each DEB file to be installed should have following entry.
- URL to the deb file which can be accessed using wget`,`Name of the deb file without any spaces or special chars except hyphen.
- For example to install Atom Editor the entry should look like below.
- Some deb packages will add their own apt source entry and add their repository keys to system keyring.


```yaml
config:
  install:
    debian_packages:
      - https://atom-installer.github.com/v1.21.1/atom-amd64.deb,ATOM-Editor.deb

```

- First part is the URL to the deb file separated by ',' name of the file.

!!! note "Note on file name in configuration"
    Please note that deb file will be  saved with the name mentioned in the file. (DEB file is named **exactly** as mentioned in the second field. So if you want them to be named with extension .deb include that in the second field and avoid illegal chars)

## Install Static binaries to /usr/local/bin

This will install binaries `bin.list` or YAML config under `config.install.binaries`.

- **Simulate** option **will** download the package but not install it.
- Configuration is similar to deb files mentioned above. First part is the URL to the binary file followed by ',' and name of the binary.
- For example, to install `docker-compose`, the entry should look like below.

```yaml
config:
  install:
    binaries:
      - https://storage.googleapis.com/kubernetes-release/release/v1.20.1/bin/linux/amd64/kubectl,kubectl

```

!!! note "Note on file names in configuration"
    Please note that file will be saved with the name mentioned in the file and will be in your path.

## Purge Unwanted Packages

This will purge Unwanted packages from the system.

- The packages mentioned in `config.purge` in yaml.
- The format of the purge.list is similar to that of packages, one package per line

!!! warning
    It is necessary to pass command line argument `-d` or  set `config.flags.purge_enabled: true` in config.

## Installing Snap packages

Script can install snap packages from snapstore. For example check the default config file.
You should specify the classic snaps under `install.snaps.calssic`,
edge snaps under `install.snaps.edge` and normal snaps under `install.snaps.normal` in the yaml file.


```yaml
config:
  install:
    snaps:
      normal:
        - htop
      classic:
        - vscode

```

!!! warning
    - Its responsibility of the user to separate classic snaps, edge and normal snaps.

## All In one

This will perform Following actions. (In the following order)

- Update repository metadata
- Upgrade packages
- Add repositories
- Add PPAs
- Install Apps
- Install DEB files
- Install Static binaries

This option will honor --autopilot and --simulate options as individual tasks would do.

## AUTOPILOT Mode

Using `--autopilot` will skip all UI prompts and confirmations.
This mode requires you to specify tasks to be run if using YAML config. Example snippet is given below.

```yaml
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
    debs: true
    binaries: true
```

| Name                                                                                       | Key           |
| ------------------------------------------------------------------------------------------ | ------------- |
| [Add Repositories](#add-repositories)                                                      | `repo`        |
| [Add personal package archives (PPA)](#add-personal-package-archives-ppa)                  | `ppa`         |
| [Install apt packages](#install-apt-packages)                                              | `apt`         |
| [Install Debian package archives (.deb files)](#install-debian-package-archives-deb-files) | `dev`         |
| [Install Static binaries to /usr/local/bin](#install-static-binaries-to-usrlocalbin)       | `binaries`    |
| [Purge Unwanted Packages](#purge-unwanted-packages)                                        | `purge`       |
| [Installing Snap packages](#installing-snap-packages)                                      | `snap`        |
| [All In one](#all-in-one)                                                                  | `all`         |

## Delete logs

A log file is generated containing all the output generated by the apt and other commands

- This task will delete the log file `after-effects.log`.
- Log file is located in the directory `logs` in folder which you ran thin script.
- Sometimes errors might not be written to log file but displayed on screen and vice-versa.

[GitHub - CLI]: https://cli.github.com
[Google - gVisor]: https://gvisor.dev
[Podman]: https://podmain.io
[Google - Bazel]: https://bazel.build
[Ubuntu - Universe]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Ubuntu - Restricted]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Ubuntu - Multiverse]: https://help.ubuntu.com/community/Repositories/Ubuntu
[Debian - contrib]: https://www.debian.org/doc/debian-policy/ch-archive#s-contrib
[Debian - non-free]: https://www.debian.org/doc/debian-policy/ch-archive#s-non-free
