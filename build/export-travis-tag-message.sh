#!/usr/bin/env bash
export TRAVIS_TAG_MESSAGE=$(git tag -ln --format '%(subject)' ${TRAVIS_TAG})
