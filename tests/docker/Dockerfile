#syntax=docker/dockerfile:1.2

ARG DISTRO
ARG RELEASE

FROM ${DISTRO}:${RELEASE}
LABEL maintainer "Prasad Tengse <tprasadtp@users.noreply.github.com>"

# Install essentials
WORKDIR /shared

RUN rm -f /etc/apt/apt.conf.d/docker-clean \
    && echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/buildkit-cache

# hadolint ignore=DL3008,DL3009
RUN --mount=type=tmpfs,target=/downloads/ \
    --mount=type=tmpfs,target=/var/lib/apt \
    --mount=type=cache,sharing=private,target=/var/cache/apt \
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends \
        wget \
        whiptail \
        iputils-ping \
        procps \
        ca-certificates \
        apt-transport-https \
        ca-certificates \
        curl \
        apt-utils \
        gnupg2 \
        software-properties-common
