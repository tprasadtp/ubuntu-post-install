#!/usr/bin/env bash

set -eo pipefail

function download_yq()
{
  # Download YQ
  echo "Downloading 64 bit"
}

function main()
{
  # No args just run the setup function
  if [[ $# -eq 0 ]]; then
    display_usage;
    exit 1
  fi

  while [[ ${1} != "" ]]; do
    case ${1} in
      -h | --help )          display_usage;exit 0;;
      -v | --version)        shift; readonly yq_version="${1}";;
      * )                    echo -e "\e[91mInvalid argument(s). See usage below. \e[39m";display_usage;;
    esac
    shift
  done

  if [[ ! -z yq_version ]]; then
    echo "Error! YQ Version not specified!"
    exit 1
  fi

  download_yq

}

main "$@"
