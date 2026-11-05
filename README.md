<div align="center">

# Tlapalería App - Proyecto Final Flutter (Etapa 1)

[![CI](https://github.com/leyverAAA/Tlapaleria_app/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/leyverAAA/Tlapaleria_app/actions/workflows/flutter_ci.yml)

<img src="assets\images\Tlapalería App_ herramientas al alcance.png" alt="Tlapalería App - Bienvenida" >

</div>

<p align="center">
  <a href="#inicio-rapido">Inicio rápido</a> ·
  <a href="#documentación">Documentación</a> ·
  <a href="AI_LOG.md">AI_LOG</a>
</p>

## Descripción
Aplicación móvil de **gestión de inventario** para una tlapalería/ferretería. Ayuda al cliente a controlar existencias, identificar productos con **stock bajo** y actualizar cantidades de forma rápida. Incluye consulta de productos, búsqueda/filtros y detalle con acciones de gestión. Desarrollada con Flutter siguiendo arquitectura lista para conectar a Firebase en Etapa 2.

## Documentación
- [Definición del proyecto](docs/DEFINICION_PROYECTO.md) — problema, usuarios, alcance MVP, objetivos y requisitos priorizados.
- [Bocetos / Wireframes](docs/BOCETOS.md) — flujo de navegación y descripción de pantallas.
- [Bitácora de IA](AI_LOG.md) — registro de usos permitidos de inteligencia artificial.

## Ruta elegida
- [x] Ruta A: Cliente real
- [ ] Ruta B: Problemática social / Idea propia

## Integrantes
- Integrante 1: Leyver Aaron Gonzalez Mendoza
- Integrante 2: Zaid Emanuel Hernandez Espinosa
- Integrante 3: Benjamin Alberto Arce Hernadez 

## Plan de Trabajo, Roles y Tareas

### Roles Asignados

| Rol | Integrante | Responsabilidades |
| :-- | :-- | :-- |
| **Coordinación / Git / Documentación** | Leyver Aaron Gonzalez Mendoza | Organización de reuniones, manejo de ramas y Pull Requests, revisión de commits, mantenimiento del `README.md`, `AI_LOG.md` y bitácora del equipo. |
| **UI/UX / Diseño** | Zaid Emanuel Hernandez Espinosa | Diseño de interfaces, tema global, componentes reutilizables, assets propios y asegurar la coherencia visual de la aplicación. |
| **Arquitectura / Datos / Navegación** | Benjamin Alberto Arce Hernadez | Estructura del proyecto, modelos, repositorios, navegación entre pantallas, estado compartido con Provider e integración general. | 



### División de Tareas por Integrante

#### 1. Leyver Aaron Gonzalez Mendoza (Coordinación / Git / Documentación)
| Tarea | Descripción | Entregable | Estado |
| :-- | :-- | :-- | :-- |
| Definición del proyecto | Plasmar el problema, usuarios, alcance del MVP y justificación de la ruta elegida. | [docs/DEFINICION_PROYECTO.md](docs/DEFINICION_PROYECTO.md) | Completado |
| Bocetos y Wireframes | Realizar bocetos de todas las pantallas a implementar. | [docs/BOCETOS.md](docs/BOCETOS.md) | Completado |
| Gestión de GitHub | Crear y administrar el repositorio, ramas por funcionalidad y asegurar commits de los 3 integrantes. | Repositorio + CI configurado | Completado |
| Documentación | Mantener y actualizar el `README.md` con toda la información requerida. | `README.md` | Completado |
| Bitácora de IA | Documentar todos los usos de IA permitidos en la rúbrica. | [AI_LOG.md](AI_LOG.md) | Completado |


#### 2. Zaid Emanuel Hernandez Espinosa (UI/UX / Diseño)
| Tarea | Descripción | Entregable | Estado |
| :-- | :-- | :-- | :-- |
| Tema Global | Crear el tema de la aplicación con colores, tipografía y estilos. | `lib/core/theme/app_theme.dart` | Completado (base) |
| Componentes Reutilizables | Crear al menos 2 componentes reutilizables. (Ej: `ProductCard` y `CustomButton`) | `lib/core/widgets/` | Completado (base) |
| Diseño de Pantallas | Encargarse de la maquetación y estilos de `SplashScreen`, `HomeScreen`, `CatalogScreen`, `ProductDetailScreen` y `LowStockScreen`. | Pantallas implementadas | Completado (base) |
| Assets | Añadir imágenes propias para los productos y declararlas en `pubspec.yaml`. | `assets/images/`, `pubspec.yaml` | Completado (base) |
| Pulido Visual | Revisar espaciados, estados vacíos, responsividad y detalles visuales. | UI pulida | Completado |


#### 3. Benjamin Alberto Arce Hernadez (Arquitectura / Datos / Navegación)
| Tarea | Descripción | Entregable | Estado |
| :-- | :-- | :-- | :-- |
| Modelo de Datos | Crear el modelo para los productos de la tlapalería. | `lib/models/product.dart` | Completado (base) |
| Datos Locales | Crear una lista fija de productos para simular la base de datos. | `lib/data/local/products_data.dart` | Completado (base) |
| Repositorio | Implementar el repositorio para obtener los productos (Listo para migrar a Firebase en Etapa 2). | `lib/data/repositories/product_repository.dart` | Completado (base) |
| Estado Compartido | Implementar `InventoryProvider` con Provider para seguimiento de inventario/stock. | `lib/features/cart/inventory_provider.dart` | Completado (base) |
| Navegación | Configurar rutas, navegación entre pantallas y paso de argumentos al detalle del producto. | Navegación funcional | Completado (base) |
| Integración | Conectar todos los módulos en `main.dart` utilizando `MultiProvider`. | `lib/main.dart` | Completado (base) |


### Cronograma

| Semana | Actividades | Meta a Cumplir |
| :-- | :-- | :-- |
| **Semana 1** | Definición, bocetos, creación de estructura, modelo de datos, tema global y componentes base. | Arquitectura base, diseño y navegación inicial funcionando. |
| **Semana 2** | Integración de todas las funcionalidades, pruebas, completar documentación (`README` y `AI_LOG`), capturas y preparación de demo. | MVP completamente funcional, compilando, documentado y listo para entrega. |


### Reglas y Flujo de Trabajo

- **Ramas por funcionalidad:** Cada integrante trabajará en su propia rama (Ej: `feature/documentacion`, `feature/ui`, `feature/arquitectura-datos`), para posteriormente hacer un merge a `main`.
- **Commits descriptivos:** Todos los integrantes deberán realizar commits desde sus propias cuentas de GitHub, con mensajes claros y concisos.
- **Funcionalidad completa:** Cada integrante es responsable de programar su parte al completo, esto para poder explicarla en su defensa individual.
- **Uso de IA:** Solo se permitirá el uso para explicación de errores, dudas o fragmentos pequeños. Todo uso deberá ser debidamente documentado en el `AI_LOG.md`.
- **Comunicación:** Reuniones constantes para integrar avances y evitar conflictos al momento de unir el código.
- **Preparación para defensa:** Al finalizar, cada integrante deberá estar capacitado para explicar su código, decisiones técnicas y responder preguntas del docente.


## Requisitos cumplidos (Etapa 1)

**Estado: 10 de 10 completados.**

### 1. Flujo y navegación
- [x] Flujo de entrada (SplashScreen)
- [x] Navegación entre >= 4 pantallas (Splash, Home, Inventario/Catálogo, Detalle, Alertas de stock bajo)

### 2. Catálogo y detalle de producto
- [x] Listado/inventario con búsqueda y filtros por categoría
- [x] Pantalla de detalle que recibe argumentos (productId) y permite gestión de stock

### 3. Estado y tema global
- [x] Estado compartido con Provider (InventoryProvider - seguimiento de inventario/stock)
- [x] Tema global (AppTheme)

### 4. Componentes y assets
- [x] Al menos 2 componentes reutilizables (ProductCard, CustomButton)
- [x] Assets declarados en pubspec.yaml

### 5. Datos y arquitectura
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

## Inicio rápido

```bash
flutter pub get
flutter run
```

## Capturas
Agregar capturas de pantalla de la app funcionando (requisito de entrega). Sugerido:

| Pantalla | Archivo sugerido |
|---|---|
| Splash | `docs/capturas/splash.png` |
| Home | `docs/capturas/home.png` |
| Catálogo (búsqueda/filtro) | `docs/capturas/catalogo.png` |
| Detalle de producto | `docs/capturas/detalle.png` |
| Alertas de stock bajo | `docs/capturas/stock_bajo.png` |

> También se puede adjuntar un video corto o el APK generado por CI (artifact `app-debug-apk`).

## Evidencia Ruta A (Cliente real)
Para cumplir con la rúbrica de Ruta A, documentar en `docs/`:
- Evidencia de al menos 2 reuniones con el cliente (minutas, mensajes o fotos) y requisitos confirmados.
- Cómo la app responde a necesidades reales del cliente (decisiones justificadas).
- Validación con el cliente (prototipo/MVP probado), retroalimentación y plan para atenderla en Etapa 2.

## Decisiones técnicas
- **Provider** para gestión de inventario/stock (`InventoryProvider`, seguimiento de existencias y alertas de stock bajo).
- **Repository pattern**: `ProductRepository` lee de datos locales; en Etapa 2 se reemplaza por fuente remota (Firebase) sin modificar UI.
- **Feature-first**: Organización por funcionalidad para escalabilidad.
- **Componentes reutilizables**: `ProductCard` y `CustomButton` para mantener consistencia visual.
- **Enfoque de gestión**: la app resuelve un problema del cliente (control de inventario) con acciones simples: consulta, búsqueda/filtro, alertas y actualización de stock.

## Backlog para Etapa 2

### Backend y autenticación
- [ ] Integración con Firebase (Autenticación)
- [ ] Persistencia de sesión

### Datos y operaciones
- [ ] Firestore para productos y carrito por usuario
- [ ] CRUD de productos (administrador)
- [ ] Órdenes de compra

### Experiencia de usuario
- [ ] Validaciones de formularios
- [ ] Notificaciones

### Entrega y despliegue
- [ ] Despliegue/compilación de APK firmado

## Fuentes externas
Sin código copiado sin citar. Componentes y estructura propios basados en lo visto en clase (Vivero+).

## CI/CD Pipeline

Este proyecto cuenta con un pipeline de Integración Continua (CI) configurado con **GitHub Actions**.

### Características
- **Análisis estático**: Verificación de formato con `dart format` y análisis con `flutter analyze`
- **Pruebas**: Ejecución automática de tests con `flutter test`
- **Construcción**: Generación de APK en modo debug
- **Artifacts**: Almacenamiento del APK generado para descarga
- **Triggers**: Se ejecuta en pushes a `main`, `develop` o ramas `feature/**`, y en Pull Requests hacia `main` o `develop`

El archivo de configuración se encuentra en: `.github/workflows/flutter_ci.yml`

## IA Log
Ver [AI_LOG.md](AI_LOG.md)

## Contacto

Si tienes alguna pregunta o feedback, ¡no dudes en escribirnos!

### Leyver Aaron Gonzalez Mendoza
- **Correo:** [gonzalezleyver6@gmail.com](mailto:gonzalezleyver6@gmail.com)
- **LinkedIn:** [Leyver Aaron Gonzalez Mendoza](https://www.linkedin.com/in/leyver-aaron-gonzalez-mendoza-7026a73a8/)

### Benjamin Alberto Arce Hernadez 
- **Correo:** [233111887@upmh.edu.mx](mailto:233111887@upmh.edu.mx)

### Zaid Emanuel Hernandez Espinosa
- **Correo:** [233111046@upmh.edu.mx](mailto:233111046@upmh.edu.mx)
