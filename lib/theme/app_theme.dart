import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color udlapGreen = Color(0xFF005B34);
  static const Color udlapGreenDark = Color(0xFF003F24);
  static const Color udlapOrange = Color(0xFFFF8C25);
  static const Color udlapOrangeDark = Color(0xFFE6731A);
  static const Color surface = Color(0xFFF4F4F4);
  static const Color surfaceMuted = Color(0xFFE0E0E0);
  static const Color background = Color(0xFFD9D9D9);
  static const Color onSurfaceMuted = Color(0xFF6C6C6C);
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
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
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
