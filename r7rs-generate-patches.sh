#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
mkdir -p repo
rm -rf repo/r7rs
git clone --quiet https://github.com/lassik/r7rs-spec.git repo/r7rs
cd repo/r7rs
git config --local advice.detachedHead false
git checkout official-with-build-fixes
git checkout errata
git checkout official
git diff official..official-with-build-fixes \
    "spec/*.tex" >../../r7rs-official.patch
git diff official..errata \
    "spec/*.tex" >../../r7rs-errata.patch
