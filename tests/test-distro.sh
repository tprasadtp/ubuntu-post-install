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
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

  if [[ $release == "host" ]]; then
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "Testing On HOST"
    echo "Testing with YAML"
    sudo ./after-effects \
      --yes \
      --autopilot \
      --simulate \
      --config-file config/"${config_yml}"
    exit_code="$?"
    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi

    echo "Testing with Lists"
    if [[ $TRAVIS_ARCH == "arm64" ]]; then
        echo "Not testing list in ARM64"
    else
      sudo ./after-effects --yes --autopilot --lists -d --simulate
      exit_code="$?"
      echo "Exit code for LIST is $exit_code"
      if [[ $exit_code -ne 0 ]]; then
        exit "$exit_code"
      fi
    fi

  else
    echo "Building $distro:$release Docker Image"
    docker build -t ae:"${distro}-${release}" \
      --build-arg DISTRO="${distro}" \
      --build-arg CODE_NAME="${release}"  \
      ./dockerfiles/tests
    echo "Running in ${TEST_ENV:-LOCAL}"
    echo "Testing with YAML"
    if [[ ${enable_fix} == "true" ]]; then
      docker run -i --rm -e TRAVIS \
      -e CI \
      -e DEBUG \
      --hostname="${TEST_ENV}" \
      -v "$(pwd)":/shared \
      ae:"${distro}-${release}" \
      ./after-effects \
      --fix \
      --simulate \
      --autopilot \
      --config-file config/"${config_yml}"
      exit_code="$?"
    else
      docker run -i --rm -e TRAVIS \
      -e CI \
      -e DEBUG \
      --hostname="${TEST_ENV}" \
      -v "$(pwd)":/shared \
      ae:"${distro}-${release}" \
      ./after-effects \
      --simulate \
      --autopilot \
      --config-file config/"${config_yml}"
      exit_code="$?"
    fi

    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi
    echo "Testing With Lists"
    if [[ ${enable_fix} == "true" ]]; then
      docker run -i --rm -e TRAVIS \
        -e CI \
        -e DEBUG \
        --hostname="${TEST_ENV}" \
        -v "$(pwd)":/shared \
        ae:"${distro}-${release}" \
        ./after-effects -d \
        --lists \
        --fix \
        --simulate \
        --autopilot

        exit_code="$?"
    else
      docker run -i --rm -e TRAVIS \
        -e CI \
        -e DEBUG \
        --hostname="${TEST_ENV}" \
        -v "$(pwd)":/shared \
        ae:"${distro}-${release}" \
        ./after-effects -d \
        --lists \
        --simulate \
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
