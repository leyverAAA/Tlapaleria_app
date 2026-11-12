# Guía de capturas — Tlapalería App (Etapa 1)

Esta carpeta debe contener las capturas reales de la app funcionando. Las imágenes que ya están aquí son **referencias** y deben reemplazarse o renombrarse para la entrega.

> No inventar capturas ni evidencia. Toma las imágenes ejecutando la app real.

## Capturas requeridas

| Pantalla | Archivo sugerido | Qué debe mostrar |
|---|---|---|
| Splash | `splash.png` | Logo, nombre de la app e indicador de carga |
| Home / POS | `home.png` | Tablero con venta vacía o venta en curso |
| Catálogo | `catalogo.png` | Búsqueda y filtro por categoría activos |
| Detalle | `detalle.png` | Producto, precio y botón “Agregar a la venta” |
| Venta actual | `venta.png` | Productos, cantidades, subtotal y total |
| Cobro (opcional) | `cobro.png` | Diálogo de confirmación con el total |

## Cómo tomarlas

1. Ejecuta la app:
   ```bash
   flutter pub get
   flutter run
   ```
2. Usa un emulador o dispositivo con orientación vertical.
3. Sigue el flujo completo: Splash → Home → Catálogo → Detalle → Venta → Cobro.
4. Captura cada pantalla y guárdala en esta carpeta con el nombre sugerido.
5. Verifica que se lean los textos, precios y botones.

## Recomendaciones

- Usa la misma resolución y dispositivo para todas las capturas.
- Evita notificaciones, barras de depuración o datos personales.
- Si cambias el diseño, vuelve a tomar las capturas para que coincidan con el código.
- Adjunta también un video corto del flujo si el profesor lo permite.

## Checklist

- [ ] `splash.png`
- [ ] `home.png`
- [ ] `catalogo.png`
- [ ] `detalle.png`
- [ ] `venta.png`
- [ ] `cobro.png` (opcional)
- [ ] Las capturas coinciden con la versión actual de la app.
