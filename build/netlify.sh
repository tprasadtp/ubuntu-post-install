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

function build_production()
{
  echo "---> Copying GH-PAGES Branch"
  mkdir -p ./_site/
  rsync -Ea --recursive \
  --exclude '*.md*' \
  --exclude '*.MD*' \
  --exclude '.git' \
  --exclude 'Dockerfile' \
  --exclude 'vendor' \
  --exclude 'netlify.toml' \
  --exclude 'rsync-shared' \
  --exclude '.gitignore' \
  --exclude '.travis.yml' \
  --exclude 'screenshots' \
  --exclude 'LICENSE' \
  --exclude 'dockerfiles' \
  --exclude 'tests' \
  ./ ./_site && echo "---> Copied gh-pages"

}

function build_branch()
{
  install_dependencies;

  echo "---> Building Website with Branch"
  mkdocs build;
}


function usage()
{
  #Prints out help menu
cat <<EOF
Usage: netlify-deploy [OPTIONS]
[-p --production]       [Production Deployment (Master Branch)]
[-b --branch]           [Branch Deployment]
[-pr --pull-request]    [Pull request deployment (Same as branch)]
EOF
}

function install_dependencies()
{
  pip3 install --upgrade pip
  pip3 install mkdocs-material
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


      # Process command line arguments.
      while [ "$1" != "" ]; do
          case ${1} in
              -p | --production )     build_production;
                                      exit $?
                                      ;;
              -b | --branch )         build_branch;
                                      exit $?
                                      ;;
              -pr | --pull-request )  build_branch;
                                      exit $?
                                      ;;
              * )                     echo "Invalid arguments";
                                      usage;
                                      exit 1
                                      ;;
          esac
      	shift
      done
  }
#
main "$@"
