# Switch to projects directory
cd C:\projects\debugappveyor

# Import appveyor-tool
Import-Module "..\appveyor-tool.ps1"

Progress "appveyor-tool module loaded"

# Add R.exe and Rscript.exe to path
$env:Path = "C:\R\bin;" + $env:Path

# Set user library
$env:R_LIBS_USER = "C:\Rlibrary"

# Confirm library paths
Rscript.exe -e ".libPaths()"

# Run tests with the travis-tool
.\travis-tool.sh.cmd run_tests
