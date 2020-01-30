@echo off

del /f /q version
git rev-list --count master >> version
set /p revision= < version
set args=-o _nuget -p:PackageVersion=1.0.%revision%;TargetFrameworks=netstandard2.0

dotnet pack %args%

if errorlevel 1 (
	echo BUILD PROCESS FAILED.
) else (
	echo BUILD PROCESS SUCCEDED!
)
