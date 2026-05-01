import 'package:flutter/widgets.dart';

import 'occupancy_service.dart';
import 'preferences_service.dart';
import 'recent_parkings_service.dart';

class AppServices {
  AppServices({
    required this.preferences,
    required this.recents,
    required this.occupancy,
  });

  final PreferencesService preferences;
  final RecentParkingsService recents;
  final OccupancyService occupancy;

  static Future<AppServices> bootstrap() async {
    final prefs = await PreferencesService.load();
    final recents = await RecentParkingsService.load();
    return AppServices(
      preferences: prefs,
      recents: recents,
      occupancy: OccupancyService(),
    );
  }

  void dispose() {
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
