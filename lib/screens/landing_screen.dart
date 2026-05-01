import 'package:flutter/material.dart';

import '../data/parking_data.dart';
import '../services/app_services.dart';
import '../theme/app_theme.dart';
import 'dashboard_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  Future<void> _selectUser(BuildContext context, String userType) async {
    final services = AppServicesScope.of(context);
    await services.preferences.setLastUserType(userType);
    if (!context.mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => DashboardScreen(userType: userType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final services = AppServicesScope.of(context);
    return Scaffold(
      backgroundColor: context.pageSurface,
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
                          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 480),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListenableBuilder(
                                    listenable: services.preferences,
                                    builder: (context, _) {
                                      final last =
                                          services.preferences.lastUserType;
                                      if (last == null ||
                                          !kUserTypes.contains(last)) {
                                        return const SizedBox.shrink();
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 14),
                                        child: _ContinueAsCard(
                                          userType: last,
                                          onContinue: () =>
                                              _selectUser(context, last),
                                          onChange: () => services.preferences
                                              .clearLastUserType(),
                                        ),
                                      );
                                    },
                                  ),
                                  _UserTypeCard(
                                    onSelect: (type) =>
                                        _selectUser(context, type),
                                  ),
                                ],
                              ),
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
      decoration: BoxDecoration(
        color: context.isDark
            ? AppColors.udlapGreenDark
            : AppColors.udlapGreen,
        borderRadius: const BorderRadius.vertical(
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

class _ContinueAsCard extends StatelessWidget {
  const _ContinueAsCard({
    required this.userType,
    required this.onContinue,
    required this.onChange,
  });

  final String userType;
  final VoidCallback onContinue;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: context.cardShadow,
        border: Border.all(color: AppColors.udlapOrange, width: 2),
      ),
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                color: AppColors.udlapOrange,
                size: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Última sesión',
                  style: TextStyle(
                    color: context.mutedText,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              TextButton(
                onPressed: onChange,
                child: const Text('Cambiar'),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              userType,
              style: TextStyle(
                color: context.headingAccent,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: onContinue,
            icon: const Icon(Icons.login_outlined),
            label: Text('Continuar como $userType'),
          ),
        ],
      ),
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  const _UserTypeCard({required this.onSelect});

  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: context.cardShadow,
      ),
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '¿Quién eres?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.headingAccent,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 18),
          for (int i = 0; i < kUserTypes.length; i++) ...[
            ElevatedButton(
              onPressed: () => onSelect(kUserTypes[i]),
              child: Text(kUserTypes[i]),
            ),
            if (i != kUserTypes.length - 1) const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.isDark ? AppColors.udlapGreenDark : AppColors.udlapGreen,
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
