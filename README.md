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
Aplicación móvil tipo **POS (Punto de Venta)** para una tlapalería/ferretería. Ayuda al vendedor a **armar y cobrar una venta de mostrador** de forma sencilla: consultar productos, buscar/filtrar, ver detalle, agregar artículos a la venta en curso, ajustar cantidades, calcular el total y registrar un **cobro simulado** (sin persistencia en Etapa 1). Desarrollada con Flutter usando una lógica simple (estilo base Viveroa) y arquitectura lista para conectar a Firebase en Etapa 2.

## Documentación
- [Definición del proyecto](docs/DEFINICION_PROYECTO.md) — problema, usuarios, alcance MVP, objetivos y requisitos priorizados.
- [Bocetos / Wireframes](docs/BOCETOS.md) — flujo de navegación, reglas y descripción de pantallas.
- [Checklist de entregables Etapa 1](docs/ENTREGABLES_ETAPA1.md) — estado de entrega, capturas y Ruta A.
- [Bitácora de IA](AI_LOG.md) — registro de usos permitidos de inteligencia artificial.


## Ruta elegida
- [x] Ruta A: Cliente real
- [ ] Ruta B: Problemática social / Idea propia

## Integrantes
- Integrante 1: Leyver Aaron Gonzalez Mendoza
- Integrante 2: Zaid Emanuel Hernandez Espinosa
- Integrante 3: Benjamin Alberto Arce Hernandez

## Plan de Trabajo, Roles y Tareas

### Roles Asignados

| Rol | Integrante | Responsabilidades |
| :-- | :-- | :-- |
| **Coordinación / Git / Documentación** | Leyver Aaron Gonzalez Mendoza | Organización de reuniones, manejo de ramas y Pull Requests, revisión de commits, mantenimiento del `README.md`, `AI_LOG.md` y bitácora del equipo. |
| **UI/UX / Diseño** | Zaid Emanuel Hernandez Espinosa | Diseño de interfaces, tema global, componentes reutilizables, assets propios y asegurar la coherencia visual de la aplicación. |
| **Arquitectura / Datos / Navegación** | Benjamin Alberto Arce Hernandez | Estructura del proyecto, modelos, repositorios, navegación entre pantallas, estado compartido con Provider e integración general. | 



### División de Tareas por Integrante

#### 1. Leyver Aaron Gonzalez Mendoza (Coordinación / Git / Documentación)
| Tarea | Descripción | Entregable | Estado |
| :-- | :-- | :-- | :-- |
| Definición del proyecto | Plasmar el problema, usuarios, alcance del MVP y justificación de la ruta elegida. | [docs/DEFINICION_PROYECTO.md](docs/DEFINICION_PROYECTO.md) | Completado |
| Bocetos y Wireframes | Realizar bocetos de todas las pantallas a implementar. | [docs/BOCETOS.md](docs/BOCETOS.md) | Completado |
| Gestión de GitHub | Crear y administrar el repositorio, ramas por funcionalidad y asegurar commits de los 3 integrantes. | Repositorio + CI configurado | Completado |
| Documentación | Mantener y actualizar el `README.md` con toda la información requerida. | `README.md` | Completado |
| Busqueda y filtros | Creacion del buscador con filtros por categorias. | parte de `\lib\features\catalog\catalog_screen.dart`  | Completado |
| Bitácora de IA | Documentar todos los usos de IA permitidos en la rúbrica. | [AI_LOG.md](AI_LOG.md) | Completado |


#### 2. Zaid Emanuel Hernandez Espinosa (UI/UX / Diseño)
| Tarea | Descripción | Entregable | Estado |
| :-- | :-- | :-- | :-- |
| Tema Global | Crear el tema de la aplicación con colores, tipografía y estilos. | `lib/core/theme/app_theme.dart` | Completado (base) |
| Componentes Reutilizables | Crear al menos 2 componentes reutilizables. (Ej: `ProductCard` y `CustomButton`) | `lib/core/widgets/` | Completado (base) |
| Diseño de Pantallas | Encargarse de la maquetación y estilos de `SplashScreen`, `HomeScreen`, `CatalogScreen`, `ProductDetailScreen` y `CartScreen` (venta). | Pantallas implementadas | Completado (base) |
| Assets | Añadir imágenes propias para los productos y declararlas en `pubspec.yaml`. | `assets/images/`, `pubspec.yaml` | Completado (base) |
| Pulido Visual | Revisar espaciados, estados vacíos, responsividad y detalles visuales. | UI pulida | Completado |


