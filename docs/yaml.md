# YAML Config

The configuration file is pretty much self explanatory so, I am going to just post a sample config file below. All Boolean fields are optional and if not provided or if found to be invalid, fallback to false. Sample configs can be found in config directory.

```yaml
# Install Config
version: 6
name: Polaris
author: Prasad T
# Configuration
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
    binaries: true
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
  # Flags
  flags:
    purge_enabled: true
    preserve_debs: true


  # Packages to purge
  purge:
    - gnome-mines
    - gnome-sudoku
    - aisleriot
    - gnome-mahjongg
  # PPA List
  ppa:
    - ppa:yubico/stable
    - ppa:teejee2008/ppa
  # Install components
  # APT Packages, Python Modules, Debian packages
  install:
    # Python 2 Modules
    # Not all distros support python 2
    python2:
      - docker-compose
    # Python 3 Modules
    python3:
      - virtualenv
    # Debian packages:  .deb files
    # CSV format similar to lists
    debian_packages:
      - https://atom-installer.github.com/v1.28.0/atom-amd64.deb,Atom-Editor.deb
      - https://download.teamviewer.com/download/teamviewer_i386.deb,Teamviewer.deb
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
        - empathy
        - evolution
        - realmd
        - pandoc-data
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
        - texlive-extra-utils
        - texlive-lang-english
        - texlive-lang-other
        - texlive-font-utils
        - texlive-publishers
        - gummi
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
        - pavucontrol
        - cheese
      # Tools related to development.
      development:
        - curl
        - spyder
        - spyder3
        - git
        - shellcheck
        - ocl-icd-dev
        - opencl-headers
        - clinfo
        - vainfo
        - vdpauinfo
        - ocl-icd-libopencl1
        - ruby
        - ruby-dev
        - python-magic
        - putty
        - python3-pip
        - python-dateutil
        - python-pip-whl
        - python-pip
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

```
