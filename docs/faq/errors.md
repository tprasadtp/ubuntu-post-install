# Errors

## GCSFUSE, ROS and Duo Security Repositories

- Note for 18.10+ users: GCSFuse is not available. Please see this [Github issue](https://github.com/GoogleCloudPlatform/gcsfuse/issues/319) for a fix.
- Duo Security for unix is only supported on some LTS releases.
- ROS is only supported on select releases.

## What if I get an error saying Unknown Distribution/Release?

That usually means you are running a Distribution which is not supported, too old or a derivative which is not recognized by the script.
consider opening an issue on GitHub.

## What if I get an error saying this release of Ubuntu is no longer supported?

<pre>[  Derivatives  ] Checking...
<font color="#F92672">[      EOL      ] This version of Ubuntu is no longer supported. </font>
<font color="#F92672">[      EOL      ] Ubuntu 19.04 reached EOL on January 23rd, 2020.</font>
_______________________________________________________
Exit code is 12
</pre>

You are using a version of Ubuntu/Debian which is EOL. Please update to supported version of Ubuntu/Debian.
> Ubuntu ESM versions are considered as EOL

## SSL Errors

```console
[     Error!    ] Something went wrong while retrieving /tmp/api-version.yml.
[     Error!    ] Error Getting file.
```

Try running `wget https://ae.prasadt.com/v2/version`. If you see SSL errors, that means that your CA bundle is out of date.
This project uses Amazon Root CA & LetsEncrypt for SSL, make sure that your system trusts these certificate authorities..

## Something not mentioned above

!!! question "Report"
    Well, that shouldn't have happened. Please open an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).

!!! tip
    In extremely rare cases where your script exited while installing a package, which has unmet dependencies, you might see broken packages error. In that case, run `sudo apt-get install -f` to fix the broken packages and run the script again.

![GitHub issues](https://img.shields.io/github/issues/tprasadtp/ubuntu-post-install.svg)
