#!/bin/sh
set -eu
exec </dev/null 2>&1
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
rm -rfv docker/
mkdir docker
cp -pv checksum convert.sh r3rs.tar docker/
docker build --tag rnrs-pdf .
docker run --rm --volume "$PWD/docker:/docker" rnrs-pdf /docker/convert.sh
cp -pfv docker/r3rs.dvi docker/r3rs.log docker/r3rs.pdf ./
rm -rfv docker/
