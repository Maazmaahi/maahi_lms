part of '../cores.dart';

class AppTheme {
  //
  // For Light Mode
  //
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
    primaryColor: AppColors.lightPrimaryColor,
    brightness: Brightness.light,
    textTheme: GoogleFonts.mulishTextTheme().copyWith(
      titleLarge: GoogleFonts.mulish().copyWith(fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.lightSecondaryColor,
      backgroundColor: AppColors.lightBackgroundColor,
      actionsIconTheme:
          IconThemeData(color: AppColors.lightSecondaryColor),
      iconTheme: IconThemeData(color: AppColors.lightSecondaryColor),
    ),
    splashColor: AppColors.lightPrimaryColor.withOpacity(0.1),
    highlightColor: AppColors.lightPrimaryColor.withOpacity(0.1),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.lightPrimaryColor,
      onPrimary: AppColors.black,
      secondary: AppColors.lightSecondaryColor,
      primaryContainer: AppColors.lightPrimaryContainer,
      onPrimaryContainer: AppColors.black,
    ).copyWith(
      surface: AppColors.lightBackgroundColor,
      onSurface: AppColors.black,
      shadow: AppColors.darkShadowColor,
      inversePrimary: AppColors.darkPrimaryColor.withOpacity(0.3),
    ),
  );

  //
  // For Dark Mode
  //
  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
    primaryColor: AppColors.darkPrimaryColor,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.mulishTextTheme().copyWith(
      titleLarge: GoogleFonts.mulish().copyWith(fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.darkSecondaryColor,
      backgroundColor: AppColors.darkBackgroundColor,
      actionsIconTheme: IconThemeData(color: AppColors.darkSecondaryColor),
      iconTheme: IconThemeData(color: AppColors.darkSecondaryColor),
    ),
    splashColor: AppColors.darkPrimaryColor.withOpacity(0.1),
    highlightColor: AppColors.darkPrimaryColor.withOpacity(0.1),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.darkSecondaryColor,
      primaryContainer: AppColors.darkPrimaryContainer,
      onPrimaryContainer: AppColors.black,
    ).copyWith(
      surface: AppColors.darkBackgroundColor,
      onSurface: AppColors.white,
      shadow: AppColors.darkShadowColor,
      inversePrimary: AppColors.darkPrimaryColor.withOpacity(0.3),
    ),
  );
}
