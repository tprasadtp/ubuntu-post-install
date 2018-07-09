# Others

### Support for Fedora/ Scientific Linux / Open SUSE / Debian / <put your favorite distro>

Its in the pipeline, but I cannot guarantee anything. Since I do not use anything other than Open SUSE very often, so it might take a while. But you can modify this script very easily to achieve that. You need to do the following things,

- Replace apt-get with their equivalents (dnf or zypper or yum etc)
- Replace/Modify package names
- Change add-repositories function to point to .repo files
- Debian users might be able to use this script, but PPA function cannot be used.


## To-Do

- [ ] Gsettings and dotfiles
- [ ] Option to upload log file to pastebin
- [ ] Send a notification (Slack? Hipchat? Hangouts Chat?) after tasks are complete. Helpful if you are using ssh.
