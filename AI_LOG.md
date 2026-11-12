# Bitácora de Uso de Inteligencia Artificial (AI_LOG.md)

## Regla
Solo se documenta uso permitido: explicación de conceptos/errores, sugerencias, revisión de código propio, o fragmentos pequeños (< 20 líneas) adaptados y entendidos por el equipo.

**NO PERMITIDO:** Generar pantallas, módulos, funciones completas, arquitectura, README, investigación, evidencias de reuniones/validación o inventar datos.

## Registro de Uso

| Fecha | Integrante | Consulta / Uso | Tipo de uso | Justificación | Resultado / Adaptación | ¿Entendido por el equipo? |
|---|---|---|---|---|---|---|
| 2026-10-26 | Leyver Aaron Gonzalez Mendoza | Consulta de la estructura base y recomendaciones  | Sugerencia / Estructura | Acelerar el scaffolding siguiendo la arquitectura vista en clase (Vivero+) | Se adaptó la estructura feature-first propuesta, revisando cada archivo y entendiendo su funcionalidad. | Sí |
| 2026-10-26 | Equipo | Revisión de sintaxis Dart/Flutter y corrección de errores | Revisión | Validar código propio sin generar módulos completos | Se aplicaron correcciones menores de forma manual tras entenderlas. | Sí |
| 2026-11-04 | Leyver Aaron Gonzalez Mendoza | Mejora del diseño del HomeScreen con UI/UX Pro Max | Sugerencia de diseño | Buscar paleta de colores adecuada para una tlapalería/ferretería | Se adaptaron los colores sugeridos (#15803D) al tema de la app, manteniendo el diseño simple y fiel al ejemplo. | Sí |
| 2026-11-04 | Leyver Aaron Gonzalez Mendoza | Creación de SplashScreen | Sugerencia/Fragmento | Implementar pantalla de entrada siguiendo las buenas prácticas | Se creó el SplashScreen con diseño minimalista, adaptado a las necesidades del proyecto. | Sí |
| 2026-11-05 | Equipo | Implementación de funcionalidades faltantes (catálogo, detalle, carrito, Provider, modelo/repositorio) | Sugerencia/Estructura | Completar requisitos técnicos de la Etapa 1 siguiendo patrón simple visto en clase | Se implementó arquitectura feature-first, se revisó y adaptó el código para mantenerlo simple y funcional. | Sí |
| 2026-11-05 | Equipo | Ajuste de la app a POS (Punto de Venta) usando lógica simple estilo base Viveroa | Sugerencia/Estructura | Adaptar el producto para resolver registro de ventas del cliente manteniendo requisitos de rúbrica | Se reemplazó la gestión de inventario por flujo POS (`CartProvider`, venta actual, total/cobro simulado); se revisó y validó con `flutter analyze`/formato. | Sí |
| 2026-11-05 | Equipo | Refinamiento de estructura y lógica de navegación | Sugerencia/Estructura | Hacer el flujo POS más claro y mantenible sin perder simplicidad | Se centralizó navegación en `AppRoutes` (rutas con nombre + `onGenerateRoute` para argumentos), se reutilizó `CartActionButton` y se ajustó el retorno tras cobro; validado con `flutter analyze`. | Sí |
| 2026-11-05 | Equipo | Preparación de estructura de entregables Etapa 1 | Sugerencia/Revisión documental | Facilitar la entrega con checklist y plantillas sin inventar evidencia | Se crearon `docs/ENTREGABLES_ETAPA1.md`, guía de capturas y plantillas Ruta A (minutas, necesidades/decisiones, validación) claramente marcadas para completar con **evidencia real**. | Sí |
| 2026-11-05 | Equipo | Revisión y ajuste de navegación, estados vacíos y accesibilidad de la Etapa 1 | Revisión / Ajuste | Alinear el flujo POS con el alcance real (cobro simulado) y eliminar callejones sin salida | Se ajustaron Home, catálogo, detalle, carrito, rutas, tema y pruebas; validado con `flutter analyze` y `flutter test`. El equipo debe revisar y adaptar los cambios. | Pendiente de validación por el equipo |

## Notas
- Todo el código generado con apoyo de IA ha sido revisado, adaptado y puede ser explicado por cualquier integrante del equipo.
- No se ha generado documentación, investigación o evidencias completas con IA.
- Se prioriza el entendimiento y aprendizaje por encima de la generación automática.
- Cada uso ha sido justificado y documentado conforme a lo establecido en la rúbrica.
