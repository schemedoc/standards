#!/bin/sh
set -eu
exec </dev/null 2>&1
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
docker build -t rnrs-pdf .
docker run -t rnrs-pdf -V $PWD/docker:/docker
