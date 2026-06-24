#!/usr/bin/env pwsh

Set-Location "D:\Google Drive VPH\CLAUDE AI\MEJORAS WIX\cotizador-vph"

Write-Host "📝 Agregando cambios..." -ForegroundColor Cyan
git add -A

Write-Host "`n✓ Cambios agregados" -ForegroundColor Green
Write-Host "`n📤 Haciendo commit..." -ForegroundColor Cyan
git commit -m "Actualizar rutas de imagenes: agregar estructura de carpetas y configurar imagenes por producto"

Write-Host "`n✓ Commit realizado" -ForegroundColor Green
Write-Host "`n🚀 Haciendo push a GitHub..." -ForegroundColor Cyan
git push origin main

Write-Host "`n✅ Commit y push completados" -ForegroundColor Green
Write-Host "`nEscribe cualquier tecla para salir..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
