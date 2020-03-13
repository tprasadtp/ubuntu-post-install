#!/usr/bin/env bash

# This is a bash utility to test lint Dockerfiles using hadolint
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu

set -eo pipefail
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Testing Dockerfiles"
ERRORS=()

dockerfiles_folder="tests/docker"
# find all dockerfiles and lint
for file in $(find ${dockerfiles_folder} -type f -name "Dockerfile" | sort -u); do
	if file "${file}" ; then
		{
			docker run --rm -i hadolint/hadolint:latest < "$file" \
        && printf " [ OK ]: sucessfully linted %s\n\n" "${file}"
		} ||
		{
			# If hadolint failed
			ERRORS+=("${file}")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	printf "\nNo errors, hooray!!\n"
else
	echo "These files failed hadolint: ${ERRORS[*]}"
	exit 1
fi
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
