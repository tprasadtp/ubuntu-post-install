#!/bin/bash
DOCKER_USER="prasad"

if [ $(id -u) -ne 0 ] ; then
    echo 'This script must be run with root privileges' >&2
    exit 1
fi

apt-get update && apt-get upgrade -y

echo "Installing Dependencies"
apt-get install apt-transport-https ca-certificates curl  software-properties-common
echo "Getting GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
echo "Adding Repo"
add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Updating Repo Metadata"
apt-get update
echo "Installing Docker"
apt-get install docker-ce
groupadd docker
usermod -aG docker $DOCKER_USER
