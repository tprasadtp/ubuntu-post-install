#!/usr/bin/env bash

# This is a bash utility to test the shellscripts in this repo using shellcheck
# Version:0.1
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu

set -eo pipefail
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Testing ShellScripts"
ERRORS=()

# find all executables and run `shellcheck`
for file in $(find . -type f -not -iwholename '*.git*' -executable | sort -u); do
	if file "${file}" ; then
		{
			# ignore unused variables in pf 2059, double  quote strings  2086 2034 unused strings
			shellcheck -e SC2034 -e SC2154 "${file}" && printf " [ OK ]: sucessfully linted %s\n\n" "${file}"

		} ||
		{
			# If shell check failed
			ERRORS+=("${file}")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	printf "\nNo errors, hooray!!\n"
else
	echo "These files failed shellcheck: ${ERRORS[*]}"
	exit 1
fi
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
