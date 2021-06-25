#!/usr/bin/env bash
#shellcheck disable=SC2059

# This is a bash script to build jekyll website and test it with htmlproofer
# Netlify Deployments
# Version:1.0
# Author: Prasad Tengse

# gh-pages is built on gh. and deploy it on netlify to production.
# Remove .toml and scripts. & deploy the entire branch. No need to build anything as its already built.
# If something else is pushed to any branches, deploy it as branch deploy.
set -e # halt script on error

echo "---> Building Website "

function usage()
{
  #Prints out help menu
cat <<EOF
Usage: netlify-deploy [OPTIONS]
EOF
}

function generate_changelog()
{
  echo "---> Installing git-chglog (homebrew)"
  brew tap git-chglog/git-chglog
  brew install git-chglog

  echo "---> Pull all tags (workaround)"
  git fetch --tags --all
  echo "---> List all tags (workaround)"
  git tag --sort=-version:creatordate --sort=-v:refname --list --merged=master

  echo "---> Generating docs/changelog.md via git-chglog"
  ./scripts/changelog.sh \
    --changelog \
    --oldest-tag "v7.0.0" \
    --footer-file .chglog/OLD_CHGLOG.md \
    --output docs/changelog.md \
    --repository "https://github.com/tprasadtp/ubuntu-post-install"
  cat docs/changelog.md
}

function install_dependencies()
{
  pip3 install --upgrade pip
  pip3 install mkdocs-material==7.1.9
  pip3 install \
      mkdocs-minify-plugin>=0.3 \
      mkdocs-redirects>=1.0
  mkdocs --version
}


function main()
{
      #check if no args
      if [ $# -eq 0 ]; then
              echo "---> No arguments found. See usage below."
              usage;
      		    exit 1;
      fi;


  install_dependencies;
  generate_changelog

  echo "---> Building Website with Branch"
  mkdocs build;
  }
#
main "$@"
