import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color udlapGreen = Color(0xFF005B34);
  static const Color udlapGreenDark = Color(0xFF003F24);
  static const Color udlapGreenSoft = Color(0xFF1F8A5F);
  static const Color udlapOrange = Color(0xFFFF8C25);
  static const Color udlapOrangeDark = Color(0xFFE6731A);

  static const Color surface = Color(0xFFF4F4F4);
  static const Color surfaceMuted = Color(0xFFE0E0E0);
  static const Color background = Color(0xFFD9D9D9);
  static const Color onSurfaceMuted = Color(0xFF6C6C6C);

  static const Color surfaceDark = Color(0xFF1F2226);
  static const Color surfaceMutedDark = Color(0xFF2A2E33);
  static const Color backgroundDark = Color(0xFF14161A);
  static const Color onSurfaceMutedDark = Color(0xFFB0B6BD);

  static const Color occupancyLow = Color(0xFF2E9E5E);
  static const Color occupancyMedium = Color(0xFFE8B12B);
  static const Color occupancyHigh = Color(0xFFEC7A1C);
  static const Color occupancyFull = Color(0xFFD32F2F);
}

class AppRadii {
  const AppRadii._();

  static const double card = 24;
  static const double pill = 40;
  static const double chip = 16;
}

class AppShadows {
  const AppShadows._();

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> cardDark = [
    BoxShadow(
      color: Color(0x66000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];
}

extension AppColorsX on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get cardSurface =>
      isDark ? AppColors.surfaceDark : AppColors.surface;
  Color get mutedSurface =>
      isDark ? AppColors.surfaceMutedDark : AppColors.surfaceMuted;
  Color get pageSurface =>
      isDark ? AppColors.backgroundDark : AppColors.background;
  Color get mutedText =>
      isDark ? AppColors.onSurfaceMutedDark : AppColors.onSurfaceMuted;
  Color get bodyText => isDark ? Colors.white : Colors.black87;
  Color get headingAccent =>
      isDark ? AppColors.udlapOrange : AppColors.udlapGreen;
  List<BoxShadow> get cardShadow =>
      isDark ? AppShadows.cardDark : AppShadows.card;
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.udlapGreen,
      primary: AppColors.udlapGreen,
      secondary: AppColors.udlapOrange,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
  );

  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.udlapGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.udlapOrange,
        foregroundColor: Colors.white,
        elevation: 2,
        minimumSize: const Size.fromHeight(56),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.pill),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.card),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.udlapGreenDark,
      contentTextStyle: TextStyle(color: Colors.white),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

ThemeData buildDarkAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.udlapGreen,
      brightness: Brightness.dark,
      primary: AppColors.udlapGreenSoft,
      secondary: AppColors.udlapOrange,
      surface: AppColors.surfaceDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
  );

  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.udlapGreenDark,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.udlapOrange,
        foregroundColor: Colors.white,
        elevation: 2,
        minimumSize: const Size.fromHeight(56),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.pill),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.card),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.surfaceMutedDark,
      contentTextStyle: TextStyle(color: Colors.white),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
