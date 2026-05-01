import 'package:flutter/material.dart';

import '../data/parking_data.dart';
import '../models/parking_lot.dart';
import '../models/parking_zone.dart';
import '../services/app_services.dart';
import '../theme/app_theme.dart';
import '../utils/url_opener.dart';
import '../widgets/parking_button.dart';
import 'zone_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.userType});

  final String userType;

  @override
  Widget build(BuildContext context) {
    final services = AppServicesScope.of(context);
    return Scaffold(
      backgroundColor: context.pageSurface,
      appBar: AppBar(
        title: Text('Hola, $userType'),
        actions: [
          ListenableBuilder(
            listenable: services.preferences,
            builder: (context, _) {
              final mode = services.preferences.themeMode;
              return IconButton(
                tooltip: _themeTooltip(mode),
                icon: Icon(_themeIcon(mode)),
                onPressed: services.preferences.toggleThemeMode,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const _GreetingCard(),
          const SizedBox(height: 18),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.95,
            children: [
              for (final zone in kParkingZones) _ZoneCard(zone: zone),
            ],
          ),
          const SizedBox(height: 18),
          const _RecentParkingsCard(),
          const SizedBox(height: 18),
          const _UnmappedParkingsCard(),
        ],
      ),
    );
  }

  IconData _themeIcon(ThemeMode mode) => switch (mode) {
        ThemeMode.system => Icons.brightness_auto_outlined,
        ThemeMode.light => Icons.light_mode_outlined,
        ThemeMode.dark => Icons.dark_mode_outlined,
      };

  String _themeTooltip(ThemeMode mode) => switch (mode) {
        ThemeMode.system => 'Tema: sistema (toca para claro)',
        ThemeMode.light => 'Tema: claro (toca para oscuro)',
        ThemeMode.dark => 'Tema: oscuro (toca para sistema)',
      };
}

class _GreetingCard extends StatelessWidget {
  const _GreetingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: context.cardShadow,
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿A dónde quieres ir hoy?',
            style: TextStyle(
              color: context.headingAccent,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Elige una zona del campus para ver sus estacionamientos.',
            style: TextStyle(
              color: context.mutedText,
              fontSize: 14,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _ZoneCard extends StatelessWidget {
  const _ZoneCard({required this.zone});

  final ParkingZone zone;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadii.card);
    return Container(
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: radius,
        boxShadow: context.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: radius,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => ZoneScreen(zone: zone),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Image.asset(
                  zone.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: context.mutedSurface,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: context.mutedText,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            zone.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.headingAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            zone.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.mutedText,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ListenableBuilder(
                          listenable:
                              AppServicesScope.of(context).occupancy,
                          builder: (context, _) {
                            final occupancy =
                                AppServicesScope.of(context).occupancy;
                            final free = zone.lots
                                .where((l) =>
                                    occupancy.snapshotFor(l).level !=
                                    OccupancyLevel.full)
                                .length;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.udlapOrange,
                                borderRadius:
                                    BorderRadius.circular(AppRadii.chip),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.local_parking,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$free libres',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentParkingsCard extends StatelessWidget {
  const _RecentParkingsCard();

  @override
  Widget build(BuildContext context) {
    final services = AppServicesScope.of(context);
    return ListenableBuilder(
      listenable: services.recents,
      builder: (context, _) {
        final lots = services.recents.lots;
        return Container(
          decoration: BoxDecoration(
            color: context.cardSurface,
            borderRadius: BorderRadius.circular(AppRadii.card),
            boxShadow: context.cardShadow,
          ),
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: context.headingAccent,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Estacionamientos recientes',
                      style: TextStyle(
                        color: context.headingAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (lots.isNotEmpty)
                    TextButton(
                      onPressed: services.recents.clear,
                      child: const Text('Borrar'),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (lots.isEmpty)
                Row(
                  children: [
                    Icon(
                      Icons.local_parking_outlined,
                      color: context.mutedText,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Aún no has visitado ninguno.',
                        style: TextStyle(
                          color: context.mutedText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              else
                for (var i = 0; i < lots.length; i++) ...[
                  if (i > 0) const SizedBox(height: 10),
                  ParkingButton(
                    lot: lots[i],
                    onTap: () => _open(context, lots[i]),
                  ),
                ],
            ],
          ),
        );
      },
    );
  }

  Future<void> _open(BuildContext context, ParkingLot lot) async {
    final services = AppServicesScope.of(context);
    await services.recents.push(lot.id);
    if (!context.mounted) return;
    await openExternalUrl(context, lot.googleMapsUrl);
  }
}

class _UnmappedParkingsCard extends StatelessWidget {
  const _UnmappedParkingsCard();

  @override
  Widget build(BuildContext context) {
    final lots = [...kUnmappedParkingLots]
      ..sort((a, b) => a.id.compareTo(b.id));
    if (lots.isEmpty) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: context.cardShadow,
      ),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.place_outlined,
                color: context.headingAccent,
                size: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Otros estacionamientos',
                  style: TextStyle(
                    color: context.headingAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'No están en los mapas de zona pero los puedes abrir en Google Maps.',
            style: TextStyle(
              color: context.mutedText,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < lots.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            ParkingButton(
              lot: lots[i],
              onTap: () => _open(context, lots[i]),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _open(BuildContext context, ParkingLot lot) async {
    final services = AppServicesScope.of(context);
    await services.recents.push(lot.id);
    if (!context.mounted) return;
    await openExternalUrl(context, lot.googleMapsUrl);
  }
}
