#!/usr/bin/env bash
# shellcheck disable=SC2059

# Version:0.1
# Author: Prasad Tengse
# Licence: GPLv3
# Github Repository: https://github.com/tprasadtp/after-effects-ubuntu
set -e pipefail

# Build Static
echo "Building Docs"
# mkdocs build -v -s
#docker run -v "$(pwd)"/docs:/docs/docs -v "$(pwd)"/mkdocs.yml:/docs/mkdocs.yml -v "$(pwd)"/.git:/docs/.git:ro tprasadtp/mkdocs-material build -v -s --config-file /docs/mkdocs.yml

docker run --userns=host --workdir=/docs -v "$(pwd)":/docs tprasadtp/mkdocs-material build -v -s --config-file /docs/mkdocs.yml

sudo chown -R "$USER" _site/

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
    "number": "${GITHUB_RUN_ID:-NA}",
    "actor": "${GITHUB_ACTOR:-NA}",
    "workflow": "${GITHUB_WORKFLOW:-NA}",
    "event": "${GITHUB_EVENT_NAME:-NA}"
  },
  "ts": "$(date)"
}
EOT
