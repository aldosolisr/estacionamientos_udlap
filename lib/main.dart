import 'package:flutter/material.dart';

import 'screens/landing_screen.dart';
import 'services/app_services.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final services = await AppServices.bootstrap();
  runApp(EstacionamientosUdlapApp(services: services));
}

class EstacionamientosUdlapApp extends StatelessWidget {
  const EstacionamientosUdlapApp({super.key, required this.services});

  final AppServices services;

  @override
  Widget build(BuildContext context) {
    return AppServicesScope(
      services: services,
      child: ListenableBuilder(
        listenable: services.preferences,
        builder: (context, _) => MaterialApp(
          title: 'Estacionamientos UDLAP',
          debugShowCheckedModeBanner: false,
          theme: buildAppTheme(),
          darkTheme: buildDarkAppTheme(),
          themeMode: services.preferences.themeMode,
          home: const LandingScreen(),
        ),
      ),
    );
  }
}
