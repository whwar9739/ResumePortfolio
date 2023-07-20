@echo off
setlocal

set DOCKERIMAGE=mferrin/mkdocs
set OPTION=%1

IF        "%OPTION%"=="version" (
    docker run --rm -it -v %cd%:/docs %DOCKERIMAGE% --version
) ELSE IF "%OPTION%"=="serve" (
    docker run --rm -it -p 8000:8000 -v %cd%:/docs %DOCKERIMAGE%
) ELSE IF "%OPTION%"=="build" (
    docker run --rm -it -v %cd%:/docs %DOCKERIMAGE% build
) ELSE IF "%OPTION%"=="deploy" (
    docker run --rm -it -v ~/.ssh:/root/.ssh -v %cd%:/docs %DOCKERIMAGE% gh-deploy --force
) ELSE IF "%OPTION%"=="new" (
    docker run --rm -it -v %cd%:/docs %DOCKERIMAGE% new .
) ELSE (
    echo NAME
    echo   mk - Command shortcut for MkDocs running under Docker
    echo.
    echo SYNOPSIS
    echo   mk option
    echo.
    echo OPTIONS
    echo   Supply one of the following options to:
    echo     help    - Display this helpful information
    echo     version - Display MkDocs version information
    echo     serve   - Run the builtin development server http://localhost:8000 for the current directory ^(%cd%^)
    echo     build   - Build the MkDocs documentation in the current directory ^(%cd%^)
    echo     deploy  - Deploy documentation to GitHub Pages from the current directory ^(%cd%^)
    echo     new     - Create a new MkDocs project in the current directory ^(%cd%^)
    echo.
)

goto :eof
