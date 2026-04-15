import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estacionamientos UDLAP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD9D9D9),
        useMaterial3: true,
      ),
      home: const UserTypePrototypePage(),
    );
  }
}

class UserTypePrototypePage extends StatefulWidget {
  const UserTypePrototypePage({super.key});

  @override
  State<UserTypePrototypePage> createState() => _UserTypePrototypePageState();
}

class _UserTypePrototypePageState extends State<UserTypePrototypePage> {
  static const Color _udlapGreen = Color(0xFF005B34);
  static const Color _udlapOrange = Color(0xFFFF8C25);

  static const List<String> _userTypes = [
    'Alumno',
    'Profesores',
    'Trabajadores',
    'Visitas',
  ];

  String? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 22,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final userType in _userTypes) ...[
                        _UserTypeButton(
                          label: userType,
                          selected: _selectedUserType == userType,
                          onPressed: () {
                            setState(() {
                              _selectedUserType = userType;
                            });
                          },
                        ),
                        const SizedBox(height: 14),
                      ],
                      if (_selectedUserType != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Seleccionaste: $_selectedUserType',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: _udlapGreen,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  static const Color _udlapGreen = Color(0xFF005B34);
  static const Color _udlapOrange = Color(0xFFFF8C25);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _udlapGreen,
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Estacionamientos',
            style: TextStyle(
              color: _udlapOrange,
              fontSize: 42,
              height: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'UDLAP',
            style: TextStyle(
              color: _udlapOrange,
              fontSize: 90,
              height: 1,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _UserTypeButton extends StatelessWidget {
  const _UserTypeButton({
    required this.label,
    required this.onPressed,
    required this.selected,
  });

  final String label;
  final VoidCallback onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor: const Color(0xFFFF8C25),
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(64),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        textStyle: const TextStyle(
          fontSize: 46 / 2,
          fontWeight: FontWeight.w500,
        ),
      ).copyWith(
        side: WidgetStatePropertyAll(
          BorderSide(
            color: selected ? const Color(0xFF005B34) : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Text(label),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF005B34),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: const Text(
        'Prototipo 1.0 de la aplicación de estacionamientos\n de la UDLAP',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
