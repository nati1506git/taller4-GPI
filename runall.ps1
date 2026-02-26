# 1. Asegurar que PowerShell está en la raíz del proyecto
Set-Location $PSScriptRoot

Write-Host "Directorio del proyecto:"
Get-Location

# 2. Ruta explícita a Rscript
$R = "C:\Program Files\R\R-4.4.1\bin\Rscript.exe"

# 3. Restaurar entorno renv
Write-Host "Restaurando dependencias..."
& $R -e "renv::restore()"

# 4. Ejecutar scripts EN ORDEN
Write-Host "Ejecutando 00_Simule_data.R"
& $R scripts/00_Simule_data.R

Write-Host "Ejecutando 01_Limpieza.R"
& $R scripts/01_Limpieza.R

Write-Host "Ejecutando 03_Modelito.R"
& $R src/03_Modelito.R

Write-Host "Ejecutando 04_Output.R"
& $R scripts/04_Output.R
