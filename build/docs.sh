#!/usr/bin/env bash
# shellcheck disable=SC2059

# Version:0.1
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -e pipefail

# Build Static
echo "Install dependencies"
pip3 install --upgrade pip
pip3 install mkdocs-material
pip3 install \
    mkdocs-minify-plugin>=0.3 \
    mkdocs-redirects>=1.0
mkdocs --version

echo "Building Docs"
mkdocs mkdocs build

echo "Copy Netlify Files"
cp  ./netlify.toml ./_site/netlify.toml
mkdir -p ./_site/build
cp ./build/netlify.sh ./_site/build/netlify.sh
chmod +x ./_site/build/netlify.sh

COMMIT_SHORT="${GITHUB_SHA:0:7}"
cat <<EOT > ./_site/commit.json
{
  "commit": {
    "id": "${COMMIT_SHORT:-NA}",
    "ref": "${GITHUB_REF:-NA}"
  },
  "build": {
    "number": "${GITHUB_RUN_NUMBER:-NA}",
    "actor": "${GITHUB_ACTOR:-NA}",
    "workflow": "${GITHUB_WORKFLOW:-NA}",
    "event": "${GITHUB_EVENT_NAME:-NA}"
  },
  "ts": "$(date)"
}
EOT
