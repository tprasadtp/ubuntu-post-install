# Base docker image
FROM ubuntu:zesty
LABEL maintainer "Prasad Tengse <https://github.com/tprasadtp/minchu>"
ENV DEBIAN_FRONTEND noninteractive
# Install essentials
RUN dpkg --add-architecture i386
RUN apt-get update > /dev/null
RUN apt-get install -y wget \
lsb-release \
whiptail \
iputils-ping \
apt-transport-https \
ca-certificates curl \
ppa-purge > /dev/null
