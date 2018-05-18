# Base docker image
FROM ubuntu:xenial
LABEL maintainer "Prasad Tengse <code@prasadt.com>"
ENV DEBIAN_FRONTEND noninteractive
# Install essentials
WORKDIR /shared
RUN dpkg --add-architecture i386
RUN apt-get update > /dev/null
RUN apt-get install -y wget \
lsb-release \
whiptail \
iputils-ping \
apt-transport-https \
ca-certificates curl \
ppa-purge > /dev/null
