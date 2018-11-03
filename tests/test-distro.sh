#!/usr/bin/env bash

# This is a bash utility to test the script in docker container
# Version:1.0
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu

set -o pipefail

function main()
{
  if [[ $# -lt 2 ]]; then
    echo "You need to specify distro name & release name"
    exit -1
  fi
  distro="$1"
  release="$2"

  # Use Default config YML if not specified
  if [[ $3 == "" ]] || [[ $3 == " " ]]; then
    config_yml="default.yml"
  else
    config_yml="$3"
  fi

  # Brach name based on Event Types. (cope with Netlify branch URLs hosting config file)
  case "${TRAVIS_EVENT_TYPE}" in
    pull_request )           branch="deploy-preview-${TRAVIS_PULL_REQUEST}";;
    push | cron | api )      branch="${TRAVIS_BRANCH}";;
    * )                      branch="$(git rev-parse --abbrev-ref HEAD)";;
  esac

  branch=$(echo $branch | tr -s . - | tr -s / -)
  sed -i 's/set -o pipefail/set -eo pipefail/g' ./after-effects
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  if [[ $release == trusty ]]; then
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "Testing On HOST"
    echo "Testing with YAML"
    sudo ./after-effects --yes --yaml --simulate --remote-yaml https://"${branch}"--ubuntu-post-install.netlify.com/config/default.yml --name trusty
    exit_code="$?"
    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      return "$exit_code"
    fi

    echo "Testing with Lists"
    sudo ./after-effects --yes --lists -d --simulate --name trusty
    exit_code="$?"
    echo "Exit code for LIST is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      return "$exit_code"
    fi

  else
    echo "Building $distro:$release Docker Image"
    docker build -t "${distro}:${release}" ./dockerfiles/"${release}"
    echo "Running in ${TEST_ENV}"
    echo "Testing with YAML"
    docker run -it -e TRAVIS="$TRAVIS" \
    --hostname="${TEST_ENV}" \
    -v "$(pwd)":/shared \
    "${distro}:${release}" \
    ./after-effects \
     --yaml \
     --fix \
     --simulate \
     --yes \
    --remote-yaml https://"${branch}"--ubuntu-post-install.netlify.com/config/"${config_yml}"
    exit_code="$?"
    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      return "$exit_code"
    fi
    echo "Testing With Lists"
    docker run -it -e TRAVIS="$TRAVIS" \
      --hostname="${TEST_ENV}" \
      -v "$(pwd)":/shared \
      "${distro}:${release}" \
      ./after-effects -d \
      --lists \
      --fix \
      --simulate \
      --yes

      exit_code="$?"
      echo "Exit code for LIST is $exit_code"
      if [[ $exit_code -ne 0 ]]; then
        return "$exit_code"
      fi

  fi
}

main "$@"
