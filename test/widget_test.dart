import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:estacionamientos_udlap/data/parking_data.dart';
import 'package:estacionamientos_udlap/main.dart';
import 'package:estacionamientos_udlap/services/app_services.dart';

Future<EstacionamientosUdlapApp> _buildApp({
  Map<String, Object> initial = const {},
}) async {
  SharedPreferences.setMockInitialValues(initial);
  final services = await AppServices.bootstrap();
  addTearDown(services.dispose);
  return EstacionamientosUdlapApp(services: services);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Landing muestra UDLAP y los 4 tipos de usuario', (tester) async {
    await tester.pumpWidget(await _buildApp());
    await tester.pumpAndSettle();

    expect(find.text('Estacionamientos'), findsWidgets);
    expect(find.text('UDLAP'), findsOneWidget);
    for (final type in kUserTypes) {
      expect(find.text(type), findsOneWidget);
    }
  });

  testWidgets('Tap en tipo de usuario navega al dashboard', (tester) async {
    await tester.pumpWidget(await _buildApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profesores'));
    await tester.pumpAndSettle();

    expect(find.text('Hola, Profesores'), findsOneWidget);
    for (final zone in kParkingZones) {
      expect(find.text(zone.name), findsOneWidget);
    }
  });

  testWidgets('Tap en zona muestra todos sus estacionamientos', (tester) async {
    await tester.pumpWidget(await _buildApp());
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

  testWidgets('Última sesión aparece tras elegir un usuario', (tester) async {
    await tester.pumpWidget(
        await _buildApp(initial: const {'last_user_type': 'Alumno'}));
    await tester.pumpAndSettle();

    expect(find.text('Última sesión'), findsOneWidget);
    expect(find.text('Continuar como Alumno'), findsOneWidget);

    await tester.tap(find.text('Continuar como Alumno'));
    await tester.pumpAndSettle();
    expect(find.text('Hola, Alumno'), findsOneWidget);
  });

  test('Hay 19 estacionamientos en el catálogo con URLs válidas', () {
    expect(kAllParkingLots.length, 19);
    for (final lot in kAllParkingLots) {
      expect(lot.googleMapsUrl, startsWith('https://'));
      expect(lot.baseOccupancyPercent, inInclusiveRange(0, 100));
    }
  });

  test('Las zonas solo referencian estacionamientos del catálogo', () {
    final knownIds = {for (final l in kAllParkingLots) l.id};
    for (final zone in kParkingZones) {
      for (final marker in zone.markers) {
        expect(knownIds.contains(marker.lot.id), isTrue,
            reason: '${marker.lot.code} no está en kAllParkingLots');
        expect(marker.dx, inInclusiveRange(0.0, 1.0));
        expect(marker.dy, inInclusiveRange(0.0, 1.0));
      }
    }
  });
}
