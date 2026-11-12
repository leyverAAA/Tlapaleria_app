# Bocetos y Wireframes - Tlapalería App (POS)

## Flujo de Navegación

```text
SplashScreen
  └─ AppShell (bottom navigation con estado persistente)
       ├─ Inicio (tab 0)
       │    ├─ (venta vacía)  Nueva venta ──────────────► Catálogo
       │    ├─ (venta en curso) Continuar venta ────────► Venta actual
       │    └─ Acciones rápidas: Explorar / Buscar / Mi venta / Cobrar
       ├─ Catálogo (tab 1)
       │    ├─ tap tarjeta ─────────────────────────────► Detalle de producto
       │    ├─ botón + ─────────────────────────────────► Agrega a la venta + aviso
       │    └─ icono carrito ───────────────────────────► Venta actual
       ├─ Venta actual (tab 2)
       │    ├─ vacía → "Ver productos" ─────────────────► Catálogo
       │    ├─ ajustar cantidades / eliminar / vaciar
       │    └─ Cobrar (simulado) → confirmación → Inicio con aviso
       └─ Perfil (tab 3) → Acerca de la app, métricas y equipo

Detalle de producto (ruta empujada a pantalla completa, sin bottom navigation)
  └─ Agregar a la venta → aviso + acceso a Venta actual
```

## Reglas de navegación

- Existe **una sola venta en curso**.
- El shell conserva el estado de cada pestaña (`IndexedStack`): búsqueda, filtros y scroll no se pierden al cambiar de sección.
- Si hay productos y se pulsa “Nueva venta”, se pide confirmación antes de vaciar.
- La venta es accesible desde Inicio, Catálogo, Detalle y la pestaña **Venta**.
- El detalle se abre como ruta independiente para mantener el foco en el producto; al volver se conserva el catálogo.
- El botón + de cada tarjeta agrega directo a la venta y muestra un aviso con acción “Ver venta”.
- El cobro se confirma en un diálogo; el carrito solo se limpia al confirmar.
- “Atrás” en una pestaña distinta regresa a Inicio; en Inicio respeta el historial del sistema.
- Los estados vacíos siempre ofrecen una acción clara.

## Pantallas

### 1. SplashScreen
- Fondo carbón con destellos y diagonales naranja de marca.
- Logo oficial sobre placa blanca.
- Nombre “Tlapalería App” y tagline “Tu tlapalería en la palma de tu mano”.
- Barra de carga lineal.
- Navega automáticamente a Inicio después de 2 segundos.

### 2. Inicio (Tablero POS)
- Encabezado oscuro con logo, “Punto de venta”, tagline y subrayado naranja.
- Acceso a la venta con contador en el encabezado.
- Cuatro acciones rápidas: Explorar, Buscar, Mi venta y Cobrar.
- **Venta vacía:** tarjeta “No hay venta en curso” con botón “Nueva venta”.
- **Venta en curso:** tarjeta con cantidad de artículos, total, “Continuar venta” y “Nueva venta” (con confirmación).
- Tarjeta de tip de mostrador con el flujo recomendado.

### 3. Catálogo
- Encabezado de marca con buscador blanco elevado y acceso a la venta.
- Categorías en círculos ilustrados (`Todos` + categorías del catálogo).
- Acción “Ver todas” para quitar el filtro de categoría.
- Cuadrícula de 2–4 columnas en pantallas amplias; lista horizontal en pantallas angostas o con texto escalado.
- Tarjeta con imagen por categoría, nombre, precio y botón circular que agrega directo a la venta.
- Estado vacío con “Limpiar filtros” cuando la búsqueda no tiene resultados.

### 4. Detalle de producto
- Recibe el argumento `Product`.
- Imagen ilustrada grande, categoría, disponibilidad, nombre, precio y descripción.
- Ficha de detalles (categoría, código y tipo de venta).
- Barra inferior fija con total y botón “Agregar a la venta”.
- Aviso temporal “Producto agregado a la venta” con acción “Ver venta”.
- Acceso al carrito con contador en la barra superior.

### 5. Venta actual
- Lista de productos con imagen por categoría, precio unitario, cantidad y subtotal.
- Control de cantidad tipo píldora y eliminación por producto.
- Acción para vaciar la venta con confirmación.
- Estado vacío con botón “Ver productos”.
- Barra de cobro elevada con total y acción “Cobrar (simulado)”.
- Diálogo de confirmación con total y cantidad de artículos.
- Al confirmar: se limpia la venta, se vuelve a Inicio y se muestra un aviso.

### 6. Perfil (Acerca de)
- Logo, nombre, versión y descripción del proyecto.
- Métricas del catálogo (productos y categorías).
- Equipo del proyecto y tecnologías utilizadas.
- Contenido informativo, sin lógica de negocio.

## Sistema visual

### Paleta

| Rol | Color | Uso |
|---|---|---|
| Naranja marca | `#FF8A00` | gradientes, diagonales, destellos y acentos decorativos |
| Naranja AA | `#C2410C` | textos, precios, botones y estados activos |
| Naranja profundo | `#9A3412` | degradados y textos sobre tinte claro |
| Tinte naranja | `#FFF1E0` | fondos de íconos, chips e indicadores |
| Carbón | `#151515` / `#23201D` | encabezados de marca, splash y snackbars |
| Fondo | `#F7F7F8` | superficie de trabajo |
| Blanco | `#FFFFFF` | tarjetas, barras y campos |
| Borde | `#E7E5E4` | separadores y contornos |

### Tipografía
- **Outfit** para títulos, precios y botones.
- **Inter** para cuerpo, etiquetas y textos auxiliares.
- Fuentes empaquetadas en `assets/fonts` para funcionar sin conexión.

### Componentes reutilizables
- `BrandHeader`: encabezado carbón con diagonales, logo y acción de carrito.
- `ProductCard`: variantes de cuadrícula y lista, con botón de agregar.
- `CategoryCircle`, `SectionHeader`, `EmptyState`, `QuantityStepper`.
- `CustomButton`, `CustomOutlinedButton` y `CartActionButton`.
- `ProductImageTile`: ilustración por categoría, lista para recibir fotografía real.

### Accesibilidad y responsive
- Contraste AA en textos y precios; el naranja vibrante no se usa con texto pequeño.
- Objetivos táctiles de 44–48 dp y etiquetas semánticas en acciones.
- Textos con escalado probado a 1.3× en 320 px sin overflow.
- Cuadrícula adaptativa: lista en pantallas angostas, 2–4 columnas en pantallas amplias.
- Animaciones de 180–250 ms y respeto a la reducción de movimiento del sistema.

### Assets
- `Logo.png`: identidad de la app.
- `Bienvenida.png`: recurso de bienvenida disponible.
- Imágenes de producto: se representan por categoría hasta contar con fotografía propia.
