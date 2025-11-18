@echo off
REM Generic compilation script for any LaTeX file (Windows)
REM Usage: compile-any.bat filename.tex [clean]

if "%~1"=="" (
    echo Usage: compile-any.bat filename.tex [clean]
    echo   or:  compile-any.bat filename.tex clean
    exit /b 1
)

set "TEXFILE=%~1"
set "BASENAME=%~n1"

if "%2"=="clean" (
    echo Cleaning auxiliary files for %BASENAME%...
    del %BASENAME%.aux %BASENAME%.bbl %BASENAME%.bcf ^
        %BASENAME%.blg %BASENAME%.fdb_latexmk %BASENAME%.fls ^
        %BASENAME%.lof %BASENAME%.log %BASENAME%.lot ^
        %BASENAME%.out %BASENAME%.run.xml %BASENAME%.synctex.gz ^
        %BASENAME%.toc %BASENAME%.pdf 2>nul
    echo Clean complete.
    exit /b 0
)

echo Compiling %TEXFILE%...

REM First compilation
xelatex -synctex=1 -interaction=nonstopmode "%TEXFILE%"

REM Process bibliography with BibTeX
bibtex "%BASENAME%"

REM Second compilation to incorporate bibliography
xelatex -synctex=1 -interaction=nonstopmode "%TEXFILE%"

REM Third compilation to resolve all references
xelatex -synctex=1 -interaction=nonstopmode "%TEXFILE%"

echo Compilation complete. Output: %BASENAME%.pdf