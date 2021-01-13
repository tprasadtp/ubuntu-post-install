#!/usr/bin/env bash
# Copyright (c) 2021. Prasad Tengse
#

set -o pipefail

# Script Constants
readonly CURDIR="$(cd -P -- "$(dirname -- "")" && pwd -P)"
readonly SCRIPT="$(basename "$0")"

# Handle Use interrupt
# trap ctrl-c and call ctrl_c()
trap ctrl_c_handler INT

function ctrl_c_handler() {
  print_error "User Interrupt! CTRL-C"
  exit 4
}

## BEGIN AUTO-GENERATED CONTENT ##

# Basic colors
readonly YELLOW=$'\e[38;5;221m'
readonly GREEN=$'\e[38;5;42m'
readonly RED=$'\e[38;5;197m'
readonly NC=$'\e[0m'

# Enhanced colors

readonly PINK=$'\e[38;5;212m'
readonly BLUE=$'\e[38;5;159m'
readonly ORANGE=$'\e[38;5;208m'
readonly TEAL=$'\e[38;5;192m'
readonly VIOLET=$'\e[38;5;219m'
readonly GRAY=$'\e[38;5;246m'
readonly DARK_GRAY=$'\e[38;5;242m'

# Script Defaults
LOG_LVL=0

# Default Log Handlers

function log_info()
{
  printf "• %s \n" "$@"
}

function log_success()
{
  printf "%s• %s %s\n" "${GREEN}" "$@" "${NC}"
}

function log_warning()
{
  printf "%s• %s %s\n" "${YELLOW}" "$@" "${NC}"
}

function log_error()
{
   printf "%s• %s %s\n" "${RED}" "$@" "${NC}"
}

function log_debug()
{
  if [[ $LOG_LVL -gt 0  ]]; then
    printf "%s• %s %s\n" "${GRAY}" "$@" "${NC}"
  fi
}

function log_notice()
{
  printf "%s• %s %s\n" "${TEAL}" "$@" "${NC}"
}

function log_step_notice()
{
  printf "%s  • %s %s\n" "${TEAL}" "$@" "${NC}"
}

function log_step_error()
{
  printf "%s  • %s %s\n" "${RED}" "$@" "${NC}"
}

function log_step_success()
{
  printf "%s  • %s %s\n" "${GREEN}" "$@" "${NC}"
}

function log_step_debug()
{
  if [[ $LOG_LVL -gt 0  ]]; then
    printf "%s  • %s %s\n" "${GRAY}" "$@" "${NC}"
  fi
}

function log_step_info()
{
  printf "  • %s\n" "$@"
}

function log_variable()
{
  local var
  var="$1"
  if [[ $LOG_LVL -gt 0  ]]; then
    printf "%s  » %-20s - %-10s %s\n" "${GRAY}" "${var}" "${!var}" "${NC}"
  fi
}
## END AUTO-GENERATED CONTENT ##

function display_usage()
{
#Prints out help menu
cat <<EOF
Bash script to run shellcheck on all executables.

Usage: ${TEAL}${SCRIPT} ${BLUE} [options] ${NC}

----------- Debugging & Help ----------------
${GRAY}
[-v | --verbose]        [Enable verbose loggging]
[-h | --help]           [Display this help message]${NC}
EOF
}



function parse_options()
{
  while [[ ${1} != "" ]]; do
    case ${1} in
      -v | --verbose)         LOG_LVL="1";
                              log_debug "Enabled verbose logging";;
      -h | --help )           display_usage;exit 0;;
      *)                      log_error "Invalid option($*)!";
                              display_usage;
                              exit 1;
                              ;;
    esac
    shift
  done
}


function main()
{
  ERRORS=()

  parse_options "$@"
  log_notice "Running shellcheck on execulables..."

  # find all executables and run `shellcheck`
  for file in $(find . -type f -not -iwholename '*.git*' -executable | sort -u); do
    # ignore , double  quote strings  2086
    log_step_info "$(basename "${file}")"
    shellcheck -e SC2154 -e SC2086 "${file}"
    res="$?"
    if [[ $res -eq 0 ]]; then
      log_step_success "OK"
    else
      ERRORS+=("${file}")
      log_step_error "FAILED"
    fi
  done

  if [ ${#ERRORS[@]} -eq 0 ]; then
    log_notice "Hooray! All files passed shellcheck."
  else
    log_error "${#ERRORS[*]} file(s) failed shellcheck: ${ERRORS[*]}"
    exit 1
  fi
}

main "$@"
