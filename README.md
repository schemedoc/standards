## RnRS to PDF

These scripts use an old version of LaTeX to generate DVI copies of
old Scheme RnRS standards. Those DVI files are then turned into PDF
using `dvipdf`. We need LaTeX version 209 which is so old that
`pdflatex` does not work.

### Run on the local machine

`./convert.sh`

You need to have `latex209` and `dvipdf` installed and in `PATH`.

### Run using Docker

`./convert-docker.sh`

You need to have Docker installed and in `PATH`, and your user account
needs to be in the `docker` group.
