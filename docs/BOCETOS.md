# Bocetos y Wireframes - Tlapalería App (Gestión de Inventario)

## Flujo de Navegación
```
SplashScreen -> HomeScreen (Panel)
                  ├── Inventario/Catálogo -> Detalle de producto (ajuste de stock)
                  └── Alertas de stock bajo -> Detalle de producto
```

## Pantallas

### 1. SplashScreen
- Logo de la app (`assets/images/Logo.png`)
- Nombre "Tlapalería App"
- Indicador de carga
- Navega automáticamente a Home

### 2. HomeScreen (Panel de gestión)
- Imagen de bienvenida (`assets/images/Bienvenida.png`)
- Resumen: acceso a alertas de stock bajo con contador
- Botón "Ver inventario"
- Enfoque: ayudar al encargado a detectar problemas de gestión rápidamente

### 3. Inventario / CatalogScreen
- Barra de búsqueda por nombre
- Filtros por categoría (ChoiceChips)
- Lista de productos con existencia y marca "Bajo" cuando aplica
- Navega a Detalle pasando `productId` (argumento)

### 4. ProductDetailScreen (Detalle + gestión)
- Recibe argumento `productId`
- Muestra información del producto y stock actual
- Acciones: incrementar/decrementar stock, registrar entrada (+5)
- Actualización en tiempo real vía Provider (estado compartido)

### 5. LowStockScreen (Alertas de stock bajo)
- Lista de productos con `stock <= minStock`
- Permite entrar al detalle para reabastecer/ajustar
- Estado vacío cuando no hay alertas

## Consideraciones de diseño
- Tema naranja, Material 3
- Componentes reutilizables: `ProductCard`, `CustomButton`
- Imágenes propias declaradas/usadas: `Logo.png`, `Bienvenida.png`
- Enfoque en resolver problema de gestión: control de existencias y alertas de stock bajo
