import 'package:flutter/material.dart';

import '../services/app_services.dart';
import '../theme/app_theme.dart';

class NextTickLabel extends StatelessWidget {
  const NextTickLabel({super.key});

  static String _hhmm(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    final occupancy = AppServicesScope.of(context).occupancy;
    return ListenableBuilder(
      listenable: occupancy,
      builder: (context, _) {
        return Row(
          children: [
            Icon(
              Icons.schedule_outlined,
              size: 14,
              color: context.mutedText,
            ),
            const SizedBox(width: 6),
            Text(
              'Próximo cambio: ${_hhmm(occupancy.nextChangeAt)}',
              style: TextStyle(
                color: context.mutedText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
