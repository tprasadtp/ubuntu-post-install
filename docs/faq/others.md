# Others

## Support for Fedora/ Scientific Linux / Open SUSE / RHEL/ CentOS / put your favorite distro

Its in the pipeline, but I cannot guarantee anything. Since I do not use anything other than CentOS very often, so it might take a while. But you can modify this script very easily to achieve that. You need to do the following things,

- Replace apt-get commands with their equivalents (`dnf` or `zypper` or `yum` etc).
- Replace/Modify package names.
- Change add-repositories function to point to .repo files.
- Change `dpkg` to `rpm` equivalents.
- Since v5.0 Debian is supported.

## To-Do

- [ ] Gsettings
- [ ] Send a notification (Slack? Hipchat? Hangouts Chat?) after tasks are complete. Helpful if you are using ssh.

## Additional notes for sigma users

> *Note This applies ONLY if you are using the script from sigma server. This does **NOT APPLY** for any GitHub branches/tags/releases.*

- **DO NOT** use Github version of `get-after-effects.sh` to get the script. Please follow the instructions in SETUP.MD [ Only preset on sigma server]. Several packages & some settings need to be manually configured to point to internal repositories & mirrors. Bootstrap function will automatically setup things for you.
- Currently Github branches do not report stats and `report_stats` is just a placeholder.
- If you are using the script from sigma server, stats are reported by default unless you disable them. UUID is **NOT** random for each run and is based on MAC address of one of your Ethernet devices.(If you have many) & hostname.
- Scripts have same version number and are always in sync with GitHub master branch. You can identify the difference by looking at REL_NAME. Release name has `-sigma` appended to it. To see release number & name use `./after-effects -v`.
