# Errors

## What if I get an error saying Unknown Distribution/Release?

That usually means you are running a distribution which is not supported, too old or a derivative which is not recognized by the script. Consider opening an issue on GitHub, if it is not the case.

## Configuration Errors

<pre><font color="#FFAFFF">➜ Processing configuration </font>
<font color="#00FFFF">  • Config file            : config/arm.yml </font>
<font color="#00FFFF">  • Parsing config         : config/arm.yml </font>
  • Validating Config Version
<font color="#CC241D">  ✖ Config API version mismatch! </font>
<font color="#CC241D">  ✖ Expected: 3 Got:  </font>
<font color="#CC241D">  ✖ api key MUST be set to 3 </font>
<font color="#CC241D">  ✖ [v3] config.install.debian_packages[] is obsolete, use config.install.debs[] </font>
<font color="#CC241D">  ✖ [v3] config.tasks.repo is obsolete, use config.tasks.add_repo </font>
<font color="#CC241D">✖ Configuration error!, Please fix your configuration and try again! </font></pre>

You are using v2 or older config which is not compatible with newer versions of the script. Update your config to v3 format.

## Something(s) not mentioned above

!!! question "Report"
    Well, that shouldn't have happened. Please open an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).

!!! tip
    In extremely rare cases where your script exited while installing a package, which has unmet dependencies, you might see broken packages error. In that case, run `sudo apt-get install -f` to fix the broken packages and run the script again.

![GitHub issues](https://img.shields.io/github/issues/tprasadtp/ubuntu-post-install.svg)
