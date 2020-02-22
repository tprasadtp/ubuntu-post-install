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


  distro="$1"
  release="$2"

  # Use Default config YML if not specified
  if [[ $3 == "" ]] || [[ $3 == " " ]]; then
    config_yml="default.yml"
  else
    config_yml="$3"
  fi

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
    sudo ./after-effects --yes --autopilot --lists -d --simulate
    exit_code="$?"
    echo "Exit code for LIST is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi

  else
    echo "Building $distro:$release Docker Image"
    docker build -t ae:"${distro}-${release}" \
      --build-arg DISTRO="${distro}" \
      --build-arg CODE_NAME="${release}"  \
      ./dockerfiles/tests
    echo "Testing with YAML"
    docker run -i --rm -e TRAVIS \
      -e CI \
      -e DEBUG \
      -e GITHUB_ACTIONS \
      --hostname="${distro}-${release}" \
      -v "$(pwd)":/shared \
      ae:"${distro}-${release}" \
      ./after-effects \
      --simulate \
      --fix \
      --autopilot \
      --config-file config/"${config_yml}"
      exit_code="$?"

    echo "Exit code for YAML is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi
    echo "Testing With Lists"
    docker run -i --rm -e TRAVIS \
      -e CI \
      -e DEBUG \
      -e GITHUB_ACTIONS \
      --hostname="${distro}-${release}" \
      -v "$(pwd)":/shared \
      ae:"${distro}-${release}" \
      ./after-effects -d \
      --lists \
      --fix \
      --simulate \
      --autopilot

    exit_code="$?"

    echo "Exit code for LIST is $exit_code"
    if [[ $exit_code -ne 0 ]]; then
      exit "$exit_code"
    fi

  fi
}

main "$@"
