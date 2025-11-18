#!/bin/bash

# Compilation script for simple-chinese-report template
# Usage: ./compile-simple.sh [clean]

if [ "$1" = "clean" ]; then
    echo "Cleaning auxiliary files..."
    rm -f simple-chinese-report.aux simple-chinese-report.bbl simple-chinese-report.bcf \
          simple-chinese-report.blg simple-chinese-report.fdb_latexmk simple-chinese-report.fls \
          simple-chinese-report.lof simple-chinese-report.log simple-chinese-report.lot \
          simple-chinese-report.out simple-chinese-report.run.xml simple-chinese-report.synctex.gz \
          simple-chinese-report.toc simple-chinese-report.pdf
    echo "Clean complete."
    exit 0
fi

echo "Compiling simple-chinese-report.tex..."

# First compilation
xelatex -synctex=1 -interaction=nonstopmode simple-chinese-report.tex

# Second compilation to resolve cross-references
xelatex -synctex=1 -interaction=nonstopmode simple-chinese-report.tex

echo "Compilation complete. Output: simple-chinese-report.pdf"