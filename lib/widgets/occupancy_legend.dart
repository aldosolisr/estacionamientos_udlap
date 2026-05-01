import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class OccupancyLegend extends StatelessWidget {
  const OccupancyLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: const [
        _LegendChip(color: AppColors.occupancyLow, label: 'Disponible'),
        _LegendChip(color: AppColors.occupancyMedium, label: 'Medio'),
        _LegendChip(color: AppColors.occupancyHigh, label: 'Casi lleno'),
        _LegendChip(color: AppColors.occupancyFull, label: 'Lleno'),
      ],
    );
  }
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: context.mutedSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.isDark ? Colors.white12 : Colors.black12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: context.mutedText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