#### 3. Benjamin Alberto Arce Hernandez (Arquitectura / Datos / Navegación)
| Tarea | Descripción | Entregable | Estado |
| :-- | :-- | :-- | :-- |
| Modelo de Datos | Crear el modelo para los productos de la tlapalería. | `lib/models/product.dart` | Completado (base) |
| Datos Locales | Crear una lista fija de productos para simular la base de datos. | `lib/data/local/products_data.dart` | Completado (base) |
| Repositorio | Implementar el repositorio para obtener los productos (Listo para migrar a Firebase en Etapa 2). | `lib/data/repositories/product_repository.dart` | Completado (base) |
| Estado Compartido | Implementar `CartProvider` con Provider para la venta actual (productos, cantidades y total). | `lib/features/cart/cart_provider.dart` | Completado (base) |
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

> **Fuera de alcance Etapa 1:** historial persistente, inventario/stock, autenticación y cobro real. El cobro es simulado y no guarda la venta. Ver [Definición del proyecto](docs/DEFINICION_PROYECTO.md).

### 1. Flujo y navegación
- [x] Flujo de entrada (SplashScreen)
- [x] Navegación entre 5 pantallas (Splash, Home/Tablero POS, Catálogo, Detalle, Venta/Carrito) + pestaña Perfil (Acerca de)
- [x] Confirmación de cobro y retorno a Home con la venta limpia
- [x] Carrito accesible desde Home, Catálogo y Detalle

### 2. Catálogo y detalle de producto
- [x] Listado/catálogo con búsqueda y filtros por categoría
- [x] Pantalla de detalle que recibe argumentos (`Product`)
- [x] Estados vacíos con acción (limpiar filtros / ver productos)

### 3. Estado y tema global
- [x] Estado compartido con Provider (`CartProvider` - venta actual: items, cantidades y total)
- [x] Tema global (AppTheme) con contraste accesible para textos y precios

### 4. Componentes y assets
- [x] Al menos 2 componentes reutilizables (ProductCard, CustomButton, CartActionButton)
- [x] Assets declarados en pubspec.yaml

### 5. Datos y arquitectura
- [x] Capa de datos con Model (Product) y Repository (ProductRepository)
- [x] Arquitectura organizada (core/, features/, models/, data/)


## Arquitectura
```
lib/
├── core/
│   ├── routes/     # Navegación centralizada (AppRoutes, onGenerateRoute, onUnknownRoute)
│   ├── theme/      # Tema global, paleta, tipografía y tokens de diseño
│   ├── utils/      # Formato de precios y lenguaje visual por categoría
│   └── widgets/    # BrandHeader, ProductCard, CategoryCircle, EmptyState, QuantityStepper, etc.
├── data/           # Datos locales y repositorios
├── features/
│   ├── shell/      # AppShell + NavigationController (bottom navigation persistente)
│   ├── splash/     # Pantalla de bienvenida
│   ├── home/       # Tablero POS
│   ├── catalog/    # Búsqueda, filtros y cuadrícula de productos
│   ├── product_detail/
│   ├── cart/       # Venta actual
│   └── profile/    # Acerca de la app
├── models/         # Modelos de datos
└── main.dart       # Configuración de Provider, tema y rutas
```

## Flujo de navegación

```text
Splash → AppShell (Inicio · Catálogo · Venta · Perfil) → Detalle → confirmación → Inicio
```

- **Inicio:** tablero con acciones rápidas, venta vacía o venta en curso.
- **Catálogo:** búsqueda, filtros circulares por categoría y cuadrícula de productos.
- **Venta actual:** items, cantidades, total y cobro simulado; accesible también desde el icono con contador de Inicio, Catálogo y Detalle.
- **Detalle:** se abre como ruta independiente y conserva el estado del catálogo al volver.
- **Cobro:** pide confirmación; solo entonces limpia la venta y vuelve a Inicio.
- **Acciones destructivas:** “Nueva venta” con productos y “Vaciar venta” piden confirmación.
- **Atrás:** desde una pestaña distinta regresa a Inicio; en Inicio respeta el historial del sistema.


## Tecnologías
- Flutter 3.x
- Dart
- provider: ^6.1.5+1
- Fuentes Outfit + Inter empaquetadas en `assets/fonts`

## Inicio rápido

