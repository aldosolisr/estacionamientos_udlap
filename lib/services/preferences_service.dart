import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends ChangeNotifier {
  PreferencesService(this._prefs);

  static const _kUserType = 'last_user_type';
  static const _kThemeMode = 'theme_mode';

  final SharedPreferences _prefs;

  static Future<PreferencesService> load() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService(prefs);
  }

  String? get lastUserType => _prefs.getString(_kUserType);

  ThemeMode get themeMode {
    switch (_prefs.getString(_kThemeMode)) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setLastUserType(String userType) async {
    await _prefs.setString(_kUserType, userType);
    notifyListeners();
  }

  Future<void> clearLastUserType() async {
    await _prefs.remove(_kUserType);
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await _prefs.setString(_kThemeMode, value);
    notifyListeners();
  }

  Future<void> toggleThemeMode() async {
    final next = switch (themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
    await setThemeMode(next);
  }
}
