# Definición del Proyecto - Tlapalería App

## Ruta Elegida
**Ruta A: Cliente Real**

Se ha optado por desarrollar la aplicación para un cliente real (Tlapalería), con el objetivo de digitalizar su catálogo de productos y facilitar la consulta de los mismos.

## Problema
Muchas tlapalerías manejan su inventario de forma manual (cuadernos, hojas o memoria), lo que dificulta conocer existencias reales, detectar productos con stock bajo y registrar entradas/salidas de forma rápida. Esto provoca faltantes, compras tardías y desorganización en la gestión diaria.

## Usuarios
- **Encargado/Vendedor de la tlapalería**: Consulta el inventario, revisa existencias, identifica productos con stock bajo y actualiza cantidades.
- **Administrador (Etapa 2)**: Gestionará catálogo, usuarios y sincronización con Firebase.

## Alcance del MVP (Etapa 1)
Para esta primera etapa, el alcance será el siguiente:

- **Flujo de entrada**: Pantalla Splash para dar identidad a la aplicación.
- **Inicio/Panel**: Pantalla Home con resumen de gestión y alertas de stock bajo.
- **Inventario/Catálogo**: Listado de productos con búsqueda y filtrado por categoría, mostrando existencias.
- **Detalle de producto**: Pantalla con información y acciones para ajustar stock (recibe argumentos).
- **Alertas de stock bajo**: Pantalla con productos que requieren reabastecimiento.
- **Datos locales**: Todos los productos estarán almacenados localmente, sin conexión a base de datos externa.
- **Arquitectura preparada**: Estructura lista para migrar a Firebase en la Etapa 2.

## Requisitos Priorizados
| Prioridad | Requisito | Estado |
| :-- | :-- | :-- |
| **Must** | Catálogo de productos, detalle y carrito | Pendiente |
| **Must** | Navegación entre pantallas | Pendiente |
| **Must** | Manejo de estado con Provider | Pendiente |
| **Should** | Búsqueda y filtrado por categoría | Pendiente |
| **Could** | Diseño de tema personalizado | Pendiente |

## Objetivo General
Desarrollar una aplicación móvil en Flutter que permita digitalizar el catálogo de productos de una tlapalería, brindando una experiencia ágil y sencilla para la consulta y simulación de compra de productos.

## Objetivos Específicos
- Implementar una interfaz intuitiva y fácil de usar.
- Mostrar el catálogo de productos con su información relevante.
- Permitir agregar, quitar y modificar productos del carrito de compras.
- Aplicar una arquitectura escalable y organizada.
- Preparar la aplicación para su futura migración a Firebase.
