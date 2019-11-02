# Base docker image
ARG DISTRO="ubuntu"
ARG CODE_NAME="bionic"
FROM ${DISTRO}:${CODE_NAME}
LABEL maintainer "Prasad Tengse <tprasadtp@users.noreply.github.com>"
ENV DEBIAN_FRONTEND noninteractive
# Install essentials
WORKDIR /shared
RUN dpkg --add-architecture i386
RUN apt-get -qq update \
    && apt-get install -qq -y --no-install-recommends \
      wget \
      lsb-release \
      whiptail \
      iputils-ping \
      procps \
      ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
