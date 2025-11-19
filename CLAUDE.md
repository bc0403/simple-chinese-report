# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a simplified Chinese academic report template based on Zhejiang University's zjuthesis template. It's designed for simple Chinese academic reports, course papers, and technical documents.

## Build System and Compilation

### Primary Compilation Methods

1. **Using compilation scripts (recommended):**
   - Linux/Mac: `./compile-any.sh filename.tex`
   - Windows: `compile-any.bat filename.tex`

2. **Using LaTeXmk with custom configuration:**
   ```bash
   latexmk -r simple-latexmkrc simple-chinese-report.tex
   ```

3. **Manual compilation sequence:**
   ```bash
   xelatex -synctex=1 -interaction=nonstopmode filename.tex
   bibtex filename
   xelatex -synctex=1 -interaction=nonstopmode filename.tex
   xelatex -synctex=1 -interaction=nonstopmode filename.tex
   ```

### Cleaning Auxiliary Files

- Linux/Mac: `./compile-any.sh filename.tex clean`
- Windows: `compile-any.bat filename.tex clean`

## Template Architecture

### Main Template File
- `simple-chinese-report.tex` - The primary LaTeX template file
- Uses `ctexart` document class with UTF-8 encoding and Chinese support
- Configured for XeLaTeX engine (required for Chinese characters)

### Key Features
- **Chinese Support**: XeLaTeX engine with automatic Chinese font handling
- **Academic Structure**: Standard sections including title page, abstract, table of contents, body, references, acknowledgments
- **Bibliography Management**: BibTeX integration with example `references.bib` file
- **Professional Layout**: Proper margins, headers, footers, and section formatting

### File Structure
- `bib/` - Directory for bibliography files (optimized for JabRef)
- `figs/` - Directory for images and figures
- `bib/references.bib` - BibTeX bibliography database with example entries
- `simple-latexmkrc` - LaTeXmk configuration for automated compilation
- `sandbox.tex` - Additional LaTeX file for testing

## Development Workflow

### Adding Content
1. Edit `simple-chinese-report.tex` to modify:
   - Title page information (lines 87-107)
   - Abstract and keywords (lines 113-119)
   - Section content (starting at line 126)

2. Add images to `figs/` directory and reference them in LaTeX code

3. Update bibliography in `bib/references.bib` and cite using `\cite{key}`

### Customization
- Modify section formatting in `ctexset` configuration (lines 30-52)
- Adjust page layout in `geometry` settings (line 14)
- Update header/footer styles in `fancyhdr` configuration (lines 55-60)

## Technical Requirements

- **TeX Distribution**: TeX Live 2020+ or MiKTeX
- **Engine**: XeLaTeX (required for Chinese support)
- **Fonts**: System Chinese fonts (Windows automatically supported)

## Common Tasks

- **Compile specific file**: Use `compile-any.sh` or `compile-any.bat`
- **Clean auxiliary files**: Add `clean` parameter to compilation scripts
- **Add new references**: Edit `bib/references.bib` and run full compilation cycle
- **Add images**: Place in `figs/` directory and use `\includegraphics`
- **Manage bibliography with JabRef**: Use `bib/` directory for .bib files and associated PDFs

## Notes

- All LaTeX files must use UTF-8 encoding
- XeLaTeX is required (not pdfLaTeX) for Chinese character support
- The template includes example content that should be replaced with actual content
- Bibliography requires multiple compilation passes to resolve all references