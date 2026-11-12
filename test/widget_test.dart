import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tlapaleria_app/core/routes/app_routes.dart';
import 'package:tlapaleria_app/main.dart';

void main() {
  testWidgets('La app muestra el Splash y navega al Home', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tlapalería App'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Punto de venta'), findsOneWidget);
  });

  testWidgets('Home vacío abre el catálogo', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: AppRoutes.home));
    await tester.pumpAndSettle();

    expect(find.text('No hay venta en curso'), findsOneWidget);

    await tester.tap(find.text('Nueva venta'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pumpAndSettle();

    expect(find.text('Productos'), findsOneWidget);
    expect(find.text('Martillo'), findsOneWidget);
  });

  testWidgets('Carrito vacío lleva al catálogo', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: AppRoutes.home));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.point_of_sale));
    await tester.pumpAndSettle();

    expect(find.text('No hay productos en la venta'), findsOneWidget);

    await tester.tap(find.text('Ver productos'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 250));
    await tester.pumpAndSettle();

    expect(find.text('Productos'), findsOneWidget);
  });
}
