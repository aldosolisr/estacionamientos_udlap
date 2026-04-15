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

class UserTypePrototypePage extends StatelessWidget {
  const UserTypePrototypePage({super.key});

  static const List<String> _userTypes = [
    'Alumno',
    'Profesores',
    'Trabajadores',
    'Visitas',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _LandingHeader(),
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
                      for (var i = 0; i < _userTypes.length; i++) ...[
                        _UserTypeButton(
                          label: _userTypes[i],
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => UserDashboardPage(
                                  userType: _userTypes[i],
                                  currentPage: i + 1,
                                  totalPages: _userTypes.length,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 14),
                      ],
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

class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({
    super.key,
    required this.userType,
    required this.currentPage,
    required this.totalPages,
  });

  final String userType;
  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _UserScreenHeader(
              title: 'Usuario $userType',
              pageCounter: '$currentPage/$totalPages',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 24),
                child: Column(
                  children: [
                    _MapSelectionCard(onBack: () => Navigator.of(context).pop()),
                    const SizedBox(height: 16),
                    const _RecentParkingCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LandingHeader extends StatelessWidget {
  const _LandingHeader();

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

class _UserScreenHeader extends StatelessWidget {
  const _UserScreenHeader({required this.title, required this.pageCounter});

  final String title;
  final String pageCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF005B34),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
      child: Row(
        children: [
          const SizedBox(width: 26),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 46 / 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            pageCounter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _MapSelectionCard extends StatelessWidget {
  const _MapSelectionCard({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton.filled(
              onPressed: onBack,
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFFFF8C25),
                foregroundColor: Colors.white,
                fixedSize: const Size(42, 42),
              ),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          const Text(
            'Mapa de la universidad',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 220,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black26),
            ),
            child: const Text(
              'Mapa pendiente\n(aquí irá tu widget después)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFFF8C25),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: const TextStyle(
                  fontSize: 40 / 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child: const Text('Elegir un Estacionamiento'),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentParkingCard extends StatelessWidget {
  const _RecentParkingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 260),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Estacionamientos Recientes',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 43 / 2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _UserTypeButton extends StatelessWidget {
  const _UserTypeButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

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
