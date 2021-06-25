#!/usr/bin/env bash
# shellcheck disable=SC2059

# Version:0.1
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -e pipefail

# Build Static
echo "Building Docs"
docker run \
  --workdir=/docs \
  -v "$(pwd)":/docs squidfunk/mkdocs-material:7.1.9 \
  build -v -s --config-file /docs/mkdocs.yml
