# Definición del Proyecto - Tlapalería App

## Ruta Elegida
**Ruta A: Cliente Real**

Se ha optado por desarrollar la aplicación para un cliente real (Tlapalería), con el objetivo de digitalizar su catálogo de productos y facilitar la consulta de los mismos.

## Problema
Muchas tlapalerías aún manejan su inventario y catálogo de forma física, lo cual dificulta la consulta rápida de productos, precios y existencias para los clientes. Esto genera pérdida de tiempo tanto para el vendedor como para el comprador.

## Usuarios
- **Clientes**: Personas que desean consultar el catálogo de productos, sus precios y agregar productos a su carrito de compras.
- **Vendedor/Administrador**: Persona encargada de la tlapalería que podrá gestionar el catálogo de productos (Etapa 2).

## Alcance del MVP (Etapa 1)
Para esta primera etapa, el alcance será el siguiente:

- **Flujo de entrada**: Pantalla Splash para dar identidad a la aplicación.
- **Inicio**: Pantalla Home con mensaje de bienvenida.
- **Catálogo**: Listado de productos de la tlapalería con opción de búsqueda y filtrado por categoría.
- **Detalle de producto**: Pantalla con información completa del producto seleccionada, recibiendo el objeto por argumentos.
- **Carrito de compras**: Lista de productos agregados, modificación de cantidades, total a pagar y opción de "Finalizar compra" (simulado).
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
