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
    add_repo: true
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
    azurecli: true
    bazel: true
    brave_browser: true
    chrome: true
    docker: true
    edge: true
    gcsfuse: false
    github: true
    googlecloud: true
    gvisor: true
    hashicorp: true
    mendeley: false
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
    - kicad/kicad-5.1-releases
  # Install components
  # APT Packages, Python Modules, Debian packages
  install:
    # Debian packages: .deb files
    debs:
      - https://download.teamviewer.com/download/teamviewer_i386.deb
      - https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
    # Static Binaries which will be placed in /usr/local/bin
    # <binary-name-as-available-in-path>::<URL>
    binaries:
      - minikube::https://github.com/kubernetes/minikube/releases/download/v0.28.2/minikube-linux-amd64
      - kompose::https://github.com/kubernetes/kompose/releases/download/v1.19.0/kompose-linux-amd64
    apt:
      # Admin related Stuff
      administration:
        - dconf-editor
        - htop
        - apt-xapian-index
        - gparted
        - synaptic
        - bleachbit
      # Security Related Stuff
      security:
        - firewalld
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
        - conda
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
