import 'package:flutter/material.dart';

import '../services/app_services.dart';
import '../theme/app_theme.dart';
import '../utils/url_opener.dart';

class DestinationBanner extends StatelessWidget {
  const DestinationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final services = AppServicesScope.of(context);
    return ListenableBuilder(
      listenable: Listenable.merge([
        services.destination,
        services.occupancy,
      ]),
      builder: (context, _) {
        final lot = services.destination.destination;
        if (lot == null) return const SizedBox.shrink();
        final snap = services.occupancy.snapshotFor(lot);
        return Container(
          margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            color: context.cardSurface,
            borderRadius: BorderRadius.circular(AppRadii.card),
            boxShadow: context.cardShadow,
            border: Border.all(color: snap.color, width: 2),
          ),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.navigation_outlined,
                    color: snap.color,
                    size: 22,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Yendo a ${lot.code}',
                      style: TextStyle(
                        color: context.headingAccent,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: snap.color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${snap.percent}%',
                    style: TextStyle(
                      color: context.bodyText,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Te avisaré si su estado cambia mientras llegas.',
                style: TextStyle(
                  color: context.mutedText,
                  fontSize: 13,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () =>
                          services.destination.clear(),
                      icon: const Icon(Icons.close),
                      label: const Text('Cancelar'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.mutedText,
                        side: BorderSide(
                          color: context.isDark
                              ? Colors.white24
                              : Colors.black26,
                        ),
                        minimumSize: const Size.fromHeight(44),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppRadii.pill),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => services.destination.clear(),
                      icon: const Icon(Icons.flag_outlined),
                      label: const Text('Llegué'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              TextButton.icon(
                onPressed: () =>
                    openExternalUrl(context, lot.googleMapsUrl),
                icon: const Icon(Icons.map_outlined, size: 18),
                label: const Text('Abrir en Google Maps de nuevo'),
              ),
            ],
          ),
        );
      },
    );
  }
}
