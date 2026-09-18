@echo off

set target=%1

if "%target%"=="install" goto install
if "%target%"=="lint" goto lint
echo invalid argument %target%
exit /b 1


:install
@REM install pre-commit hooks when not in CI
if "%CI%"=="" (
    pre-commit install
    exit /b %errorlevel%
)


:lint
@REM run the linter hooks from pre-commit on all files
echo linting all files
pre-commit run --all-files
exit /b %errorlevel%
