## RnRS to PDF

This repo does reproducible builds of the RnRS standards documents
with well documented, auditable build steps. Reproducible means that
different builds produce bit-identical copies of files.

For R3RS and R4RS we use the old LaTeX version 209 to generate DVI
copies. The DVI files are then turned into PDF using `dvipdf`. This
version of LaTeX is so old that `pdflatex` does not work with it.

For R5RS, R6RS, and R7RS we use the current version of LaTeX, with
`pdflatex` to generate PDF files directly.
