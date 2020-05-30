#!/usr/bin/env bash

set -eo pipefail

function display_usage()
{
cat <<EOF
Updates vendored YQ binaries.

[-v --version]  Version of YQ to download (Required)
[-h --help]     This Help Message
EOF
}

function download_yq()
{
  echo "$((++count)). Creating version directory ./vendor/${yq_version}"
  mkdir -p vendor/"${yq_version}"/{amd64,arm,arm64}
  echo "$((++count)). Downloading Checksums"
  curl -sSfL "https://github.com/mikefarah/yq/releases/download/${yq_version}/checksums" -o "./vendor/${yq_version}/.RHASH"

  echo "$((++count)). Downloading 64 bit YQ Binary"
  #curl -sSfL "https://github.com/mikefarah/yq/releases/download/${yq_version}/yq_linux_amd64" -o "./vendor/${yq_version}/amd64/yq"
  echo "$((++count)). Checksum (E)"
  YQ_AMD64_CHECKSUM="$(grep -w yq_linux_amd64 vendor/${yq_version}/.RHASH | cut -d ' ' -f37)"
  echo "$((++count)). Checksum (W)"
  echo "${YQ_AMD64_CHECKSUM}" > "./vendor/${yq_version}/amd64/yq.sha256"

  echo "$((++count)). Downloading ARM YQ Binary"
  #curl -sSfL "https://github.com/mikefarah/yq/releases/download/${yq_version}/yq_linux_arm" -o "./vendor/${yq_version}/arm/yq"
  echo "$((++count)). Checksum (E)"
  YQ_ARM_CHECKSUM="$(grep -w yq_linux_arm vendor/${yq_version}/.RHASH | cut -d ' ' -f37)"
  echo "$((++count)). Checksum (W)"
  echo "${YQ_ARM_CHECKSUM}" > "./vendor/${yq_version}/arm/yq.sha256"

  echo "$((++count)). Downloading ARM64 YQ Binary"
  #curl -sSfL "https://github.com/mikefarah/yq/releases/download/${yq_version}/yq_linux_arm64" -o "./vendor/${yq_version}/arm64/yq"
  echo "$((++count)). Checksum (E)"
  YQ_ARM64_CHECKSUM="$(grep -w yq_linux_arm64 vendor/${yq_version}/.RHASH | cut -d ' ' -f37)"
  echo "$((++count)). Checksum (W)"
  echo "${YQ_ARM_CHECKSUM}" > "./vendor/${yq_version}/arm64/yq.sha256"

  echo "$((++count)). Checksum (GNU)"
  cat << EOF > ./vendor/"${yq_version}"/SHA256SUMS
${YQ_AMD64_CHECKSUM} vendor/${yq_version}/amd64/yq
${YQ_ARM_CHECKSUM} vendor/${yq_version}/arm/yq
${YQ_ARM64_CHECKSUM} vendor/${yq_version}/arm64/yq
EOF

}

function verify_checksums()
{
  echo "$((++count)). Verifying SHA256 Checksums"
  if sha256sum -c "./vendor/${yq_version}/SHA256SUMS" --strict --quiet; then
    echo "$((++count)). Hooray! Checksums verified!"
  else
    echo "$((++count)). Error! files failed checksum verification"
    exit 2
  fi
}

function main()
{
  # No args just run the setup function
  if [[ $# -eq 0 ]]; then
    display_usage;
    exit 1
  fi

  count=0
  while [[ ${1} != "" ]]; do
    case ${1} in
      -h | --help )          display_usage;exit 0;;
      -v | --version)        shift; readonly yq_version="${1}";;
      -V | --verify)         verify_checksums;exit $?;;
      * )                    echo -e "\e[91mInvalid argument(s). See usage below. \e[39m";display_usage;;
    esac
    shift
  done

  if [[ -z $yq_version ]]; then
    echo "Error! YQ Version not specified!"
    exit 1
  fi

  download_yq
  verify_checksums

}

main "$@"
