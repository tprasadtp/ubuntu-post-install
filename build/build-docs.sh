#!/usr/bin/env bash
# shellcheck disable=SC2059

# Version:0.1
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -e pipefail
spacing_string="%-15s"

## Install Python packages
pip install -r ./docs/requirements.txt
# Build Static
echo "Building Docs"
mkdocs build -v -s

for file in ./config/*.yml;
do
	printf "Linting File : ${file}\n"
  yamllint "${file}"
done

# Some checksumming
echo "Checksums"
touch sha1sum.txt sha256sum.txt sha512sum.txt
sha1sum after-effects get-after-effects.sh | tee -a sha1sum.txt
sha256sum after-effects get-after-effects.sh | tee -a sha256sum.txt
sha512sum after-effects get-after-effects.sh | tee -a sha512sum.txt
echo "Copying Checksums"
mkdir -p ./_site/ || echo "Failed to create dir _site"
cp ./*.txt ./_site/ || echo "Failed to copy SHA Checksums"
echo "Copy API Files"
cp -R ./config/ ./_site/config/ || echo "Failed to copy config files"

echo "Copying Signature file"
if [ -f after-effects.asc ]; then
  mkdir -p ./_site/config/gpg || echo "Failed to create dir _site"
	cp ./after-effects.asc ./_site/config/gpg/after-effects \
		|| echo "Failed to copy gpg files"
fi
echo "Copy Netlify Files"
cp  ./netlify.toml ./_site/netlify.toml
mkdir -p ./_site/build
cp ./build/netlify-build.sh ./_site/build/netlify-build.sh

echo "Commit Info"

true > ./_site/commit.txt
printf "${spacing_string}: ${TRAVIS_COMMIT:0:7}\n" "SRC Commit ID"  \
| tee -a ./_site/commit.txt
printf "${spacing_string}: ${TRAVIS_COMMIT_MESSAGE}\n" "SRC Message" \
| tee -a ./_site/commit.txt
printf "${spacing_string}: ${TRAVIS_BRANCH}\n" "Built from" \
| tee -a ./_site/commit.txt

COMMIT_SHORT="${TRAVIS_COMMIT:0:7}"
cat <<EOT > ./_site/commit.json
{
  "commit": {
    "id": "${COMMIT_SHORT:-NA}",
    "branch": "${TRAVIS_BRANCH:-NA}"
  },
  "build": {
    "number": "${TRAVIS_BUILD_NUMBER:-NA}",
    "tag": "${TRAVIS_TAG:-none}"
  },
  "ts": "$(date)"
}
EOT


# Commit only
# TODO: Replace Metadata gen with Go/Python
printf "Writing Commit Hash to file for redirects to netlify...\n"
printf "${TRAVIS_COMMIT}" > ./_site/COMMIT_SHA.txt
# Install htmlproofer
#echo "Installing bundler dependencies"
#bundle install
# html-proofer tests
#bundle exec htmlproofer ./_site --only-4xx --check-favicon
