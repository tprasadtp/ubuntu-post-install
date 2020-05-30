# What can it do?

## Add Repositories

This task can add the following repositories.


| Name                 | Key |
|:---------------------|:--- |
|Docker | docker
|Duo Security Unix | duo
|Google Chrome & Google Earth | google
|Google Cloud SDK | googlecloud
|GCSFUSE | gcsfuse
|Insync | insync
|Mendeley desktop | mendeley
|ROS | ros
|Signal for desktop | signal
|Skype | skype
|Spotify Desktop | spotify
|Visual Studio code | vscode
| Wine HQ | winehq


??? tip "Using `--fix` falg"
    Please note that the above repositories are sometimes not updated for latest Ubuntu release and most certainly will not be available for upcoming release of Ubuntu(Alpha/Beta). It might take some time till the repositories are available for the latest release. Use -f or --fix command line option or --pre-release in case you are using a development version of Ubuntu to revert using latest available version of repositories (usually previous Ubuntu release or in case of Beta/Alpha latest stable release of Ubuntu). [For more info see command line options.](/clioptions/#fix-for-latest-ubuntu-releases)

??? tip "Controlling which repository is added using config file"
    You can set your YML file to decide which repository is added. Some repositories may no be supported on your architecture or distribution. Take a look at [config.yml](/api/yaml) for example. If you omit a value, it defaults to false **ALWAYS**. Do note that if you are using lists default values are different, they are mentioned in below.

!!! warning "ROS Releases & Ubuntu/Debian versions"
    - ROS repository only support certain Ubuntu/Debian distributions. Please use appropriate packages to install depending on
    your distro/version. You can find more info at [ROS-Wiki](http://wiki.ros.org/ROS/Installation)
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
    winehq: true
    docker: true
    mendeley: false
    googlecloud: true
    spotify: true
    vscode: true
    skype: true
    signal: false
    insync: true
    google: true
```

### Canonical partner repositories

  Canonical partner repositories are not configured or enabled for derivatives of Ubuntu because thee might be some conflicts.

!!! bug "Note on 32 bit & ARM Architecture"

    - Please note that Google Chrome doesn't support 32 bit architecture, please use Chromium.
    - Signal, Skype, Mendeley and Visual studio code do not support 32 bit architecture.
    - Some repositories are not available for ARM architecture.

## Add personal package archives (PPA)

- PPAs can be added using the configuration file in data directory `./data/ppa.list` or in the YML file.
- Only one ppa entry per line (No comments or anything else anywhere in the file) in the format ppa:{author}/{ppa} for example `ppa:mozillateam/firefox-next` The file will be read and the PPAs will be added from the list.
- Logs will  show entry in the format `[date and time] [  PPA-Logs  ] <log>`

!!! warning

    - PPAs should be checked before they are added to the list. Sometimes PPAs listed in the file may not be available for all releases.
    - Debian does not support PPAs.

## Install apt packages

- Packages can be installed by using configuration lists in the data directory. This works similar to ppas

### There are seven list of packages under key config.install.apt.[mentioned from 1-7]

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

- Logs will  show entry in the format `[<date and time>] [  PKG  ] <log>` for dpkg actions and
- APT Logs will  show entry in the format `[<date and time>] [  APT  ] <log>` for actions performed by apt commands. (`apt-get install -f` for missing packages)
- **Simulate** option will use `--dry-run` option in dpkg to Simulate DEB installation.
- Configuration file is a `csv` file without headers. first column corresponds to URL ans the second field the file name under which the file is saved.
- Each DEB file to be installed should have following entry.
- URL to the deb file which can be accessed using wget`,`Name of the deb file without any spaces or special chars except hyphen.
- For example to install Atom Editor the entry should look like below.

```csv
https://atom-installer.github.com/v1.21.1/atom-amd64.deb,ATOM-Editor.deb
```

```yaml
config:
  install:
    debian_packages:
      - https://atom-installer.github.com/v1.21.1/atom-amd64.deb,ATOM-Editor.deb

```

- First part is the URL to the deb file separated by ',' name of the file.

!!! note "Note on file names in configuration"
    Please note that deb file will be  saved with the name mentioned in the file. (DEB file is named **exactly** as mentioned in the second field. So if you want them to be named with extension .deb include that in the second field and avoid illegal chars)

## Install Static binaries to /usr/local/bin

This will install binaries `bin.list` or YAML config under `config.install.binaries`.

- **Simulate** option **will** download the package but not install it.
- Configuration file is a `csv` file without headers. first column corresponds to URL ans the second field the file name under which the file is saved.
- Each DEB file to be installed should have following entry.
- URL to the deb file which can be accessed using wget`,`Name of the deb file without any spaces or special chars except hyphen.
- For example, to install `kompose`, the entry should look like below.

```csv
https://github.com/kubernetes/kompose/releases/download/v1.19.0/kompose-linux-amd64,kompose
```

```yaml
config:
  install:
    binaries:
      - https://github.com/kubernetes/kompose/releases/download/v1.19.0/kompose-linux-amd64,kompose

```

- First part is the URL to the binary file separated by ',' name of the binary.

!!! note "Note on file names in configuration"
    Please note that file will be saved with the name mentioned in the file and will be in your path.

## Install python packages (via pip)

This will install system wide python packages using pip. You can specify in YAML config under `config.install.python2` or `config.install.python3`
This task requires `python-pip package` is installed, If not , will be installed anyway.

- These follow similar configuration as packages files. One item per line. however you can specify version requirements as you would for requirements file.
- Simulate flag will skip installing packages, unless `--internal-ci-mode` is used.

Example configuration is given below.

```yaml
config:
  install:
    python2:
      - docker-compose
    python3:
      - awscli

```

!!! warning
    Don't mix Python 3 packages with Python 2 packages. Also, some recent distributions do not support Python2.

## Purge Unwanted Packages

This will purge Unwanted packages from the system.

- The packages mentioned in `config.purge` in yaml.
- The format of the purge.list is similar to that of packages, one packages per line of the file and no comments or anything else.

!!! warning
    It is necessary to pass command line argument `-d` or  set `config.flags.purge_enabled: true` in config.

## Reset repositories / Purge PPAs

- This will reset the repositories, and purge ppas added by this script.
- This will **NOT** reset or remove repositories added by the DEB files.
- Simulate option has no effect on this action and ppa-purge **WILL** downgrade packages if necessary.

!!! bug "Scope of this function"
    This will **NOT** remove PPAs or repositories you have added manually or those added while installing DEB files.
    Additionally, this will not un-install packages installed from those repos and PPAs.

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
- Install Python 2 modules
- Install Python 3 Modules
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
    # individual repos flags are mentioned under config.add_repo key
    repo: true
    # Add PPAs
    ppa: true
    # APT Packages
    apt: true
    # Whether to purge packages mentioned in config.purge key
    purge: true
    debs: true
    pip2: true
    pip3: true
    binaries: true
```


## Delete logs

A log file is generated containing all the output generated by the apt and other commands and contain generic information and errors .

- This task will delete the log file `after-effects.log`.
- Log file is located in the directory `logs` in folder which you ran thin script.
- Sometimes errors might not be written to log file but displayed on screen and vice-versa.
- Please verify that everything went okay before deleting the logs.
