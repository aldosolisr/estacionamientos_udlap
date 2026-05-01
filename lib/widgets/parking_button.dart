import 'package:flutter/material.dart';

import '../models/parking_lot.dart';
import '../services/app_services.dart';
import '../services/occupancy_service.dart';
import '../theme/app_theme.dart';

class ParkingButton extends StatelessWidget {
  const ParkingButton({super.key, required this.lot, required this.onTap});

  final ParkingLot lot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final occupancy = AppServicesScope.of(context).occupancy;
    return ListenableBuilder(
      listenable: occupancy,
      builder: (context, _) {
        return _ParkingButtonView(
          lot: lot,
          snapshot: occupancy.snapshotFor(lot),
          onTap: onTap,
        );
      },
    );
  }
}

class _ParkingButtonView extends StatelessWidget {
  const _ParkingButtonView({
    required this.lot,
    required this.snapshot,
    required this.onTap,
  });

  final ParkingLot lot;
  final OccupancySnapshot snapshot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppRadii.pill);
    final occupancy = snapshot.color;

    return Material(
      color: AppColors.udlapOrange,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: SizedBox(
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: occupancy, width: 4),
                  ),
                  child: Text(
                    lot.code,
                    style: const TextStyle(
                      color: AppColors.udlapOrange,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lot.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: occupancy,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white, width: 1.2),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${snapshot.percent}% • ${snapshot.label}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.map_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
