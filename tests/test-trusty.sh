#!/usr/bin/env bash

# This is a bash utility to test the script in docker container
# Version:1.0
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -o pipefail
branch=master
case "${TRAVIS_EVENT_TYPE}" in
  pull_request )           branch="${TRAVIS_PULL_REQUEST_BRANCH}";;
  push | cron | api )      branch="${TRAVIS_BRANCH}";;
  * )                      branch="${TRAVIS_BRANCH}";;
esac
function main()
{
  dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
  #shellcheck disable=SC2116
  dir=$(echo "${dir/tests/}")
  log_file="$dir"/logs/after-effects.log
  # set eo on script.
  sed -i 's/set -o pipefail/set -eo pipefail/g' "$dir"/after-effects
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "Testing On HOST"
  sudo ./after-effects --yes --yaml --simulate --api-endpoint https://"${branch}"--ubuntu-post-install.netlify.com/api --name trusty

  exit_code_from_script="$?"
  echo "Exit code from  run is: $exit_code_from_script"
  echo "Print Logs is set to: $PRINT_LOGS"
  if [ "$PRINT_LOGS" == "true" ] || [[ "$exit_code_from_script" -gt 0 ]]; then
    echo " "
    echo " "
    echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    cat "$log_file"
  fi
  return "$exit_code_from_script"
}

main "$@"
