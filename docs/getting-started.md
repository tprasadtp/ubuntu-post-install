# How to use?

## Install Ubuntu
Install (if you haven't already) your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use preseed.cfg file)

## Step 1: Get the script

#### Without Git

Run this in Terminal

```sh
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash
```

Or if you want to use remote configuration & not download or use .list files

```sh
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash -s -- -r
```

#### With Git

If you already have git on your system already you can use,

```bash
git clone --depth 1 https://github.com/tprasadtp/ubuntu-post-install.git && cd ubuntu-post-install
```

## Step 2: Update the lists or config.yml to suit your needs (Optional)

Update the list or config files to suit your needs. Change PPAs, add or delete packages to list, tweak variables etc.
Please see [Configuration](https://ae.prasadt.com/config/#package-lists) & [Tasks](https://ae.prasadt.com/tasks/#what-can-it-do) for more details.

## Step 3: Run it

Run the script as **root**. You will get an error if you do not run the script as root.

!!! tip
    Before you run the script, make sure that its executable.

```sh
sudo ./after-effects -Y -C <your config.yml>
```

To use lists
```sh
sudo ./after-effects -L
```

???+ warning "Note for using this script inside docker containers"
    - If you are running this in a docker container, you probably are root.
    - Its possible that you might be missing `sudo` package. So In that case just run it as `./after-effects`. Be warned! You probably are missing several dependencies of the script!

## Step 4: Rejoice
