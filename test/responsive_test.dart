import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tlapaleria_app/core/routes/app_routes.dart';
import 'package:tlapaleria_app/main.dart';

void main() {
  testWidgets(
    'Flujo de venta sin overflow en pantalla angosta y texto grande',
    (tester) async {
      tester.view.physicalSize = const Size(320, 568);
      tester.view.devicePixelRatio = 1.0;
      tester.platformDispatcher.textScaleFactorTestValue = 1.3;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

      await tester.pumpWidget(const MyApp(initialRoute: AppRoutes.home));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      await tester.ensureVisible(find.text('Nueva venta'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Nueva venta'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 250));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      await tester.ensureVisible(find.text('Martillo'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Martillo'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      await tester.tap(find.text('Agregar a la venta'));
      await tester.pump();
      expect(tester.takeException(), isNull);

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      expect(find.text('Venta actual'), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.tap(find.text('Cobrar (simulado)'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      await tester.tap(find.widgetWithText(FilledButton, 'Confirmar'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    },
  );
}
