# Definición del Proyecto - Tlapalería App (POS)

## Ruta Elegida
**Ruta A: Cliente Real**

Se desarrolla la aplicación para un cliente real (tlapalería/ferretería), con el objetivo de agilizar el armado y cobro de ventas en mostrador mediante un punto de venta sencillo.

## Problema

En una tlapalería de mostrador, el vendedor arma la venta mientras atiende al cliente. Anotar productos y calcular el total con calculadora o de memoria provoca errores de suma, retrasos y poca claridad de lo que se cobró.

La app debe permitir encontrar productos rápido, agregarlos a una venta en curso, ajustar cantidades y cobrar con un total calculado automáticamente.

> **Alcance importante:** en Etapa 1 el cobro es **simulado** y la venta **no se persiste**. El historial de ventas, el inventario y la sincronización con Firebase se abordan en Etapa 2.

## Usuarios

- **Vendedor/encargado de mostrador (usuario principal):** consulta productos, arma la venta, ajusta cantidades y registra el cobro simulado.
- **Administrador (Etapa 2):** gestionará catálogo, historial de ventas y sincronización con Firebase.

## Alcance del MVP (Etapa 1)

- **Flujo de entrada:** pantalla Splash con identidad de la app.
- **Home / Tablero POS:** distingue entre venta vacía y venta en curso; permite iniciar una venta nueva o continuar la actual. Si ya hay productos, “Nueva venta” pide confirmación antes de vaciar.
- **Catálogo:** listado de productos con búsqueda por nombre, filtros por categoría y estado vacío con opción para limpiar filtros.
- **Detalle de producto:** recibe el objeto `Product` por argumentos, muestra la información, permite agregarlo a la venta y da acceso al carrito.
- **Venta actual:** lista de productos seleccionados, ajuste de cantidades, eliminación por producto, opción de vaciar con confirmación, cálculo de total y acción de “Cobrar (simulado)”.
- **Confirmación de cobro:** diálogo con el total y la cantidad de artículos. Al confirmar se limpia la venta y se vuelve a Home con un aviso de venta cobrada.
- **Datos locales:** productos almacenados localmente, sin base de datos externa.
- **Arquitectura preparada:** estructura lista para migrar a Firebase en Etapa 2.

## Fuera de alcance (Etapa 1)

- Persistencia e historial de ventas o tickets.
- Inventario y control de stock.
- Autenticación y sesión de usuario.
- CRUD de productos para administrador.
- Cobro real, métodos de pago y cálculo de cambio.
- Sincronización con Firebase.

## Requisitos Priorizados

| Prioridad | Requisito | Estado |
| :-- | :-- | :-- |
| **Must** | Catálogo, detalle y venta actual con total | Completado |
| **Must** | Navegación entre 5 pantallas + confirmación de cobro | Completado |
| **Must** | Manejo de estado con Provider (`CartProvider`) | Completado |
| **Must** | Cobro simulado con confirmación y retorno a Home | Completado |
| **Should** | Búsqueda, filtros por categoría y estados vacíos con acción | Completado |
| **Should** | Navegación consistente al carrito desde Home, Catálogo y Detalle | Completado |
| **Could** | Tema personalizado, componentes reutilizables y accesibilidad de contraste | Completado |

## Objetivo General

Desarrollar una aplicación móvil en Flutter tipo POS que permita a una tlapalería armar y cobrar una venta de mostrador de forma rápida y sencilla, mejorando la atención al cliente.

## Objetivos Específicos

- Implementar una interfaz intuitiva y fácil de usar en mostrador.
- Mostrar un catálogo de productos con información relevante.
- Permitir agregar, quitar y modificar cantidades en la venta actual.
- Calcular el total automáticamente y simular el cobro de la venta.
- Mantener un flujo de navegación claro, sin callejones sin salida.
- Aplicar una arquitectura simple y escalable (Provider, Repository, feature-first).
- Preparar la aplicación para su futura migración a Firebase.

## Criterios de Éxito (Etapa 1)

- El vendedor puede iniciar una venta, agregar productos, ajustar cantidades y cobrar sin usar calculadora.
- El total se actualiza automáticamente y coincide con los artículos de la venta.
- El flujo no pierde la venta en curso por un retroceso o un toque accidental.
- El carrito siempre está a un toque desde las pantallas principales.
- Los estados vacíos explican qué hacer a continuación.
- `flutter analyze` y `flutter test` pasan sin errores.
