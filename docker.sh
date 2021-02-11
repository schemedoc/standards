#!/bin/sh
set -eu
cd "$(dirname "$0")"
echo "Entering directory '$PWD'"
set -x
docker build --tag rnrs-pdf .
exec docker run -it --rm --volume "$PWD:/work" rnrs-pdf
