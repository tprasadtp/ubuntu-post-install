#!/usr/bin/env bash

# This is a bash utility to test the script in docker container
# Version:1.0
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu

set -o pipefail
branch=master
if [[ -v $TRAVIS_BRANCH ]]; then
  branch="$TRAVIS_BRANCH"
fi
function main()
{
  dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
  #shellcheck disable=SC2116
  dir=$(echo "${dir/tests/}")
  log_file="$dir"/after-effects-logs/after-effects.log
  # set eo on script.
  sed -i 's/set -o pipefail/set -eo pipefail/g' "$dir"/after-effects
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "Building Jessie Docker Image"
  docker build -t  debian:ae-jessie ./dockerfiles/jessie
  echo "Adding Xenial and above list to app-list.list"
  echo "./data/xenial-above.list" >> ./data/app-list.list
  echo "Adding External Repos"
  echo "./data/extern-repo.list" >> ./data/app-list.list
  echo "Running in Docker Jessie"

  docker run -it -e TRAVIS="$TRAVIS" \
  --hostname=Docker-Jessie \
  -v "$(pwd)":/shared \
  ubuntu:ae-jessie \
  ./after-effects --fix --simulate --yes --enable-pre --enable-post --api-endpoint https://"${TRAVIS_BRANCH}"--ubuntu-post-install.netlify.com/api

  exit_code_from_container="$?"
  echo "Exit code from docker run is: $exit_code_from_container"
  echo "Print Logs is set to: $PRINT_LOGS"
  if [ "$PRINT_LOGS" == "true" ] || [[ "$exit_code_from_container" -gt 0 ]]; then
    echo " "
    echo " "
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    cat "$log_file"
  fi

  return "$exit_code_from_container"
}

main "$@"