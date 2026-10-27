# Tlapalería App - Proyecto Final Flutter (Etapa 1)

## Descripción
Aplicación móvil para catálogo de productos de ferretería/tlapalería. Permite visualizar productos, buscar y filtrar por categoría, ver detalle, agregar al carrito y simular compra. Desarrollada con Flutter siguiendo arquitectura lista para conectar a Firebase en Etapa 2.

## Ruta elegida
- [x] Ruta A: Cliente real
- [ ] Ruta B: Problemática social / Idea propia

## Integrantes
- Integrante 1: Leyver Aaron Gonzalez Mendoza
- Integrante 2: Zaid Emanuel Hernandez Espinosa
- Integrante 3: Benjamin Alberto Arce Hernadez 

## Requisitos cumplidos (Etapa 1)
- [X] Flujo de entrada (SplashScreen)
- [ ] Navegación entre >= 4 pantallas (Splash, Home, Catálogo, Detalle, Carrito)
- [ ] Listado/catálogo con búsqueda y filtros por categoría
- [ ] Pantalla de detalle que recibe argumentos (Product)
- [ ] Estado compartido con Provider (CartProvider)
- [ ] Tema global (AppTheme)
- [ ] Al menos 2 componentes reutilizables (ProductCard, CustomButton)
- [ ] Assets declarados en pubspec.yaml
- [ ] Capa de datos con Model (Product) y Repository (ProductRepository)
- [ ] Arquitectura organizada (core/, features/, models/, data/)

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
Sin código copiado sin citar. Componentes y estructura propios basados en lo visto en clase (Vivero+).

## IA Log
Ver [AI_LOG.md](AI_LOG.md)

##  Contacto

Si tienes alguna pregunta o feedback, ¡no dudes en escribirme!

### Leyver Aaron Gonzalez Mendoza
- **Correo:** [gonzalezleyver6@gmail.com](mailto:gonzalezleyver6@gmail.com)
- **LinkedIn:** [Leyver Aaron Gonzalez Mendoza](https://www.linkedin.com/in/leyver-aaron-gonzalez-mendoza-7026a73a8/)
### Benjamin Alberto Arce Hernadez 
- **Correo:** [233111887@upmh.edu.mx](mailto:233111887@upmh.edu.mx)
### Zaid Emanuel Hernandez Espinosa
- **Correo:** [233111046@upmh.edu.mx](mailto:233111046@upmh.edu.mx)