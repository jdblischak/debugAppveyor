Write-Host "Downloading RStudio Desktop"
Invoke-WebRequest https://download1.rstudio.org/RStudio-1.1.463.exe -OutFile rstudio.exe

Write-Host "Installing RStudio Desktop"
Start-Process -FilePath .\rstudio.exe -ArgumentList "/S /v/qn" -Wait

Write-Host "Opening RStudio Desktop"
Start-Process 'C:\Program Files\RStudio\bin\rstudio.exe'
