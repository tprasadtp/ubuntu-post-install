# YAML Config

The configuration file is pretty much self explanatory. All Boolean fields are optional and if not provided or if found to be invalid, fallback to false. Sample configs can be found in config directory.

```yaml
# Config API version
api: 3
name: Config Name
author: Name of Author
# Configuration
config:
  # Enabled Tasks
  tasks:
    update: true
    upgrade: false
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
    binaries: true
    snaps: true
  # Repository Flags
  add_repo:
    brave_browser: true
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
    mendeley: false
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

  # Flags
  flags:
    purge_enabled: true
    preserve_debs: false

  # Packages to purge
  purge:
    - gnome-mines
    - gnome-sudoku
    - aisleriot
    - gnome-mahjongg
  # PPA List
  ppa:
    - ppa:yubico/stable
  # Install components
  # APT Packages, Python Modules, Debian packages
  install:
    # Debian packages:  .deb files
    # CSV format similar to lists
    debian_packages:
      - https://download.teamviewer.com/download/teamviewer_i386.deb,TeamViewer.deb
    # Static Binaries which will be placed in /usr/local/bin
    # minikube, docker-compose, etc.
    # Follows same pattern as Debian packages
    # Name to be saved is second field
    binaries:
      - https://github.com/kubernetes/minikube/releases/download/v0.28.2/minikube-linux-amd64,minikube
      - https://github.com/kubernetes/kompose/releases/download/v1.19.0/kompose-linux-amd64,kompose
    apt:
      # Admin related Stuff
      administration:
        - dconf-editor
        - htop
        - apt-xapian-index
        - gdebi
        - gparted
        - synaptic
        - bleachbit
      # Security Related Stuff
      security:
        - gufw
      # Productivity & Office Tools.
      productivity:
        - pandoc
        - texstudio
        - texlive-fonts-extra
        - texlive-formats-extra
        - texlive-fonts-recommended
        - texlive-science
        - texlive-generic-extra
        - texlive-xetex
        - texlive-luatex
        - texlive-pstricks
        - texlive-science
        - texlive-lang-english
        - texlive-lang-other
        - texlive-font-utils
        - texlive-publishers
      # Multimedia Tools. Photo Editors Converting tools etc.
      multimedia:
        - audacity
        - vlc
        - gimp
        - handbrake
        - handbrake-cli
        - rawtherapee
        - darktable
        - mpv
      # Tools related to development.
      development:
        - curl
        - git
        - shellcheck
        - python3-pip
      # Everything Else
      other:
        - gnome-online-miners
      # Packages supplied by external repositories & PPAs
      external:
        - google-chrome-stable
        - spotify-client
        - code
        - google-cloud-sdk
        - docker-ce
        - runsc
        - azure-cli
        - microsoft-edge-dev
    snaps:
      - htop
      - classic::vscode
      - classic::edge::hugo

```
