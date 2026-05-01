import 'dart:async';

import 'package:flutter/widgets.dart';

import 'destination_tracker.dart';
import 'notifications_service.dart';
import 'occupancy_service.dart';
import 'preferences_service.dart';
import 'recent_parkings_service.dart';

class AppServices {
  AppServices({
    required this.preferences,
    required this.recents,
    required this.occupancy,
    required this.notifications,
    required this.destination,
  });

  final PreferencesService preferences;
  final RecentParkingsService recents;
  final OccupancyService occupancy;
  final NotificationsService notifications;
  final DestinationTracker destination;

  static Future<AppServices> bootstrap() async {
    final prefs = await PreferencesService.load();
    final recents = await RecentParkingsService.load();
    final occupancy =
        OccupancyService(tickInterval: const Duration(minutes: 1));
    final notifications = NotificationsService();
    unawaited(notifications.init());
    final destination = DestinationTracker(
      occupancy: occupancy,
      notifications: notifications,
    );
    return AppServices(
      preferences: prefs,
      recents: recents,
      occupancy: occupancy,
      notifications: notifications,
      destination: destination,
    );
  }

  void dispose() {
    destination.dispose();
    occupancy.dispose();
    recents.dispose();
    preferences.dispose();
  }
}

class AppServicesScope extends InheritedWidget {
  const AppServicesScope({
    super.key,
    required this.services,
    required super.child,
  });

  final AppServices services;

  static AppServices of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppServicesScope>();
    assert(scope != null, 'AppServicesScope not found in context');
    return scope!.services;
  }

  @override
  bool updateShouldNotify(AppServicesScope oldWidget) =>
      services != oldWidget.services;
}
