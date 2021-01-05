#!/usr/bin/env bash

set -eo pipefail
readonly SCRIPT=$(basename "$0")
readonly DIR="$(pwd)"


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
  local SIGNER
  SIGNER="${1}"
  if [[ -f $SIGNER ]]; then
    print_info "Signing $SIGNER"

    if gpg --armor --detach-sign \
      --output "${SIGNER}.asc" \
      --yes --no-tty \
      "${SIGNER}"; then
      print_success "Signed $SIGNER"
    else
      print_error "Failed to sign $SIGNER"
      exit 2
    fi
  else
    print_error "$SIGNER not found!"
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
      * )                     echo -e "\e[91mInvalid argument(s). See usage below. \e[39m";display_usage;;
    esac
    shift
  done

  # Actions

  if [[ $bool_sign == "true" ]]; then
    sign_file "after-effects"
  fi

}

main "$@"
