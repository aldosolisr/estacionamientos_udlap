import 'package:flutter/material.dart';

import '../data/parking_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_opener.dart';

class VisitorAccessCard extends StatelessWidget {
  const VisitorAccessCard({super.key, this.subtitle});

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardSurface,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: context.cardShadow,
      ),
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.qr_code_2_outlined,
                color: context.headingAccent,
                size: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Acceso de visitas',
                  style: TextStyle(
                    color: context.headingAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: TextStyle(
                color: context.mutedText,
                fontSize: 13,
                height: 1.3,
              ),
            ),
          ],
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () => openExternalUrl(context, kVisitorAccessUrl),
            icon: const Icon(Icons.login_outlined),
            label: const Text('Dar acceso a visitas'),
          ),
        ],
      ),
    );
  }
}
