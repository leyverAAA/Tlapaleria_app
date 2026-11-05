# Capturas de la app (Etapa 1)

Coloca aquí las capturas reales de la aplicación funcionando. **No se incluyen imágenes inventadas**; deben generarse ejecutando la app (`flutter run`) o desde un emulador/dispositivo.

## Archivos esperados (según `README.md`)

| Pantalla | Archivo |
|---|---|
| Splash | `splash.png` |
| Home / POS | `home.png` |
| Catálogo (búsqueda/filtro) | `catalogo.png` |
| Detalle de producto | `detalle.png` |
| Venta / Carrito (ticket y total) | `venta.png` |

## Cómo obtenerlas (sugerencia)
1. Ejecuta: `flutter pub get` y `flutter run`.
2. Navega por el flujo POS (Splash → Home → Catálogo → Detalle → Agregar → Venta → Cobrar simulado).
3. Toma capturas en cada pantalla y guárdalas en esta carpeta con los nombres de la tabla.
4. Verifica que las imágenes se muestren en el `README.md` principal si agregas vistas previas.

## Evidencia alternativa/complementaria
- **Video corto** del flujo (recomendado) enlazado en el `README.md`.
- **APK debug** generado por CI: artifact **`app-debug-apk`** en GitHub Actions (workflow `.github/workflows/flutter_ci.yml`).
