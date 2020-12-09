#!/bin/sh
set -eu
exec </dev/null 2>&1
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
docker rmi --force rnrs-pdf
docker build --tag rnrs-pdf .
docker run --rm --volume "$PWD/docker:/docker" rnrs-pdf
