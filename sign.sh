#!/usr/bin/env bash

# This is a bash script to Generate checksums
# And sign them
# Version:1.0
# Author: Prasad Tengse
# Licence: MIT
# Requirements - Bash v4
set -eo pipefail
readonly SCRIPT=$(basename "$0")
readonly DIR="$(pwd)"
readonly AE_SCRIPT="${DIR}/after-effects"


function display_usage()
{
#Prints out help menu
cat <<EOF
Bash script to gpg sign

Usage: ${YELLOW}${SCRIPT}   [options]${NC}
[-s --sign]            [GPG sign script file]
[-h --help]            [Display this help message]

EOF
}


function print_info()
{
  printf "[  INFO   ] %s\n" "$@"
}


function print_success() {
  tput setaf 10
  printf "[ SUCCESS ] %s\n" "$@"
  tput sgr 0
}


function print_warning()
{
  tput setaf 3
  printf "[  WARN   ] %s\n" "$@"
  tput sgr 0
}


function print_error()
{
  tput setaf 1
  printf "[  ERROR  ] %s\n" "$@"
  tput sgr 0
}


function sign_file()
{
  if [[ -f $AE_SCRIPT ]]; then
    print_info "Signing $AE_SCRIPT"

    if gpg --armor --detach-sign \
      --output "${AE_SCRIPT}.asc" \
      --yes --no-tty \
      "${AE_SCRIPT}"; then
      print_success "Signed $AE_SCRIPT"
    else
      print_error "Failed to sign $AE_SCRIPT"
      exit 2
    fi
  else
    print_error "script not found!"
    exit 2
  fi
}

function main()
{
  # No args just run the setup function
  if [[ $# -eq 0 ]]; then
    print_error "No Action specified!"
    display_usage;
    exit 1
  fi

  while [[ ${1} != "" ]]; do
    case ${1} in
      -h | --help )           display_usage;exit 0;;
      -s | --sign)            bool_sign="true";;
      * )                    echo -e "\e[91mInvalid argument(s). See usage below. \e[39m";display_usage;;
    esac
    shift
  done

  # Actions

  if [[ $bool_sign == "true" ]]; then
    sign_file
  fi

}

main "$@"
