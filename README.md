# Ubuntu After Effects

A bash script to setup your fresh install of ubuntu.
Currently I am reorganizing this project so few things are broken.

[![Build Status](https://travis-ci.org/tprasadtp/after-effects-ubuntu.svg?branch=master)](https://travis-ci.org/tprasadtp/after-effects-ubuntu)
[![Latest Version](https://img.shields.io/github/release/tprasadtp/after-effects-ubuntu/all.svg?label=Latest)](https://github.com/tprasadtp/after-effects-ubuntu/releases)
[![Latest Version](https://img.shields.io/github/release/tprasadtp/after-effects-ubuntu.svg?label=Stable)](https://github.com/tprasadtp/after-effects-ubuntu/releases)
[![label](https://img.shields.io/github/issues-raw/badges/shields/website.svg)](https://github.com/tprasadtp/after-effects-ubuntu/issues)
[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)](https://github.com/tprasadtp/after-effects-ubuntu/commits/master)
[![license](https://img.shields.io/github/license/tprasadtp/after-effects-ubuntu.svg)](https://github.com/tprasadtp/after-effects-ubuntu)

` Github URL: https://github.com/tprasadtp/after-effects-ubuntu `

* Current Project structure
```
.
├── data
│   ├── extra
│   │   └── spotify
│   ├── lists
│   │   ├── deb_files.list
│   │   ├── development.list
│   │   ├── gsettings.list
│   │   ├── keyservers.list
│   │   ├── keys.list
│   │   ├── latex.list
│   │   ├── multimedia.list
│   │   ├── ppa_extra.list
│   │   ├── ppa.list
│   │   └── utilities.list
│   ├── repos_and_deb_urls
│   ├── Repos_Manual_addedby_DEBs
│   ├── setup_script.log
│   └── ubuntu-16.04-fresh-install-bash-hist.log
├── functions
│   ├── addppa
│   ├── addrepository
│   ├── all_in_one
│   ├── catalyst
│   ├── checkconnection
│   ├── goodbyemsg
│   ├── installapps1
│   ├── installdebs
│   ├── install_latex
│   ├── looks
│   ├── reset_repo
│   ├── todoasmodular
│   ├── update
│   └── utils
├── tests
│   └── test-shell-scripts
├── after-effects
├── .gitignore
├── LICENSE
├── project.tree
├── README.md
└── .travis.yml
```



### Required additional programs, General  Requirements
- _adb_ and _fastboot_ for `android-tools`
- _imagemagick_ for `image-processing`
- _texlive-extra-utils_ for `office-tools`
- _stow_ for `stow`: to symlink config files and scripts from a single directory.
- _imwheel_ for using custom imwheel config
- Assumes that you are using a debian based system.
- Please see the documentation in individual folders for details regarding each of them.
- Most of them have help flag `--help -h` builtin.

### Changelogs


#### _v1.0_
* Initial upload.

Well Bob, why have you explained every stupid thing in comments? I know most of them, its stupid.

--You might! But that increases readability and in case I let it eat dust, catch up with it after 10 years, it helps.
