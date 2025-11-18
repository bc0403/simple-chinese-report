#!/bin/bash

# Generic compilation script for any LaTeX file
# Usage: ./compile-any.sh filename.tex [clean]

if [ -z "$1" ]; then
    echo "Usage: ./compile-any.sh filename.tex [clean]"
    echo "  or:  ./compile-any.sh filename.tex clean"
    exit 1
fi

TEXFILE="$1"
BASENAME="$(basename "$1" .tex)"

if [ "$2" = "clean" ]; then
    echo "Cleaning auxiliary files for $BASENAME..."
    rm -f "$BASENAME.aux" "$BASENAME.bbl" "$BASENAME.bcf" \
          "$BASENAME.blg" "$BASENAME.fdb_latexmk" "$BASENAME.fls" \
          "$BASENAME.lof" "$BASENAME.log" "$BASENAME.lot" \
          "$BASENAME.out" "$BASENAME.run.xml" "$BASENAME.synctex.gz" \
          "$BASENAME.toc" "$BASENAME.pdf"
    echo "Clean complete."
    exit 0
fi

echo "Compiling $TEXFILE..."

# First compilation
xelatex -synctex=1 -interaction=nonstopmode "$TEXFILE"

# Process bibliography with BibTeX
bibtex "$BASENAME"

# Second compilation to incorporate bibliography
xelatex -synctex=1 -interaction=nonstopmode "$TEXFILE"

# Third compilation to resolve all references
xelatex -synctex=1 -interaction=nonstopmode "$TEXFILE"

echo "Compilation complete. Output: $BASENAME.pdf"