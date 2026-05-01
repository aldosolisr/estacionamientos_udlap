import 'package:flutter/material.dart';

import '../data/parking_data.dart';
import '../theme/app_theme.dart';
import 'dashboard_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const _BrandHero(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 480),
                              child: const _UserTypeCard(),
                            ),
                          ),
                        ),
                      ),
                      const _Footer(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BrandHero extends StatelessWidget {
  const _BrandHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.udlapGreen,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppRadii.card),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Estacionamientos',
            style: TextStyle(
              color: AppColors.udlapOrange,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'UDLAP',
            style: TextStyle(
              color: AppColors.udlapOrange,
              fontSize: 72,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  const _UserTypeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: AppShadows.card,
      ),
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '¿Quién eres?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.udlapGreen,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          for (int i = 0; i < kUserTypes.length; i++) ...[
            _UserTypeButton(label: kUserTypes[i]),
            if (i != kUserTypes.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _UserTypeButton extends StatelessWidget {
  const _UserTypeButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => DashboardScreen(userType: label),
          ),
        );
      },
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
      color: AppColors.udlapGreen,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: const Text(
        'Prototipo 1.0 — Aplicación de estacionamientos UDLAP',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
