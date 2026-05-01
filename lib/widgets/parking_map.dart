import 'package:flutter/material.dart';

import '../models/parking_lot.dart';
import '../models/parking_zone.dart';
import '../services/app_services.dart';
import '../services/occupancy_service.dart';
import '../theme/app_theme.dart';

class ParkingMap extends StatelessWidget {
  const ParkingMap({
    super.key,
    required this.zone,
    required this.onMarkerTap,
  });

  final ParkingZone zone;
  final void Function(ParkingLot lot) onMarkerTap;

  static const double _markerSize = 36;

  @override
  Widget build(BuildContext context) {
    final occupancy = AppServicesScope.of(context).occupancy;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadii.chip),
      child: AspectRatio(
        aspectRatio: zone.imageAspectRatio,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListenableBuilder(
              listenable: occupancy,
              builder: (context, _) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
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
                    for (final marker in zone.markers)
                      Positioned(
                        left: marker.dx * constraints.maxWidth -
                            _markerSize / 2,
                        top: marker.dy * constraints.maxHeight -
                            _markerSize / 2,
                        width: _markerSize,
                        height: _markerSize,
                        child: _MarkerHotspot(
                          lot: marker.lot,
                          snapshot: occupancy.snapshotFor(marker.lot),
                          size: _markerSize,
                          onTap: () => onMarkerTap(marker.lot),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MarkerHotspot extends StatelessWidget {
  const _MarkerHotspot({
    required this.lot,
    required this.snapshot,
    required this.size,
    required this.onTap,
  });

  final ParkingLot lot;
  final OccupancySnapshot snapshot;
  final double size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${lot.code} • ${snapshot.percent}% ${snapshot.label}',
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: snapshot.color.withValues(alpha: 0.92),
              border: Border.all(color: Colors.white, width: 2.5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x55000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  lot.code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
