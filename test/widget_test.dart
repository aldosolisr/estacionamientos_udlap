import 'package:flutter_test/flutter_test.dart';

import 'package:estacionamientos_udlap/main.dart';

void main() {
  testWidgets('Muestra selector de tipo de usuario y permite elegir opción', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Selecciona tu tipo de usuario'), findsOneWidget);
    expect(find.text('Tipo de usuario'), findsOneWidget);
    expect(find.text('Tipo seleccionado: Profesores'), findsNothing);

    await tester.tap(find.text('Elige una opción'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profesores').last);
    await tester.pumpAndSettle();

    expect(find.text('Tipo seleccionado: Profesores'), findsOneWidget);
  });
}
