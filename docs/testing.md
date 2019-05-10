# CI and Testing

!!! bug "Test Scripts"
    Test Scripts assume that you are running on Travis. So They might fail if some environment variables are not set. Please see, [Travis environment variables](https://docs.travis-ci.com/user/environment-variables/).

Following Tests are done on Travis-CI.

- `shellcheck` every executable bash script, Test on all supported Ubuntu and Debian distros

!!! info

    - Trusty tests do not install indicator-kdeconnect, peek, openjdk-8-jdk, gnome-todo , gnome-calendar, polari and their PPAs. Please modify your lists accordingly.
    - Build scripts depend on Netlify builds to succeed access latest YAML files. So, if a Netlify build fails, either Travis jobs might fail or might not be tested with latest YAMLs. Currently there is not way to properly and easily communicate with two as Netlify APIs do not provide easy way to access build status per branch or commit.

- Tests on Disco Dingo use base image from `http://cdimage.ubuntu.com/ubuntu-base/daily/`
- Dockerfiles used for building the image are in `/dockerfiles` directory, they use official Ubuntu base images with script dependencies.
- Test scripts are located in `/tests` directory.
- Since its a time consuming process only simulated install is done on CI. Linux mint and Elementary are not tested in containers.
- It is possible that there might be some errors specific to your setup. Please report if so. It is **Strongly** advised to try install apps and deb files in simulate mode first before proceeding with actual installation.

!!! warning
    **Never** set environment variable `CI=true` or `TRAVIS=true`, unless you are running in a CI environment or are sure of its effects.
