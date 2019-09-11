#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
echo PAT OK
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0
echo branch OK

git config --global user.email "psolymos@gmail.com"
git config --global user.name "Peter Solymos"
echo git config OK

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
echo clone OK
cd book-output
cp -r ../_book/* ./
git add --all *
echo copy OK
git commit -m "Update the book" || true
echo commit OK
git push -q origin gh-pages
echo push OK
