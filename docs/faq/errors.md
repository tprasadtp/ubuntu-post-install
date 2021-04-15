# Errors

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

Well, thats pretty much self explanatory! Please use supported release of Ubuntu/Mint/Debian.

!!! warning
    Ubuntu ESM versions are considered as EOL


## Something not mentioned above

!!! question "Report"
    Well, that shouldn't have happened. Please open an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).

!!! tip
    In extremely rare cases where your script exited while installing a package, which has unmet dependencies, you might see broken packages error. In that case, run `sudo apt-get install -f` to fix the broken packages and run the script again.

![GitHub issues](https://img.shields.io/github/issues/tprasadtp/ubuntu-post-install.svg)
