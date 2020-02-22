#!/usr/bin/env bash
# shellcheck disable=SC2059

# Version:0.1
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -e pipefail

## Install Python packages
pip install -r ./docs/requirements.txt
# Build Static
echo "Building Docs"
mkdocs build -v -s


# Some checksumming
echo "Checksums"
touch sha1sum.txt sha256sum.txt sha512sum.txt
sha1sum after-effects get-after-effects.sh | tee -a sha1sum.txt
sha256sum after-effects get-after-effects.sh | tee -a sha256sum.txt
sha512sum after-effects get-after-effects.sh | tee -a sha512sum.txt
echo "Copying Checksums"
mkdir -p ./_site/
cp ./*.txt ./_site/

echo "Copying Configs"
cp -R ./config/ ./_site/config/

echo "Copying Signature file"
if [ -f after-effects.asc ]; then
  mkdir -p ./_site/config/gpg || echo "Failed to create dir _site"
	cp ./after-effects.asc ./_site/config/gpg/after-effects.asc \
		|| echo "Failed to copy gpg files"
fi
echo "Copy Netlify Files"
cp  ./netlify.toml ./_site/netlify.toml
mkdir -p ./_site/build
cp ./build/netlify-build.sh ./_site/build/netlify-build.sh

COMMIT_SHORT="${GITHUB_SHA:0:7}"
cat <<EOT > ./_site/commit.json
{
  "commit": {
    "id": "${COMMIT_SHORT:-NA}",
    "ref": "${GITHUB_REF:-NA}"
  },
  "build": {
    "number": "${GITHUB_RUN_ID:-NA}",
    "actor": "${GITHUB_ACTOR:-NA}",
    "workflow": "${GITHUB_WORKFLOW:-NA},
    "event": "${GITHUB_EVENT_NAME:-NA}"
  },
  "ts": "$(date)"
}
EOT
