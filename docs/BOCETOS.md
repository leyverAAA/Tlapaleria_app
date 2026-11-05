# Bocetos y Wireframes - Tlapalería App (POS)

## Flujo de Navegación
```
SplashScreen -> HomeScreen (POS)
                  ├── Catálogo (búsqueda/filtros) -> Detalle de producto (recibe Product)
                  └── Venta actual / Carrito (ticket, total, cobro simulado)
```

## Pantallas

### 1. SplashScreen
- Logo de la app (`assets/images/Logo.png`)
- Nombre "Tlapalería App"
- Indicador de carga
- Navega automáticamente a Home

### 2. HomeScreen (POS)
- Imagen de bienvenida (`assets/images/Bienvenida.png`)
- Mensaje "Punto de Venta" y acción principal para nueva venta/agregar productos
- Acceso rápido a la venta actual con contador de artículos
- Enfoque: iniciar una venta rápido en mostrador

### 3. CatalogScreen (Productos)
- Barra de búsqueda por nombre
- Filtros por categoría (ChoiceChips)
- Lista de productos con precio (componente reutilizable `ProductCard`)
- Navega a Detalle pasando el objeto `Product` (argumento)

### 4. ProductDetailScreen (Detalle)
- Recibe argumento `Product`
- Muestra información del producto (nombre, categoría, precio, descripción)
- Acción "Agregar a la venta" (actualiza estado compartido con Provider)

### 5. CartScreen (Venta actual)
- Lista de productos en la venta con cantidad y subtotal
- Controles para aumentar/disminuir cantidad y vaciar venta
- Total calculado
- Acción "Cobrar (simulado)" con confirmación

## Consideraciones de diseño
- Tema naranja, Material 3
- Componentes reutilizables: `ProductCard`, `CustomButton`
- Imágenes propias declaradas/usadas: `Logo.png`, `Bienvenida.png`
- Lógica simple estilo base Viveroa (estado con `ChangeNotifier`/Provider, navegación directa)
- Enfoque en resolver problema de gestión: registro rápido de ventas y cálculo de total
