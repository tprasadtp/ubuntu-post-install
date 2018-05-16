# How to use?

## Install Ubuntu
Install (if you haven't already) your choice of Ubuntu/Derivative as you would( If you wish to automate that too, you can use preseed.cfg file)

## Step 1: Get the script

### Without Git

Run this in Terminal

```sh
wget -Nnv https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master/get-after-effects.sh -O - | bash
```

### With Git

If you already have git on your system you can use,

```bash
git clone --depth 1 https://github.com/tprasadtp/ubuntu-post-install.git && cd ubuntu-post-install
```

## Step 2: Update the lists to suit your needs (Optional)

Update the list files to suit your needs. Change PPAs, add or delete packages to list, tweak booleans etc.

## Step 3: Run the script

Run the script as **root**. You will get an error if you do not run the script as root.

```sh
sudo ./after-effects
```

> If you are running this in a docker container, you probably are root and its possible that you might be missing `sudo`. So In that case just run it as `./after-effects`. Be warned! You might be missing several dependecies of the script!!

## Step 4: Contribute!

Contribute tweaks, improvements ideas back upstream.
