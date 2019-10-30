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
    exit 1
  fi

  if [[ $# -eq 4 ]]; then
    enable_fix="$4"
  else
    enable_fix="false"
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

  if [[ $release == "xenial-host" ]]; then
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "Testing On HOST"
    echo "Testing with YAML"
    sudo ./after-effects --yes --autopilot --simulate --remote-yaml https://"${branch}"--ubuntu-post-install.netlify.com/config/default.yml --name xenial-host
    exit_code="$?"
    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      return "$exit_code"
    fi

    echo "Testing with Lists"
    sudo ./after-effects --yes --autopilot --lists -d --simulate --name xenial-host
    exit_code="$?"
    echo "Exit code for LIST is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      return "$exit_code"
    fi

  else
    echo "Building $distro:$release Docker Image"
    docker build -t ae:"${distro}-${release}" ./dockerfiles/"${release}"
    echo "Running in ${TEST_ENV}"
    echo "Testing with YAML"
    if [[ ${enable_fix} == "true" ]]; then
      docker run -it -e TRAVIS="$TRAVIS" \
      -e DEBUG="${DEBUG}" \
      --hostname="${TEST_ENV}" \
      -v "$(pwd)":/shared \
      ae:"${distro}-${release}" \
      ./after-effects \
      --fix \
      --simulate \
      --yes \
      --autopilot \
      --remote-yaml https://"${branch}"--ubuntu-post-install.netlify.com/config/"${config_yml}"
      exit_code="$?"
    else
      docker run -it -e TRAVIS="$TRAVIS" \
      -e DEBUG="${DEBUG}" \
      --hostname="${TEST_ENV}" \
      -v "$(pwd)":/shared \
      ae:"${distro}-${release}" \
      ./after-effects \
      --simulate \
      --yes \
      --autopilot \
      --remote-yaml https://"${branch}"--ubuntu-post-install.netlify.com/config/"${config_yml}"
      exit_code="$?"
    fi

    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi
    echo "Testing With Lists"
    if [[ ${enable_fix} == "true" ]]; then
      docker run -it -e TRAVIS="$TRAVIS" \
        --hostname="${TEST_ENV}" \
        -e DEBUG \
        -v "$(pwd)":/shared \
        ae:"${distro}-${release}" \
        ./after-effects -d \
        --lists \
        --fix \
        --simulate \
        --yes \
        --autopilot

        exit_code="$?"
    else
      docker run -it -e TRAVIS="$TRAVIS" \
        --hostname="${TEST_ENV}" \
        -e DEBUG \
        -v "$(pwd)":/shared \
        ae:"${distro}-${release}" \
        ./after-effects -d \
        --lists \
        --simulate \
        --yes \
        --autopilot

      exit_code="$?"
    fi
    echo "Exit code for LIST is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi

  fi
}

main "$@"
