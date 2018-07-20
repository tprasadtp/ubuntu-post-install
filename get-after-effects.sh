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
# Requirements - Bash v4.4 and above
#              - Ubuntu 14.04/16.04/17.04/17.10 or Elementary Freya/Loki/Juno or Mint 17.X or 18.X
#              - Support for Ubuntu 18.04 Bionic is Experimental. Since it is still under development
#              - it is advised not to use it as daily driver and should be considered buggy.
#              - whiptail, lsb-release, wget

#
set -o pipefail
readonly SCRIPT=$(basename "$0")
readonly dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
#colors for display
#readonly BLUE=$(tput setaf 6)
readonly YELLOW=$(tput setaf 3)
readonly NC=$(tput sgr 0)
ignore_git_folder="false"
GET_BASE_URL="https://raw.githubusercontent.com/tprasadtp/ubuntu-post-install/master"
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
     exit -1;
   fi
  done
}

function get-after-effects()
{
  # Function to get after-effects main module
  if [ -d .git ] && [ "$ignore_git_folder" != "true" ]; then
    printf "This directory seems to be a git repository. Please use git pull or git fetch to update the script.\n"
    printf "If its not, please delete the .git folder and try again.\n"
    exit 1;
  fi
  rm -f after-effects ./after-effects.* get.mlist .data/*.list ./get.mlist.* ./README.md ./README.md.* ./data/*.list ./data/*.list.*

  echo "Getting: after-effects"
  wget -q "${GET_BASE_URL}"/after-effects -O after-effects
  wget -q "${GET_BASE_URL}"/after-effects.asc -O after-effects.asc
  wget -q "${GET_BASE_URL}"/data/get.mlist -O get.mlist
  printf "${YELLOW}Changing file permissions...${NC}\n"
  chmod +x ./after-effects
  while IFS= read -r line; do
    echo "Getting: $line"
    wget -NNv -q -P ./data/ "${GET_LIST_BASE_URL}/data/${line}"
  done <get.mlist
  wget -q -P  "${GET_BASE_URL}"/api/version.yml -O version.yml
  wget -q -P  "${GET_BASE_URL}"/api/config.yml -O config.yml
  wget -q "${GET_BASE_URL}"/after-effects.asc
  printf "${YELLOW}Please Run the script after-effects as root\n"
  printf "${YELLOW}sudo ./after-effects\n"
  printf "${YELLOW}For documentation visit: https://ae.prasadt.com${NC}\n"
}


function main()
{
  check_dependencies
  get-after-effects
}

main "$@"
