@echo off
cd /d "D:\Google Drive VPH\CLAUDE AI\MEJORAS WIX\cotizador-vph"

echo Agregando cambios...
git add -A

echo.
echo Haciendo commit...
git commit -m "Actualizar rutas de imágenes: agregar estructura de carpetas y configurar imágenes por producto"

echo.
echo Haciendo push a GitHub...
git push origin main

echo.
echo Commit completado. Presiona cualquier tecla...
pause
