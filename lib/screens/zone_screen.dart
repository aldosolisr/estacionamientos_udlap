import 'package:flutter/material.dart';

import '../models/parking_lot.dart';
import '../models/parking_zone.dart';
import '../theme/app_theme.dart';
import '../utils/url_opener.dart';
import '../widgets/parking_button.dart';

class ZoneScreen extends StatelessWidget {
  const ZoneScreen({super.key, required this.zone});

  final ParkingZone zone;

  @override
  Widget build(BuildContext context) {
    final lots = zone.lots;

    return Scaffold(
      appBar: AppBar(title: Text(zone.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _HeaderCard(zone: zone),
          const SizedBox(height: 16),
          const Text(
            'Estacionamientos disponibles',
            style: TextStyle(
              color: AppColors.udlapGreen,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < lots.length; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            ParkingButton(
              lot: lots[i],
              onTap: () => _openLot(context, lots[i]),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _openLot(BuildContext context, ParkingLot lot) async {
    await openExternalUrl(context, lot.googleMapsUrl);
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.zone});

  final ParkingZone zone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            zone.subtitle,
            style: const TextStyle(
              color: AppColors.onSurfaceMuted,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadii.chip),
              border: Border.all(color: Colors.black12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.chip),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  zone.imageAsset,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                size: 16,
                color: AppColors.onSurfaceMuted,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Toca un estacionamiento para abrirlo en Google Maps.',
                  style: const TextStyle(
                    color: AppColors.onSurfaceMuted,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
