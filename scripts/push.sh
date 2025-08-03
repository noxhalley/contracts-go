#!/bin/sh
set -e

rm -rf proto_gen
mv ./gen/go proto_gen

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"

git checkout main
git add proto_gen
git diff --quiet --exit-code || git commit -m "Update from ${VERSION}"

git tag -a $VERSION -m "Version ${VERSION}"
git push --follow-tags origin main
