import 'package:flutter/material.dart';

import '../models/parking_lot.dart';
import '../models/parking_zone.dart';
import '../services/app_services.dart';
import '../theme/app_theme.dart';
import '../utils/url_opener.dart';
import '../widgets/occupancy_legend.dart';
import '../widgets/parking_button.dart';
import '../widgets/parking_map.dart';

class ZoneScreen extends StatelessWidget {
  const ZoneScreen({super.key, required this.zone});

  final ParkingZone zone;

  Future<void> _openLot(BuildContext context, ParkingLot lot) async {
    final services = AppServicesScope.of(context);
    await services.recents.push(lot.id);
    if (!context.mounted) return;
    await openExternalUrl(context, lot.googleMapsUrl);
  }

  @override
  Widget build(BuildContext context) {
    final lots = [...zone.lots]..sort((a, b) => a.id.compareTo(b.id));
    return Scaffold(
      backgroundColor: context.pageSurface,
      appBar: AppBar(title: Text(zone.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          _HeaderCard(
            zone: zone,
            onMarkerTap: (lot) => _openLot(context, lot),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Estacionamientos disponibles',
              style: TextStyle(
                color: context.headingAccent,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
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
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.zone, required this.onMarkerTap});

  final ParkingZone zone;
  final void Function(ParkingLot lot) onMarkerTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: context.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            zone.subtitle,
            style: TextStyle(
              color: context.mutedText,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          ParkingMap(zone: zone, onMarkerTap: onMarkerTap),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.touch_app_outlined,
                size: 16,
                color: context.mutedText,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Toca un E# en el mapa para abrirlo en Google Maps.',
                  style: TextStyle(
                    color: context.mutedText,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const OccupancyLegend(),
        ],
      ),
    );
  }
}
