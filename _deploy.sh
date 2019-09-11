#!/bin/sh

set -o errexit -o nounset

[ -z "${GH_TOKEN}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "psolymos@gmail.com"
git config --global user.name "Peter Solymos"

git clone -b gh-pages https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m "Update the book (${TRAVIS_BUILD_NUMBER})" || true
git push -q origin gh-pages
