# Changelogs

## _v3.6_

- Add Option to install system wide python packages using pip
- Promote Bionic to stable and update codenames
- Update pre-release to cosmic, rename test script for pre release
- Remove unused dockerfiles

## _v3.4_

- Delete cached and downloaded DEBs. (Can be changed with `-k` flag )
- Remove Gnome Specific stuff from default list
- Remove PPAs incompatible with bionic
- Bionic is supported with --pre-release flag only with default list. 

## _v3.3_

- Add Signal Desktop repository
- Better way to handle EOL error messages
- Fix: Visual Studio Code GPG key not deleted while removing repos.
- Lint Readme Markdown
- Nuke Submodules

## _v3.2_

- Allow Bionic test to fail on Travis.
- Only print logs in Travis if there is an error or a flag is passed.
- Switch to submodules for data directory
- List files have their own repo now.
- Zesty reaches EOL soon. Remove it.
- Use daily images for bionic

## _v3.1_

### Added Support for Ubuntu Bionic Beaver

- Added Support for Upcoming Ubuntu release bionic.
- Added an option to use repository for last stable release on bionic.
- Use Ubuntu Base 18.04 LTS (Bionic Beaver) daily build to build docker image.
- Allow Bionic tests to fail on Travis CI.
- Dockerfiles & tests for bionic.
- Inform in script if running on Upcoming release.
- Drop google-cloud-sdk from fix_repo_not_available. Use `--pre-release` if using beta/alpha Ubuntu release.
- Add Visual studio to repos instead of deb files
- Rename logging directory to after-effects

## _v3.0_

- ### Confirmation dialogs
  - Add Confirmation dialog using whiptail for Actions like Adding PPA, Repositories, Installing Apps, and Deb files
  - Provide an option via command line to bypass the confirmation dialog for ci and automated environments or when its too annoying

- ### Improvements to Simulate option
  - If the simulate option is selected then Only calculate the upgrade but do not perform upgrade.
  - Added improved Simulate options. Helpful when just want to change somethings and test scripts without really downloading and installing packages
  - Simulate option is by default false and can be toggled by passing `-s` or `--simulate` while running the script via command line
- ### Partner repositories and Derivatives
  - Do not Enable Canonical Partner repositories in Ubuntu derivatives as they are enabled in installer or are different than Ubuntu. This leaves Partner repositories as they were before
- ### Add Feature: Purge Unwanted Packages
  - Fix a bug in PPA purge function where it would wait for user confirmation
  - Add a feature to purge not required packages, usually games and boaltware which comes preloaded  with the install. It is necessary to pass a flag `-d` via command line to purge them while running the script since its dangerous
- ### Logs & Console messages
  - Improved logging . Redirecting errors and adding time-stamps works better.
- ### Travis CI and Docker Testing
  - Added Dockerfiles used for test cases since base Ubuntu image does not have few necessary packages (`ping, wget, lsb-release, whiptail, iputils-ping`) and configuration required. Since most of these are bound to present on Ubuntu/Ubuntu Server/ Ubuntu derivatives it is not necessary to add them in the script.
  - Added Docker and Travis CI detection . Now the logs will indicate if the script is running in Container or Travis CI
  - Test Script on Travis CI in parallel using jobs.
  - Test Script on Trusty using Travis Host
  - Test Script on Xenial, Artful and Zesty using Docker image build using Dockerfiles.
- ### Others
  - Fixed Bugs
  - Fixed Typos and spell errors
  - Fixed a bug where exiting script via pressing escape would cause message to be printed twice
  - Improved exit status handling

## _v2.0_

- Complete rewrite from scratch
- Improvements in logging and console output
- Reduced verbosity in terminal output
- Flexible with packages and deb files
- Reduced complex dependencies
- Easy to configure
- Add Simulate install option for installing deb files and apps. Easier to test scripts now .

## _v1.0_

- Initial upload.