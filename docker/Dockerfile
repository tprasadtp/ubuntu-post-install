#syntax=docker/dockerfile:1.2

ARG DISTRO
ARG RELEASE

FROM ${DISTRO}:${RELEASE}

RUN rm -f /etc/apt/apt.conf.d/docker-clean

# Install essentials
WORKDIR /shared

# hadolint ignore=DL3008,DL3009
RUN --mount=type=tmpfs,target=/var/lib/apt \
    --mount=type=cache,sharing=private,target=/var/cache/apt \
    apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends \
        wget \
        whiptail \
        iputils-ping \
        procps \
        apt-transport-https \
        ca-certificates \
        curl \
        apt-utils \
        gnupg2 \
        software-properties-common
