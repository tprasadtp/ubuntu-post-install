# Debugging the script

You can chose from multiple debug modes. by setting DEBUG variable to one of the following

- `DEBUG=1` Print debug messages
- `DEBUG=internal` display some internal debug messages
- `DEBUG=trace` Print debug, internal and also apt logs.
This can generate a lot of output.

## Local testing

You can use `./tests/test-distro.sh` to test the scripts locally. It uses docker to build and test the script in simulate mode inside
containers. This script requires two arguments __distro name__ and __release name__. They are used as parameters to build the Docker image from dockerfile in `dockerfiles/tests`.eg.to test the script on Ubuntu 18.04 bionic, run it as
`./tests/test-distro.sh ubuntu bionic`. It will fetch and build the docker image and run the script in simulate mode using the config files at `https://{branch-name}--ubuntu-post-install.netlify.net/config/default.yml`

Alternatively you can build the docker image yourself.

```console
$ export distro="ubuntu"
$ export release="bionic"
$ docker build -t ae:"${distro}-${release}" \
    --build-arg DISTRO="${distro}" \
    --build-arg CODE_NAME="${release}"  \
    ./dockerfiles/tests
$ docker run -it -v $(pwd)/after-effects:/shared/after-effects:ro \
    -v $(pwd)/config/:/shared/config:ro \
    ae:ubuntu-bionic
root@a9f6bf377494:/shared# DEBUG=1 ./after-effects -c config/default.yml -s -H
[    Checking   ] Permissions...
[     DEBUG     ] Initialize logging
[    Success    ] OK! running as root.
[     DEBUG     ] Architecture is 64 bit.
[     Info      ] Using custom config file
[   Simulating  ] is set to true
[     Info      ] YAML config will not be displayed.
[     Info      ] Checking dependencies...
[    Notice     ] Following details are recognized by the Script.
[     Info      ] Hostname: a9f6bf377494
[     Info      ] UUID for Run: a8ce9e69-b967-4a59-841f-e317f0d18d25
[     Info      ] Distro: ubuntu
.......
```

!!! tip
    This assumes that you can run docker without using sudo. Add yourself yo docker group or refer to docker documentation
    for more info.

## Documentation

Docs are built using mkdocs. If you spot a mistake or a typo, you can submit a Pull request to fix it.
You can test the docs locally with provided docker-compose file.

```console
docker-compose build
docker-compose up
```

and navigate to localhost:8000 to view the documentation.
