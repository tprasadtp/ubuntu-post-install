# Base docker image
FROM debian:bullseye
LABEL maintainer "Prasad Tengse <code@prasadt.com>"
ENV DEBIAN_FRONTEND noninteractive
# Install essentials
WORKDIR /shared
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y wget \
  lsb-release \
  whiptail \
  procps \
  gnupg \
  iputils-ping \
  apt-transport-https \
  ca-certificates curl
