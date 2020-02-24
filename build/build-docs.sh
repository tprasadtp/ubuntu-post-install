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
