import 'package:flutter/material.dart';

import 'screens/landing_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EstacionamientosUdlapApp());
}

class EstacionamientosUdlapApp extends StatelessWidget {
  const EstacionamientosUdlapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estacionamientos UDLAP',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const LandingScreen(),
    );
  }
}
