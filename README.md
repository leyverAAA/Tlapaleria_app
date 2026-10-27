# Tlapalería App - Proyecto Final Flutter (Etapa 1)

## Descripción
Aplicación móvil para catálogo de productos de ferretería/tlapalería. Permite visualizar productos, buscar y filtrar por categoría, ver detalle, agregar al carrito y simular compra. Desarrollada con Flutter siguiendo arquitectura lista para conectar a Firebase en Etapa 2.

## Ruta elegida
- [x] Ruta B: Problemática social / Idea propia
- [ ] Ruta A: Cliente real

**Justificación:** Se identifica la necesidad de digitalizar el catálogo y carrito de una tlapalería para facilitar la consulta de productos.

## Integrantes
- Integrante 1: [Nombre completo]
- Integrante 2: [Nombre completo]
- Integrante 3: [Nombre completo]

## Requisitos cumplidos (Etapa 1)
- [x] Flujo de entrada (SplashScreen)
- [x] Navegación entre >= 4 pantallas (Splash, Home, Catálogo, Detalle, Carrito)
- [x] Listado/catálogo con búsqueda y filtros por categoría
- [x] Pantalla de detalle que recibe argumentos (Product)
- [x] Estado compartido con Provider (CartProvider)
- [x] Tema global (AppTheme)
- [x] Al menos 2 componentes reutilizables (ProductCard, CustomButton)
- [x] Assets declarados en pubspec.yaml
- [x] Capa de datos con Model (Product) y Repository (ProductRepository)
- [x] Arquitectura organizada (core/, features/, models/, data/)

## Arquitectura
```
lib/
├── core/           # Constantes, tema y widgets reutilizables
├── data/           # Datos locales y repositorios
├── features/       # Módulos por funcionalidad (splash, home, catalog, product_detail, cart)
├── models/         # Modelos de datos
└── main.dart       # Configuración de Provider y app
```

## Tecnologías
- Flutter 3.x
- Dart
- provider: ^6.1.5+1

## Cómo ejecutar
```bash
flutter pub get
flutter run
```

## Capturas
_Agregar capturas de pantalla aquí (splash, home, catálogo, detalle, carrito)._

## Decisiones técnicas
- **Provider** para manejo de carrito (fácil migración y cumple requisito).
- **Repository pattern**: `ProductRepository` lee de datos locales, en Etapa 2 se reemplaza por fuente remota (Firebase) sin modificar UI.
- **Feature-first**: Organización por funcionalidad para escalabilidad.
- **Componentes reutilizables**: `ProductCard` y `CustomButton` para mantener consistencia visual.

## Backlog para Etapa 2
- [ ] Integración con Firebase (Autenticación)
- [ ] Firestore para productos y carrito por usuario
- [ ] CRUD de productos (administrador)
- [ ] Órdenes de compra
- [ ] Validaciones de formularios
- [ ] Persistencia de sesión
- [ ] Notificaciones
- [ ] Despliegue/compilación de APK firmado

## Fuentes externas
- Sin código copiado sin citar. Componentes y estructura propios basados en lo visto en clase (Vivero+).

## IA Log
Ver [AI_LOG.md](AI_LOG.md)
