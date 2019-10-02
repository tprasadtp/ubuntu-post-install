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

function verify_gpg_signature()
{
  # Verifies the file with its detached GPG signature.
  # Assumes that you already have public key in your keyring.
  # Assumes signature file is present at same localtion,
  # with same name but with .sig or .gpg or .asc extension.
  # Lets declare variables
  local checksum_sig_file
  # Checks if file is present
  if [ -f "${AE_SCRIPT}.asc" ]; then
    checksum_sig_file="${AE_SCRIPT}.asc"
  else
    print_error "Error! Signature file not found!"
    exit 1;
  fi

  # Check for signature files
  print_info "Verifying GPG signature of file.."
  print_info "Signature File : ${checksum_sig_file}"
  print_info "Data File      : ${AE_SCRIPT}"
  # Checks for commands
  if command -v gpg > /dev/null; then
    if gpg --verify "${checksum_sig_file}" "${AE_SCRIPT}" 2>/dev/null; then
      print_success "Signature verified"
    else
      print_error "Signature checks failed"
      print_error "Check signature manually via gpg --verify ${AE_SCRIPT}.asc"
      exit 50;
    fi
  elif command -v gpgv > /dev/null; then
    if gpgv --keyring "$HOME/.gnupg/pubring.kbx" "${checksum_sig_file}" "${AE_SCRIPT}"; then
      print_success "Signature verified"
    else
      print_error "Signature checks failed!!"
      print_error "Check signature manually via gpg --verify ${AE_SCRIPT}"
      exit 50;
    fi
  else
    print_error "Cannot perform verification. gpgv or gpg is not installed."
    print_error "This action requires gnugpg/gnupg2 or gpgv package.\n"
    exit 1;
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
      -v | --verify)          bool_verify="true";;
      * )                    echo -e "\e[91mInvalid argument(s). See usage below. \e[39m";display_usage;;
    esac
    shift
  done

  # Actions

  if [[ $bool_sign == "true" ]]; then
    sign_file
  fi

  if [[ $bool_verify == "true" ]]; then
    verify_gpg_signature
  fi

}

main "$@"