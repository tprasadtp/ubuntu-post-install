#!/bin/bash
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


#defining directory
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
#PACKAGES_REQ="$dir/data/PACKAGES_REQ.list"

#DEFINE LOGGING FUNCTIONS
#Define LOG FILE
SCRIPT=Inchara
SCRIPT_LOG=$dir/data/setup_script.log
error_flag=false
insync_abort=false
try_generic_name=false
touch $SCRIPT_LOG

SCRIPTENTRY(){
    DEBUG "Executing Script"
    script_name=`basename "$0"`
    echo "$FUNCNAME: $script_name" >> $SCRIPT_LOG
}

SCRIPTEXIT(){
    DEBUG "Exiting Script"
    script_name=`basename "$0"`
    echo "$FUNCNAME: $script_name" >> $SCRIPT_LOG
}


DEBUG(){
    local msg="$1"
    #local timestamp=$(date)
    echo -e "[$(date)] [DEBUG]\t$msg" >> $SCRIPT_LOG
}

LOG_AND_PRINT(){
  local msg="$1"
  #local timestamp=$(date)
  echo -e "[$(date)] [DEBUG]\t$msg" >> $SCRIPT_LOG
  echo -e "$msg"
}
insync_abort=false

SCRIPTENTRY
DEBUG "Following details were recognised by the Script"
#grabbing os info
OS_DISTRIBUTION=$(lsb_release --id | cut -f2 | tr '[:upper:]' '[:lower:]') || insync_abort=true && try_generic_name=true
VERSION=$(lsb_release --release | cut -f2)
LONG_VERSION=$(lsb_release -d | cut -f2 | cut -d ' ' -f2)
CODE_NAME=$(lsb_release --codename | cut -f2)|| insync_abort=true && try_generic_name=true
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
SOURCES_FILE_DIR=/etc/apt/sources.list.d

#colors for display
COLOR_BLUE=$(tput setaf 6)
RESET_COLOR=$(tput sgr 0)
COLOR_MAGNATA=$(tput setaf 5)

if $insync_abort; then
  DEBUG "INSYNC WONT INSTALL: Either OS Detection or release code name detection failed"
fi

DEBUG OS:$OS_DISTRIBUTION
DEBUG VERSION:$VERSION
DEBUG CODE_NAME:$CODE_NAME
DEBUG ARCHITECHTURE:$ARCH
DEBUG "PATH FOR SOURCE FILES:$SOURCES_FILE_DIR"

#----- Import Functions -----#

. $dir/functions/addppa
. $dir/functions/addrepository
. $dir/functions/all_in_one
. $dir/functions/catalyst
. $dir/functions/checkconnection
. $dir/functions/goodbyemsg
. $dir/functions/install_latex
. $dir/functions/installapps1
. $dir/functions/installdebs
. $dir/functions/looks
. $dir/functions/reset_repo
. $dir/functions/update
. $dir/functions/utils


DEBUG "IMPORTED FILES"
DEB_FILES_LIST="$dir/data/DEB_FILES.list"
IMWHEEL_CFG="$dir/data/imwheel_config_file"
GSETTINGS="$dir/data/gsettings.list"
PPA_LIST="$dir/data/PPA.list"
PPA_LIST_EXTRA="$dir/data/PPA_EXTRA.list"
#----------------------------#

#disable hist chars  so that I can print "!!"" properly
histchars=
printf "\n$(tput setaf 3)Hello! \nI am $SCRIPT! \nI was created by TP to do mundane task of installing a fresh ubuntu install with all you need.\n \n$(tput setaf 6)$SCRIPT running on $(uname -n) as $USER $(tput sgr 0)\n"
LOG_AND_PRINT "\nWARNING! THIS SCRIPT CAN DAMAGE YOUR SYSTEM! ASSUMING THAT YOU ARE USING A FRESH INSTALL,\nTHE SCRIPT COMES WITH NO WARRANTY WHATSOEVER!"
printf "\nIf you choose to use it to save time, sleep on job and get fired, it\'s your responsibility.\nIf you trust it and your girlfriend breaks up with you, not our responsibility.\nIf your kids subsequently fail their homework  because you crashed their computer-not our responsibility.\nIf it wipes all the data in your computer, including the photos of the your dog-not our responsibility.\nIf your computer becomes HAL9000, AIRA, TERMINATOR T-800, TET, VICKY or any of the badass villans-not our responsibitity!
If it causes your laptop to tear a hole in the fabric of space and time and teleport you to Andromeda Galaxy,\nOK!that one is on us.\nAny other feelings, breakups, natural disasters, tsunami, UFO and anything
not listed above-not our responsibility.\nDon\'t use it to show off your skills to your girlfriend/boyfriend\n"
#Inspired by Skymaps EULA :P

# Main loop
function main {
    eval `resize`
    MAIN=$(whiptail \
        --notags \
        --title "$SCRIPT" \
        --menu "\nWhat would you like me to do?" \
        --cancel-button "Quit" \
        $LINES $COLUMNS $(( $LINES - 12 )) \
        update              'Perform system update' \
        all_in_one          'Install all apps and configure, I am in control' \
        install_catalyst    'Install Catalyst(only for 14.04.01 or below)' \
        add_repositories    'Add Common Repositories' \
        add_ppa_modular     'Add PPAs from file' \
        install_apps1       'Install most common tools' \
        install_latex       'Install LateX' \
        install_debs_modular 'Install DEBS not available in Repositories' \
        make_it_look_nice   'Takes care of some themes and gsettings configurations'\
        rest_repo           'Reset Repositories for cleanup or another test run'\
        3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        $MAIN
    else
        quit
    fi
}

# Quit
function quit {
    if (whiptail --title "Quit" --yesno "Are you sure you want quit?" 10 60) then
        echo "Exiting..."
        goodbye_msg
        SCRIPTEXIT
        exit 99
    else
        main
    fi
}

#RUN
test_connection
while :
do
  main
done

#END OF SCRIPT

SCRIPTEXIT
