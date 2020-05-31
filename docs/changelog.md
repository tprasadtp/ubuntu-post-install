# Changelog

## 6.0

- Remove Lists mode
- Drop 32 bit support for x86
- Changes to some flags. Some flags are now dropped or reassigned.
- Drop Python 2 support from focal and other recent distros
- Add support for Ubuntu Focal Fossa, and Mint 20.x
- Fix Google Cloud SDK
- Migrate to GitHub Actions :octicons-octoface:
- Dark Mode

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
