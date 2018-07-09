#!/usr/bin/env bash

# This is a bash utility to test the script in docker container
# Version:1.0
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -o pipefail
export PRE_REL_CODENAME="cosmic"
branch=master
if [ "$TRAVIS_EVENT_TYPE" == "pull_request" ];then
  branch="$TRAVIS_PULL_REQUEST_BRANCH"
elif [ "$TRAVIS_EVENT_TYPE" == "push" ]; then
  branch="$TRAVIS_BRANCH"
elif [ "$TRAVIS_EVENT_TYPE" == "cron" ] || [ "$TRAVIS_EVENT_TYPE" == "api" ] ; then
  branch="$TRAVIS_BRANCH"
fi

function main()
{
  dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
  #shellcheck disable=SC2116
  dir=$(echo "${dir/tests/}")
  log_file="$dir"/logs/after-effects.log
  # set eo on script.
  sed -i 's/set -o pipefail/set -eo pipefail/g' "$dir"/after-effects
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "Getting $PRE_REL_CODENAME Daily Image"
  wget -nv http://cdimage.ubuntu.com/ubuntu-base/daily/current/$PRE_REL_CODENAME-base-amd64.tar.gz -O ./dockerfiles/pre-release/pre-release-base-amd64.tar.gz
  ls -a
  echo "Building $PRE_REL_CODENAME Docker Image"
  docker build -t ubuntu:ae-pre-release ./dockerfiles/pre-release
  echo "Codename : $PRE_REL_CODENAME"

  docker run -it -e TRAVIS="$TRAVIS" \
  --hostname=Docker-Pre-Release \
  -v "$(pwd)":/shared \
  ubuntu:ae-pre-release \
  ./after-effects --simulate -Y --yes --pre-release --api-endpoint https://"${branch}"--ubuntu-post-install.netlify.com/api

  exit_code_from_container="$?"
  echo "Exit code from docker run is: $exit_code_from_container"
  echo "Print Logs is set to: $PRINT_LOGS"
  echo "Print Pre Release Logs is set to: $PRINT_PRE_RELEASE_LOGS"
  if [ "$PRINT_LOGS" == "true" ] || [ "$PRINT_PRE_RELEASE_LOGS" == "true" ]; then
    echo " "
    echo " "
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    cat "$log_file"
  fi

  return "$exit_code_from_container"

}

main "$@"
