#!/usr/bin/env bash

# This is a bash utility to test the script in docker container
# Version:1.0
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu

set -o pipefail

if [[ $# -lt 2 ]]; then
  echo "You need to specify distro name & release name "
fi
distro="$1"
release="$2"
case "${TRAVIS_EVENT_TYPE}" in
  pull_request )           branch="${TRAVIS_PULL_REQUEST_BRANCH}";;
  push | cron | api )      branch="${TRAVIS_BRANCH}";;
  * )                      branch="$(git rev-parse --abbrev-ref HEAD)";;
esac
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
#shellcheck disable=SC2116
dir=$(echo "${dir/tests/}")
log_file="$dir"/logs/after-effects.log
# set eo on script.
sed -i 's/set -o pipefail/set -eo pipefail/g' "$dir"/after-effects
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Building $distro:$release Docker Image"
docker build -t "${distro}:${release}" ./dockerfiles/"${release}"
echo "Running in ${TEST_ENV}"

if [[ $release == trusty ]]; then
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "Testing On HOST"
  echo "Testing with YAML"
  sudo ./after-effects --yes --yaml --simulate --api-endpoint https://"${branch}"--ubuntu-post-install.netlify.com/api --name trusty
  echo "Testing with Lists"
  sudo ./after-effects --yes --lists --simulate --name trusty
else
  echo "Testing with YAML"
  docker run -it -e TRAVIS="$TRAVIS" \
  --hostname="${TEST_ENV}" \
  -v "$(pwd)":/shared \
  "${distro}:${release}" \
  ./after-effects \
   --yaml \
   --simulate \
   --yes \
   --api-endpoint https://"${branch}"--ubuntu-post-install.netlify.com/api

  echo "Testing With Lists"
  docker run -it -e TRAVIS="$TRAVIS" \
    --hostname="${TEST_ENV}" \
    -v "$(pwd)":/shared \
    "${distro}:${release}" \
    ./after-effects \
    --lists \
    --simulate \
    --yes
fi

echo "Print Logs is set to: $PRINT_LOGS"
if [ "$PRINT_LOGS" == "true" ]; then
  echo " "
  echo " "
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  cat "$log_file"
fi
