# What can it do?

## Add Repositories
This will add the following repositories.

- Insync
- Google-Cloud-SDK
- Google-Cloud GCSFUSE
- Docker-CE (default add repository)
- WineHQ (Latest wine builds)

??? tip "Using `--fix` falg"
    Please note that the above repositories are sometimes not updated for latest Ubuntu release and most certainly will not be available for upcoming release of Ubuntu(Alpha/Beta). It might take some time till the repositories are available for the latest release. Use -f or --fix command line option or --pre-release in case you are using a Development version of ubuntu to revert using latest available version of repositories (usually previous Ubuntu release or in case of Beta/Alpha latest stable release of ubuntu). [For more info see command line options.](/clioptions/#fix-for-latest-ubuntu-releases)

- Google Earth
- Google Chrome
- Spotify
- Visual Studio Code
- Signal Desktop
- Mendeley Desktop (Not added by default)

!!! bug "Prefer local configuration"
    The script uses remote config files (/api/version) to determine whether to add repository or not. It helps in disabling some repositories which are often source of trouble. They always try to reflect default choices of the script. If you wish to disable it or override it, use `--no-stats` option as it will disable remote configuration as well & local variables will determine the outcome.


!!! tip "Your own Remote config"
    You can use your own remote config file. You need following to do so.
    - A Valid configuration file accessible over http/https/ftp without login.
    - You can copy the files in cfg directory of this branch.
    - Host the files on your own server/S3/website & Note the base url for that directory.
    - Use --api-endpoint {protocol}://{BASE_URL} while running the script. (Note that there is no trailing slash)
    - Config files should be accessible over {protocol}://{BASEURL}/version

### Canonical partner repositories

Following repositories are conditional and are determined based on the flags or conditions set.

- Canonical Partner repositories

  Canonical partner repositories are not configured or enabled for derivatives of Ubuntu because thee might be some conflicts.

- WineHQ & Docker-Community-Edition (default is to add repositories)

  WineHQ and Docker-CE have a switch mentioned in beginning of the script and by default are as follows. Change according to your needs. If you re using 16.04 and above leaving this unchanged is the best option.

??? note "Default Variables"
    ```bash
    #============================ Switches/ bools ================================

      # Latest wine builds
      add_winehq_repo=true

      #Docker community edition
      add_docker_repo=true

      #Mendeley Desktop
      add_mendeley_repo=false

      #Spotify
      add_spotify_repo=true

      #InSync
      add_insync_repo=true

      #Google Cloud SDK
      add_googlecloud_repo=true

      #Signal
      add_signal_repo=false

      #Skype
      add_skype_repo=true

      #VS code
      add_vscode_repo=true

      #Google
      add_google_repo=true

      #Kubernetes
      add_kubernetes_repo=false

      # Define Data Directory
      data_dir="data"
    ```

!!! bug "Note on 32 bit Architecture"
    - Please note that Google Chrome doesn't support 32 bit architecture, please use Chromium.
    - Signal and Visual studio code do not support 32 bit architecture either.


## Add personal package archives (PPA)

- PPAs can be added using the configuration file in data directory `./data/ppa.list`
- This file **SHOULD** contain only one ppa entry per line (No comments or anything else anywhere in the file) in the format ppa:<author>/ppa for example `ppa:mozillateam/firefox-next` The file will be read and the PPAs will be added from the list.
- Logs will  show entry in the format `[<date and time>] [  PPA-Logs  ] <log>`

!!! warning
    - PPAs should be checked before they are added to the list. Sometimes PPAs listed in the file may not be available for all releases.
    - Debian does not support PPAs.

## Install apt packages

- Packages can be installed by using configuration lists in the data directory. This works similar to ppa list However its slightly different.
- There is one **master list** or **list of lists** which contains the path to the list files from which the packages are to be installed.
- This master list should contain the path to list files relative to script in following manner, `<dir-relative-to-script>/<list file>`. For example if you have a list file security.list in data directory, then entry should look exactly like `data/security.list`
- packages in the files will not be installed if that file does not appear in the master list.
- It helps keeping things separate for separate machines or needs. Minimal edit is required to switch from one list to another than rewriting the entire list file.
- The Master list is named `app-list.list` and **MUST** only contain the list files one entry per line. **NO** comments or anything else is allowed.
- Individual list files for different needs are to be written in similar way containing name of the package to be installed in one package per line format as before. similar to all the lists there **SHOULD NOT** be any comments or text or empty lines in those list files.
- You can split files according to your needs and write your list of packages to be installed and only include the lists in the master list file which you intend to install.
- It is a good idea to include packages from external repositories in a different list than others because they might fail sometimes.
- Make sure that all the packages in the lists are available for your release. Using `-s` command line option helps. Also check for the logs for any errors or conflicts.

## Install debian package package archives (.deb files)
This will install deb files specified in the list deb-files.list

- Logs will  show entry in the format `[<date and time>] [  PKG  ] <log>` for dpkg actions and
- APT Logs will  show entry in the format `[<date and time>] [  APT  ] <log>` for actions performed by apt commands. (`apt-get install -f` for missing packages)
- **Simulate** option will use `--dry-run` option in dpkg to Simulate DEB installation.
- Configuration file is a `csv` file without headers. first column corresponds to URL ans the seconf field the file name under which the file is saved.
- Each DEB file to be installed should have following entry.
- URL to the deb file which can be accessed using wget  [ tab or space ] Name of the deb file without any spaces or special chars except hyphen.
- For example to install Atom Editor the deb-files.list should look like below.

```csv
https://atom-installer.github.com/v1.21.1/atom-amd64.deb,ATOM-Editor.deb
```

- First part is the URL to the deb file separated by ',' of the file.

!!! note "Note on file names in configuration"
    Please note that deb file will be  saved with the name mentioned in the file. (DEB file is named **exactly** as mentioned in the second field. So if you want them to be named with extension .deb include that in the second field and avoid illegal chars)

## Install python packages (via pip)

This will install system wide python packages using pip. There are two lists. `pip.list` and `pip3.list` for python 2 and python 3 respectively.
Pre-requisite is that python-pip package is pre installed, If not , will be installed anyway.

- The list files follow similar configuration as package list files. One item per line.
- Simulate flag will skip installing packages, unless `TRAVIS=true`.

!!! warning
    Don't mix Python 3 packages with Python 2 packages.

## Purge Unwanted Packages

This will purge Unwanted packages from the system.

- The packages mentioned in the list purge.list will be purged
- The format of the purge.list is similar to that of packages, one packages per line of the file and no comments or anything else.

!!! warning
    It is necessary to pass command line argument `-d` or `--deboalt` to run this task. Otherwise task will be aborted.

## Reset repositories

- This will reset the repositories added by this script, and purge ppas added by this script in the list ppa.list.
- This will **NOT** reset or remove repositories added by the DEB files.
- Simulate option has no effect on this action and ppa-purge **WILL** downgrade packages if necessary.

!!! bug "Scope of this function"
    This will **NOT** remove PPAs or repositories you have added manually or those added while installing DEB files.

## Pre and Post task hooks
Since version 4.0, it is possible to run list of shell-scripts (listed in pre/post-script.list), before any of the tasks like installing or adding repositories begin as well as after all the tasks are completed. Please note that currently no checks are being made if all the tasks completed successfully. The scripts are executed, regardless of the exit status of the tasks.

Invoking scripts requires two flags to be passed.

- `--enable-pre` for pre task scripts
- `--enable-post` for post task scripts.
- Configurations are similar to package lists, one line per script. Please include complete path for the shell-scripts.
- Empty lines are ignored.
- If you wish to run python or other code, please use shell-script as wrapper.

### Honoring simulate flag in hooks
Check for environment variable `AE_SIMULATE`. By default its false and is set to true, if `--simulate or -s` falg is used.

### Honoring `AUTOPILOT` falg in hooks
Check for environment variable `AUTOPILOT`. It is set to true if AUTOPILOT is true. Otherwise its false or not set.


## All In one

This will perform Following actions. (In the following order)

- Update repository metadata
- Upgrade packages
- Add repositories
- Add PPAs in the list file
- Install Apps
- Install DEB files

This option will honor --yes and --simulate options as individual tasks would do.

### AUTOPILOT Mode
AUTOPILOT=true will execute this task.

## Delete logs

A log file is generated containing all the output generated by the apt and other commands and contain generic information and errors .

- This task will delete the log file `after-effects.log`.
- Log file is located in the directory `after-effects-logs` in folder which you ran thin script.
- Sometimes errors might not be written to log file but displayed on screen and vice-versa.
- Please verify that everything went okay before deleting the logs.