```bash
flutter pub get
flutter run
```

## Capturas
Las capturas de referencia están en [`docs/capturas/`](docs/capturas/). Para la entrega, usa la guía [`docs/capturas/README.md`](docs/capturas/README.md) y renombra/reemplaza los archivos con capturas reales de la app funcionando.

| Pantalla | Archivo sugerido |
|---|---|
| Splash | `docs/capturas/splash.png` |
| Home / POS (venta vacía o en curso) | `docs/capturas/home.png` |
| Catálogo (búsqueda/filtro) | `docs/capturas/catalogo.png` |
| Detalle de producto | `docs/capturas/detalle.png` |
| Venta / Carrito (ticket y total) | `docs/capturas/venta.png` |
| Confirmación de cobro (opcional) | `docs/capturas/cobro.png` |

> También se puede adjuntar un video corto o el APK generado por CI (artifact `app-debug-apk`).


## Evidencia Ruta A (Cliente real)
Completar con **evidencia real** (no inventar datos). Plantillas listas en `docs/evidencia_ruta_a/`:
- [01_minutas_reuniones.md](docs/evidencia_ruta_a/01_minutas_reuniones.md) — ≥ 2 reuniones, requisitos confirmados y evidencias.
- [02_necesidades_y_decisiones.md](docs/evidencia_ruta_a/02_necesidades_y_decisiones.md) — necesidades reales y decisiones justificadas.
- [03_validacion_cliente.md](docs/evidencia_ruta_a/03_validacion_cliente.md) — validación del MVP, retroalimentación y plan Etapa 2.


## Decisiones técnicas
- **Provider** para el estado de la venta (`CartProvider`: items, cantidades y total), con lógica simple estilo base Viveroa.
- **Navegación centralizada**: `AppRoutes` con rutas con nombre; `AppShell` + `NavigationController` gestionan las pestañas persistentes; `onGenerateRoute` pasa el `Product` al detalle, `onUnknownRoute` cubre rutas inválidas y `onGenerateInitialRoutes` habilita pruebas.
- **Una sola venta en curso**: si hay productos, iniciar una nueva venta o vaciar pide confirmación. El cobro solo limpia la venta después de confirmar.
- **Navegación consistente**: la venta se accede desde la pestaña Venta, el icono con contador de Inicio/Catálogo/Detalle y las acciones rápidas del tablero.
- **Sistema visual de marca**: paleta carbón + naranja, tipografías Outfit/Inter, encabezado con diagonales y componentes reutilizables (`BrandHeader`, `ProductCard`, `CategoryCircle`, `EmptyState`, `QuantityStepper`). El naranja vibrante queda como acento y `#C2410C` para texto AA.
- **Compra rápida**: el botón circular de cada tarjeta agrega directo a la venta con aviso y acceso al carrito; tocar la tarjeta abre el detalle.
- **Imágenes por categoría**: `ProductImageTile` ilustra cada producto según su categoría y queda listo para recibir fotografía real.
- **Repository pattern**: `ProductRepository` lee de datos locales; en Etapa 2 se reemplaza por fuente remota (Firebase) sin modificar UI.
- **Feature-first**: Organización por funcionalidad para escalabilidad.
- **Componentes reutilizables**: `BrandHeader`, `ProductCard`, `CategoryCircle`, `SectionHeader`, `EmptyState`, `QuantityStepper`, `CustomButton` y `CartActionButton`.
- **Accesibilidad de color**: `#C2410C` como naranja principal para textos y superficies con texto (contraste AA con blanco); `#FF8A00` queda como acento decorativo.
- **Enfoque POS**: ayuda al vendedor a armar y cobrar ventas rápidas (consulta → agregar → total → cobro simulado). En Etapa 1 no se persiste el historial.

## Backlog para Etapa 2

### Backend y autenticación
- [ ] Integración con Firebase (Autenticación)
- [ ] Persistencia de sesión

### Datos y operaciones
- [ ] Firestore para productos y ventas por usuario
- [ ] CRUD de productos (administrador)
- [ ] Historial de ventas / tickets (órdenes)

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

### Benjamin Alberto Arce Hernandez
- **Correo:** [233111887@upmh.edu.mx](mailto:233111887@upmh.edu.mx)

### Zaid Emanuel Hernandez Espinosa
- **Correo:** [233111046@upmh.edu.mx](mailto:233111046@upmh.edu.mx)
