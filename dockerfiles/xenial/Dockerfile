# Base docker image
FROM ubuntu:xenial
LABEL maintainer "Prasad Tengse <code@prasadt.com>"
ENV DEBIAN_FRONTEND noninteractive
# Install essentials
WORKDIR /shared
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      wget \
      lsb-release \
      whiptail \
      iputils-ping \
      procps
