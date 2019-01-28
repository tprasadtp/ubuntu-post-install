#!/usr/bin/env bash
#shellcheck disable=SC2059
#                                        _  .
# \,___, .___    ___    ____   ___    ___/ _/_
# |    \ /   \  /   `  (      /   `  /   |  |
# |    | |   ' |    |  `--.  |    | ,'   |  |
# |`---' /     `.__/| \___.' `.__/| `___,'  \__/
# \                                      `
#

# This is a bash script to build jekyll website and test it with htmlproofer
# Netlify Deployments
# Version:1.0
# Author: Prasad Tengse

# gh-pages is built on travis. and deploy it on netlify to production.
# Remove .toml and scripts. & deploy the entire branch. No need to build anything as its already built.
# If something else is pushed to any branches, deploy it as branch deploy.
# This is a temporary fix till travis deployment and enforced https on github pages will work together.
# Else, deploy to banches anyway for testing purposes..
set -e # halt script on error
DEPLOY_PARAM=./_site/deploy-params.txt
spacing_string="%-15s"
#Constants
DATE=$(date +%Y-%m-%d:%H:%M:%S)

echo "---> Building Website "

function gen_metadata()
{
  #shellcheck disable=SC2129
  echo ">>---------------------------- Build Metadata -------------------------------------<<" >>${DEPLOY_PARAM}
  echo "This Version of Website was Generated On ${DATE} By Netlify Build Bots." >> ${DEPLOY_PARAM}
  printf "${spacing_string}: $BRANCH\n" "Branch" >>${DEPLOY_PARAM}
  printf "${spacing_string}: $PULL_REQUEST\n" "Is PR" >>${DEPLOY_PARAM}
  printf "${spacing_string}: ${COMMIT_REF:0:7}\n" "Commit" >>${DEPLOY_PARAM}
  printf "${spacing_string}: $CONTEXT\n" "Deploy Type" >>${DEPLOY_PARAM}
  printf "${spacing_string}: $DEPLOY_URL\n" "Deploy URL" >>${DEPLOY_PARAM}
  printf "${spacing_string}: $DEPLOY_PRIME_URL\n" "Prime URL" >>${DEPLOY_PARAM}
  if [ "$BRANCH" == "gh-pages" ]; then
    echo ">>---------------------------- From SRC Branch ------------------------------------<<" >>${DEPLOY_PARAM}
    cat ./commit.txt >> ${DEPLOY_PARAM}
  fi

  echo ">>--------------------------- End Build Metadata ----------------------------------<<" >>${DEPLOY_PARAM}
  #shellcheck disable=SC2129
  cat ${DEPLOY_PARAM}
}


function html-proofer-checks()
{
echo "---> Checking links with HTML Proofer"
echo "Errors will halt the script and Deployment. Check for recently added links and avoid links which redirect. Remember If a link becomes dead [In Future] build will fail!!"
echo "---------------------------------------------------------"
bundle exec htmlproofer ./_site --only-4xx --check-favicon --check-html
echo "---------------------------------------------------------"
}

function jekyll_production()
{
  echo "---> Copying GH-PAGES Branch"
  mkdir -p ./_site/
  rsync -Ea --recursive \
  --exclude '*.md*' \
  --exclude '*.MD*' \
  --exclude '.git' \
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
  gen_metadata;

  COMMIT_SHA_MASTER="$(cat COMMIT_SHA.txt)"

  echo "Replace placceholder with master SHA1 commit"
  sed -i s/PLACEHOLDER_REDIRECT/${COMMIT_SHA_MASTER}/g netlify.toml

}

function jekyll_branch()
{
  install_dependencies;

  # Replace PLACEHOLDER_REDIRECT
  echo "Replacing Placeholder with ${COMMIT_REF} in Netlify TOML file"
  sed -i s/PLACEHOLDER_REDIRECT/${COMMIT_REF}/g netlify.toml

  echo "---> Building Website with Branch"
  mkdocs build;
  echo "---> Convering to JSON"
  mkdir -p ./config/json
  for file in ./config/*.yml;
  do
    printf "Linting & Converting File  to JSON : ${file}\n"
    file_name_json=$(basename ./config/"${file}" .yml)
    file_name_json+=".json"
    yamllint "${file}" && yml2json "${file}" | python -m json.tool > ./config/json/"${file_name_json}"
    index=$((index + 1))
  done
  echo "---> Copying Config Files"
  rsync -Ea --recursive ./config/ ./_site/config/ && echo "Done!"
  find ./_site/config -type f
  echo "---> Copying Signature file"
  if [ -f after-effects.asc ]; then
    mkdir -p ./config/gpg
    cp ./after-effects.asc ./config/gpg/after-effects
  fi
  gen_metadata;
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
  pip install -r ./dockerfiles/mkdocs/requirements.txt
  mkdocs --version
  #bundle install
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
              -p | --production )     jekyll_production;
                                      exit $?
                                      ;;
              -b | --branch )         jekyll_branch;
                                      exit $?
                                      ;;
              -pr | --pull-request )  jekyll_branch;
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
