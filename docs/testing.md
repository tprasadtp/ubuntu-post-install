# CI and Testing

!!! bug "Test Scripts"
    Test Scripts assume that you are running on Travis. So They might fail if some environment variables are not set. Please see, [Travis environment variables](https://docs.travis-ci.com/user/environment-variables/).

Following Tests are done on Travis-CI.

- `shellcheck` every executable bash script, Test on all supported Ubuntu and Debian distros
- Test scripts on all supported Ubuntu and Debian releases.

!!! info

    - Test on arm only use YAML config not lists

- Additionally script is also tested on ARM64 on bionic
- Dockerfiles used for building the image are in `/dockerfiles` directory, they use official Ubuntu base images with script dependencies.
- Test scripts are located in `/tests` directory.
- Since its a time consuming process only simulated install is done on CI. Linux mint and Elementary are not tested in containers.
- It is possible that there might be some errors specific to your setup. Please report if so. It is **Strongly** advised to try  simulate mode first before proceeding with actual installation.

!!! warning
    **Never** set environment variable `CI=true` or `TRAVIS=true`, unless you are running in a CI environment or are sure of its effects.
