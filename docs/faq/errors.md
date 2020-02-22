# Errors

## GCSFUSE on 18.10+

Google 's GCSFuse is not yet available for cosmic/disco. Please see this
[Github issue](https://github.com/GoogleCloudPlatform/gcsfuse/issues/319) for a fix.

## What if I get an error saying Unknown Distribution/Release?

That usually means you are running a Distribution which is not supported or too old or a derivative which is not recognized by the script.

## What if I get an error saying this release of Ubuntu is no longer supported?

<pre>[  Derivatives  ] Checking...
<font color="#F92672">[      EOL      ] This version of Ubuntu is no longer supported. </font>
<font color="#F92672">[      EOL      ] Ubuntu 19.04 reached EOL on January 23rd, 2020.</font>
_______________________________________________________
Exit code is 12
</pre>

You are using a version of Ubuntu/Debian which is EOL. Please update to supported version of Ubuntu/Debian.
> Ubuntu ESM versions are considered as EOL, because it is marginal case.

## SSL Errors

```console
[     Error!    ] Something went wrong while retrieving /tmp/api-version.yml.
[     Error!    ] Error Getting file.
```

Try running `wget https://ae.prasadt.com/api/version.yml`. If you see SSL errors, that means that your CA bundle is out of date.
This project uses Amazon Root CA & LetsEncrypt for SSL, make sure that your system trusts these.

## Script throws a bunch of errors or got struck or hangs

!!! question "Report"
    Well, that shouldn't have happened. Please consider opening an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).

### How to recover

- If you know where it was stuck/errors, just re-run the task(s) which were not completed. If you don't know, go and check log file. Each task is labeled and is clearly logged before starting and after completing. Just run the tasks which did not complete. You don't have to re-download the packages you have already downloaded, because they are already cached by apt-get.
- Remember, some operations of the script can be very lengthy and can involve lots of downloads (If you used default list files, expect up to 2 GB of traffic). So, it might appear that script is stuck because cursor stops blinking. However it is not the case. If you are unsure please check the logs.
- You can also use debug mode which outputs debug logs and might help in resolving the issue.

!!! tip
    In rare cases where your script exited while installing a DEB file, which has unmet dependencies, you might see broken packages error. In that case, run `sudo apt-get install -f` to fix the broken packages and run the script again.

## Issues not mentioned above?

If you see any errors or script hangs/errors please do not hesitate to open an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).

![GitHub issues](https://img.shields.io/github/issues/tprasadtp/ubuntu-post-install.svg)
