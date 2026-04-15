import 'package:flutter_test/flutter_test.dart';

import 'package:estacionamientos_udlap/main.dart';

void main() {
  testWidgets('Muestra el prototipo y permite seleccionar tipo de usuario', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Estacionamientos'), findsOneWidget);
    expect(find.text('UDLAP'), findsOneWidget);
    expect(find.text('Alumno'), findsOneWidget);
    expect(find.text('Seleccionaste: Profesores'), findsNothing);

    await tester.tap(find.text('Profesores'));
    await tester.pumpAndSettle();

    expect(find.text('Seleccionaste: Profesores'), findsOneWidget);
  });
}
