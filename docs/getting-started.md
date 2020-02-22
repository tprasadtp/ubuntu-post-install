# How to use?

## Install Ubuntu

Install (if you haven't already) your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use preseed.cfg file

## Step 1: Get the script

```console
 wget -q https://github.com/tprasadtp/ubuntu-post-install/releases/download/latest/after-effects -O after-effects
 ```

## Step 2: Update the config to suit your needs

Update the config files to suit your needs. Change PPAs, add or delete packages to list, tweak variables etc.
Please see [Configuration](https://ae.prasadt.com/config/#package-lists) & [Tasks](https://ae.prasadt.com/tasks/#what-can-it-do) for more details. Some example configs can be found [here](https://github.com/tprasadtp/ubuntu-post-install/tree/master/config).

## Step 3: Run it

Run the script as **root**. You will get an error if you do not run the script as root.

!!! tip
    Before you run the script, make sure that its executable.

```console
  sudo ./after-effects -C <your config.yml>
```
