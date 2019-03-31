#!/usr/bin/env bash
# shellcheck disable=SC2059
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/ubuntu-post-install

set -o pipefail
readonly SCRIPT=$(basename "$0")
readonly dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
#colors for display
readonly BLUE=$(tput setaf 6)
readonly YELLOW=$(tput setaf 3)
readonly NC=$(tput sgr 0)
ignore_git_folder="false"
GET_BASE_URL="https://ae.prasadt.com/dl"

function check_dependencies()
{
  #Function to check is dependencies are available
  local get_after_effects_dependencies=(wget)
  local dep_res
  printf "${YELLOW}Checking dependencies${NC}\n"
  for dep in "${get_after_effects_dependencies[@]}"; do
   command -v "$dep" > /dev/null
   dep_res=$?
   if [ "$dep_res" -eq 1 ]; then
     printf "${YELLOW}[ ERROR ] $dep is not installed!${NC}\n"
     exit 1;
   fi
  done
}

function get-after-effects()
{
  # Function to get after-effects main module
  if [ -d .git ] && [ "$ignore_git_folder" != "true" ]; then
    printf "This directory seems to be a git repository. Please use git pull or git fetch to update the script.\n"
    printf "If its not, please delete the .git folder and try again. Alternatively you can try running this\nfrom a different directory.\n"
    exit 1;
  fi
  rm -f after-effects ./after-effects.* get.mlist ./get.mlist.* ./README.md ./README.md.* ./data/*.list ./data/*.list.* ./after-effects.asc ./after-effects.asc.*

  echo "Getting: after-effects"
  wget -q "${GET_BASE_URL}/after-effects" -O after-effects
  wget -q "${GET_BASE_URL}/after-effects.asc" -O after-effects.asc
  wget -q "${GET_BASE_URL}/data/get.mlist" -O get.mlist
  printf "${YELLOW}Changing file permissions...${NC}\n"
  chmod +x ./after-effects
  while IFS= read -r line; do
    echo "Getting: $line"
    wget -Nnv -q -P data/ "${GET_BASE_URL}/data/${line}"
  done <get.mlist
  wget -q "${GET_BASE_URL}/config/version.yml" -O version.yml
  wget -q "${GET_BASE_URL}/config/default.yml" -O config.yml
  printf "${YELLOW}Please Run the script after-effects as root\n"
  printf "${BLUE}For documentation visit: https://ae.prasadt.com${NC}\n"
}


function main()
{
  if [ "$#" -gt 1 ]; then
    echo "This script can accept only one argument, --master or -m, which uses master branch instead of stable version."
    exit 1
  fi

  while [ "${1}" != "" ]; do
    case ${1} in
      --master | -m )  GET_BASE_URL="https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master";;
      *)               echo "Invalid argument : ${1} !"; exit 1;;
    esac
    shift
  done

  echo "Base URL is : ${GET_BASE_URL}"

  check_dependencies
  get-after-effects
}

main "$@"
