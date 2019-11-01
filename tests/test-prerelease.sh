#!/usr/bin/env bash

# This is a bash utility to test the script in docker container
# Version:1.0
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -o pipefail
export PRE_REL_CODENAME="${1}"
branch=master
case "${TRAVIS_EVENT_TYPE}" in
  pull_request )           branch="deploy-preview-${TRAVIS_PULL_REQUEST}";;
  push | cron | api )      branch="${TRAVIS_BRANCH}";;
  * )                      branch="$(git rev-parse --abbrev-ref HEAD)";;
esac
branch=$(echo $branch | tr -s . - | tr -s / -)
function main()
{
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "Getting $PRE_REL_CODENAME Daily Image"
  wget -nv http://cdimage.ubuntu.com/ubuntu-base/daily/current/$PRE_REL_CODENAME-base-amd64.tar.gz -O ./dockerfiles/pre-release/pre-release-base-amd64.tar.gz
  ls -a
  echo "Building $PRE_REL_CODENAME Docker Image"
  docker build -t ubuntu:ae-pre-release ./dockerfiles/pre-release
  echo "Codename : $PRE_REL_CODENAME"

  docker run -it -e TRAVIS="$TRAVIS" \
      -e DEBUG="${DEBUG}" \
      --hostname=Ubuntu-Pre-Release \
      -v "$(pwd)":/shared \
  ubuntu:ae-pre-release \
  ./after-effects --simulate --autopilot --pre-release --remote-yaml https://"${branch}"--ubuntu-post-install.netlify.com/config/pre-release.yml

  exit_code_from_container="$?"
  echo "Exit code from docker run is: $exit_code_from_container"
  exit "$exit_code_from_container"

}

main "$@"
