#!/bin/bash

# Setup credentials -----------------------------------------------------------
echo "Deploying to gh-pages"
git config --global user.name "Docwhat Bot"
git config --global user.email "michael@datacamp.com"
git config credential.helper "store --file=.git/credentials"
echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials

git remote remove origin
git remote add origin https://github.com/datacamp/courses-testwhat-tutorial.git

# Deploy to gh-pages ----------------------------------------------------------
if [ -n "${TRAVIS_TAG}" ]; then
    TARGET=$TRAVIS_TAG
else
    TARGET="commit ${TRAVIS_COMMIT}"
fi

BRANCH="gh-pages"

# Set up a temporary folder to prepare distribution files.
TMP=~/tmp
mkdir $TMP
# Copy everything to the this folder first, then clean up.
cp -r . $TMP/
rm -rf $TMP/.git

git stash --include-untracked --all

# Specifically fetch and check out the prebuilt/module branch from origin.
git fetch origin +refs/heads/$BRANCH:refs/remotes/origin/$BRANCH
git checkout -b $BRANCH -t origin/$BRANCH

# Remove everything so we can fully replace it. Git will create the diffs.
git rm -fr *

# move in contents from build directory
mv $TMP/* .
rm -rf ./node_modules

# clean out uneccessary build and cache files
git add -f --all *
git commit -m "Build for ${TARGET}"
git push -u origin $BRANCH
rm -rf $TMP
