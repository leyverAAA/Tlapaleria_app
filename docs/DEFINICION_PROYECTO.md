# Definición del Proyecto - Tlapalería App (POS)

## Ruta Elegida
**Ruta A: Cliente Real**

Se desarrolla la aplicación para un cliente real (tlapalería/ferretería), con el objetivo de agilizar el registro de ventas en mostrador mediante un punto de venta sencillo.

## Problema
En muchas tlapalerías el registro de ventas se realiza de forma manual (notas, calculadora o memoria), lo que puede provocar errores en el cálculo del total, lentitud al atender clientes y poca claridad sobre los productos vendidos en cada transacción.

## Usuarios
- **Encargado/Vendedor de mostrador**: Consulta productos, arma la venta, ajusta cantidades y registra el cobro (simulado en Etapa 1).
- **Administrador (Etapa 2)**: Gestionará catálogo, historial de ventas y sincronización con Firebase.

## Alcance del MVP (Etapa 1)
- **Flujo de entrada**: Pantalla Splash con identidad de la app.
- **Inicio (POS)**: Pantalla Home con acceso rápido para iniciar/agregar productos a la venta.
- **Catálogo**: Listado de productos con búsqueda y filtrado por categoría.
- **Detalle de producto**: Información del producto; recibe el objeto `Product` por argumentos y permite agregarlo a la venta.
- **Venta/Carrito**: Lista de productos seleccionados, ajuste de cantidades, cálculo de total y acción de “Cobrar (simulado)”.
- **Datos locales**: Productos almacenados localmente (sin base de datos externa).
- **Arquitectura preparada**: Estructura lista para migrar a Firebase en la Etapa 2.

## Requisitos Priorizados
| Prioridad | Requisito | Estado |
| :-- | :-- | :-- |
| **Must** | Catálogo, detalle y venta/carrito con total | Completado (base) |
| **Must** | Navegación entre >= 4 pantallas | Completado |
| **Must** | Manejo de estado con Provider (`CartProvider`) | Completado |
| **Should** | Búsqueda y filtrado por categoría | Completado |
| **Could** | Tema personalizado + componentes reutilizables | Completado |

## Objetivo General
Desarrollar una aplicación móvil en Flutter tipo POS que permita a una tlapalería registrar ventas de forma rápida y sencilla, mejorando la atención al cliente.

## Objetivos Específicos
- Implementar una interfaz intuitiva y fácil de usar en mostrador.
- Mostrar un catálogo de productos con información relevante.
- Permitir agregar, quitar y modificar cantidades en la venta actual.
- Calcular el total y simular el cobro de la venta.
- Aplicar una arquitectura simple y escalable (lógica estilo base Viveroa, Provider, Repository).
- Preparar la aplicación para su futura migración a Firebase.
