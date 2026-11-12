import 'package:flutter_test/flutter_test.dart';

import 'package:tlapaleria_app/core/routes/app_routes.dart';
import 'package:tlapaleria_app/main.dart';

void main() {
  testWidgets('Las pestañas del shell cambian de sección', (tester) async {
    await tester.pumpWidget(const MyApp(initialRoute: AppRoutes.home));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Catálogo'));
    await tester.pumpAndSettle();
    expect(find.text('Productos'), findsOneWidget);
    expect(find.text('Buscar producto...'), findsOneWidget);

    await tester.tap(find.text('Venta'));
    await tester.pumpAndSettle();
    expect(find.text('Venta actual'), findsOneWidget);

    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();
    expect(find.text('Acerca de'), findsOneWidget);

    await tester.tap(find.text('Inicio'));
    await tester.pumpAndSettle();
    expect(find.text('Punto de venta'), findsOneWidget);
  });

  testWidgets('El botón + de la tarjeta agrega directo a la venta', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp(initialRoute: AppRoutes.catalog));
    await tester.pumpAndSettle();

    final addButton = find.byTooltip('Agregar Martillo a la venta');
    await tester.ensureVisible(addButton);
    await tester.pumpAndSettle();
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    expect(find.text('Martillo agregado a la venta'), findsOneWidget);

    await tester.tap(find.text('Ver venta'));
    await tester.pumpAndSettle();

    expect(find.text('Venta actual'), findsOneWidget);
    expect(find.text('Martillo'), findsOneWidget);
  });
}
