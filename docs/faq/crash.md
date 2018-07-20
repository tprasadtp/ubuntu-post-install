# Script throws a bunch of errors or got struck or hangs

!!! question "Report"
    Well, that shouldn't have happened. Please consider opening an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).

## How to recover

- If you know where it was stuck/errored, just re-run the task(s) which were not completed. If you don't know, go and check log file. Each task is labeled and is clearly logged before starting and after completing. Just run the tasks which did not complete. You don't have to re-download the packages you have already downloaded, because they are already cached by apt-get.
- Remember, some operations of the script can be very lengthy and can involve lots of downloads (If you used default list files, expect up to 2 GB of traffic). So, it might appear that script is stuck because cursor stops blinking. However it is not the case. If you are unsure please check the logs.

!!! tip
    In rare cases where your Script exited while installing a DEB file, which has unmet dependencies, you might see broken packages error. In that case, run `sudo apt-get install -f` to fix the broken packages and run the script again. If you see any errors or script hangs/errors please do not hesitate to open an issue on [Github](https://github.com/tprasadtp/ubuntu-post-install/issues/new).
