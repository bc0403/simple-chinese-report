@echo off
REM Compilation script for simple-chinese-report template (Windows)
REM Usage: compile-simple.bat [clean]

if "%1"=="clean" (
    echo Cleaning auxiliary files...
    del simple-chinese-report.aux simple-chinese-report.bbl simple-chinese-report.bcf ^
        simple-chinese-report.blg simple-chinese-report.fdb_latexmk simple-chinese-report.fls ^
        simple-chinese-report.lof simple-chinese-report.log simple-chinese-report.lot ^
        simple-chinese-report.out simple-chinese-report.run.xml simple-chinese-report.synctex.gz ^
        simple-chinese-report.toc simple-chinese-report.pdf 2>nul
    echo Clean complete.
    exit /b 0
)

echo Compiling simple-chinese-report.tex...

REM First compilation
xelatex -synctex=1 -interaction=nonstopmode simple-chinese-report.tex

REM Second compilation to resolve cross-references
xelatex -synctex=1 -interaction=nonstopmode simple-chinese-report.tex

echo Compilation complete. Output: simple-chinese-report.pdf