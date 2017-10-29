# Base docker image
FROM ubuntu:artful
LABEL maintainer "Prasad Tengse <https://github.com/tprasadtp/minchu>"
ENV DEBIAN_FRONTEND noninteractive
# Install essentials
RUN apt-get update > /dev/null
RUN apt-get install -y wget \
lsb-release \
whiptail \
iputils-ping \
apt-transport-https \
ca-certificates curl \
ppa-purge > /dev/null
