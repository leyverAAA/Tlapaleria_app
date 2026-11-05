# Entregables — Etapa 1 (Tlapalería App POS)

## 1) Código y funcionamiento (técnico)
- [x] App compila y ejecuta (`flutter pub get`, `flutter run`).
- [x] `flutter analyze` sin issues / `flutter test` pasa (validado localmente).
- [x] Flujo: Splash → Home/POS → Catálogo (búsqueda/filtros) → Detalle (recibe `Product`) → Venta (total, cobro simulado).
- [x] Estado compartido con `CartProvider` (Provider), tema global, 2+ widgets reutilizables, Model + Repository, arquitectura organizada.
- [x] CI/CD: `.github/workflows/flutter_ci.yml` (formato, analyze, test, APK debug `app-debug-apk`).

## 2) Documentación
- [x] `README.md` (descripción, plan/roles/tareas, requisitos, arquitectura, decisiones, backlog).
- [x] `docs/DEFINICION_PROYECTO.md` (problema, usuarios, MVP, objetivos).
- [x] `docs/BOCETOS.md` (flujo y pantallas).
- [x] `AI_LOG.md` (uso permitido de IA, sin inventar evidencias).

## 3) Capturas / demo (completar con evidencia real)
- [ ] Capturas reales en `docs/capturas/` (`splash.png`, `home.png`, `catalogo.png`, `detalle.png`, `venta.png`). Ver [docs/capturas/README.md](capturas/README.md).
- [ ] (Opcional/recomendado) Video corto del flujo.
- [ ] (Opcional) APK desde CI artifact `app-debug-apk`.

## 4) Ruta A — Cliente real (completar con evidencia real)
- [X] [01_minutas_reuniones.md](evidencia_ruta_a/01_minutas_reuniones.md) — **≥ 2 reuniones** + evidencias (fotos/mensajes/minutas).
- [X] [02_necesidades_y_decisiones.md](evidencia_ruta_a/02_necesidades_y_decisiones.md) — necesidades reales y decisiones justificadas.
- [X] [03_validacion_cliente.md](evidencia_ruta_a/03_validacion_cliente.md) — validación del MVP, retroalimentación y plan Etapa 2.

## 5) Trabajo en equipo / Git (organizacional)
- [X] Commits de los **3 integrantes** desde sus cuentas de GitHub.
- [X] Trabajo por ramas `feature/*` y merges/PRs según el plan del equipo.

