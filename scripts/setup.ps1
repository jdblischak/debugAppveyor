# Switch to projects directory
cd C:\projects

# Import appveyor-tool
Import-Module ".\appveyor-tool.ps1"

Progress "appveyor-tool module loaded"

$env:Path = "C:\R\bin;" + $env:Path

$env:R_LIBS_USER = "C:\Rlibrary"

Rscript.exe -e ".libPaths()"