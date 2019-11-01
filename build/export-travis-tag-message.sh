#!/usr/bin/env bash
set -e
TRAVIS_TAG_MESSAGE=$(git tag -ln --format '%(subject)' ${TRAVIS_TAG})
export TRAVIS_TAG_MESSAGE
