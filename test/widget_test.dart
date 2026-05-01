import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:estacionamientos_udlap/data/parking_data.dart';
import 'package:estacionamientos_udlap/main.dart';

void main() {
  testWidgets('Landing muestra UDLAP y los 4 tipos de usuario', (tester) async {
    await tester.pumpWidget(const EstacionamientosUdlapApp());
    await tester.pumpAndSettle();

    expect(find.text('Estacionamientos'), findsWidgets);
    expect(find.text('UDLAP'), findsOneWidget);
    for (final type in kUserTypes) {
      expect(find.text(type), findsOneWidget);
    }
  });

  testWidgets('Tap en tipo de usuario navega al dashboard', (tester) async {
    await tester.pumpWidget(const EstacionamientosUdlapApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profesores'));
    await tester.pumpAndSettle();

    expect(find.text('Hola, Profesores'), findsOneWidget);
    for (final zone in kParkingZones) {
      expect(find.text(zone.name), findsOneWidget);
    }
  });

  testWidgets('Tap en zona muestra todos sus estacionamientos', (tester) async {
    await tester.pumpWidget(const EstacionamientosUdlapApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Alumno'));
    await tester.pumpAndSettle();

    final zone = kParkingZones.first;
    await tester.tap(find.text(zone.name));
    await tester.pumpAndSettle();

    expect(find.text(zone.name), findsWidgets);

    final scrollable = find.byType(Scrollable).last;
    for (final lot in zone.lots) {
      await tester.scrollUntilVisible(
        find.text(lot.code),
        100,
        scrollable: scrollable,
      );
      expect(find.text(lot.code), findsOneWidget);
    }
  });

  test('Hay 19 estacionamientos en total con URLs no vacías', () {
    final all = kParkingZones.expand((z) => z.lots).toList();
    expect(all.length, 19);
    for (final lot in all) {
      expect(lot.googleMapsUrl, startsWith('https://'));
    }
  });
}
