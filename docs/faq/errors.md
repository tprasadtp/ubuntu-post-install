# Errors

## What if I get an error saying Unknown Distribution/Release?

That usually means you are running a Distribution which is not supported or too old or a derivative which is not recognized by the script. However it also might be possible that `lsb-release` package is missing from your system. Since the script depends on it for determining what is the code-name of the release it will fail.
You might see ans error like this,

```console
./after-effects: line 41: lsb_release: command not found
./after-effects: line 42: lsb_release: command not found
./after-effects: line 43: lsb_release: command not found
./after-effects: line 44: lsb_release: command not found
[    Notice     ] Following details were recognized by the Script.
[     Info      ] Distro:
[     Info      ] Version:
[     Info      ] Code Name:
[     Info      ] Architecture: amd64
[     Info      ] Path for sources.list.d: /etc/apt/sources.list.d
[    WARNING    ] Will automatically assume yes for all the options available in the script!
[   Simulating  ] is set to true
[  Derivatives  ] Checking for Ubuntu based Distributions
[     Error!    ] Unknown Distribution/Release.
[    Notice     ] This Script is not designed to run on this () distro/release.
```

- It means that you do not have _lsb-release_ package installed. It happens usually on docker containers. See [What are its dependencies? What do I need on my system to run this?](#what-are-its-dependencies-what-do-i-need-on-my-system-to-run-this)
- Install `lsb-release` package using `apt-get -y install lsb-release`
- In the case above you are probably missing other dependencies as well. It might be a good idea to install those dependencies first.

## What if I get an error saying this release of Ubuntu is no longer supported?

```console
[      EOL      ] This release of Ubuntu is no longer supported.
[    Notice     ] zesty reached EOL on January 13th, 2018.
[    Notice     ] Please use a supported version of Ubuntu.
[     Info      ] Please visit the link below for information on how to upgrade.
```

## SSL Errors

```console
[     Error!    ] Something went wrong while retrieving /tmp/api-version.yml.
[     Error!    ] Error Getting file.
```
Try running `wget https://ae.prasadt.com/api/version.yml`. If you see SSL errors, that means that your CA bundle is out of date.
This project uses Amazon Root CA & LetsEncrypt for SSL, make sure that your System trusts these.
