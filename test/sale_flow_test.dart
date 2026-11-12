import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tlapaleria_app/core/routes/app_routes.dart';
import 'package:tlapaleria_app/main.dart';

void main() {
  testWidgets('Flujo de venta: catálogo, detalle, carrito y cobro', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp(initialRoute: AppRoutes.home));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Nueva venta'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pumpAndSettle();

    expect(find.text('Martillo'), findsOneWidget);

    await tester.tap(find.text('Martillo'));
    await tester.pumpAndSettle();

    expect(find.text('Detalle de producto'), findsOneWidget);

    await tester.tap(find.text('Agregar a la venta'));
    await tester.pump();

    expect(find.text('Producto agregado a la venta'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('Venta actual'), findsOneWidget);
    expect(find.text('Martillo'), findsOneWidget);
    expect(find.text('\$85.00'), findsWidgets);

    await tester.tap(find.text('Cobrar (simulado)'));
    await tester.pumpAndSettle();

    expect(find.text('Confirmar cobro'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Confirmar'));
    await tester.pumpAndSettle();

    expect(find.text('Punto de venta'), findsOneWidget);
    expect(find.text('No hay venta en curso'), findsOneWidget);
    expect(find.textContaining('Venta cobrada (simulada)'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
