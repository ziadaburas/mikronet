import 'package:flutter/material.dart';

class AppColors {
  // Main background gradient colors
  static const Color backgroundDark = Color(0xFF0A1F2E);
  static const Color backgroundLight = Color(0xFF153244);
  
  // Card and container colors
  static const Color cardColor = Color(0xFF1E4D5C);
  static const Color cardColorLight = Color(0xFF2A6272);
  
  // Accent colors
  static const Color accentPink = Color(0xFFE85A71);
  static const Color accentTeal = Color(0xFF4ECDC4);
  static const Color accentGreen = Color(0xFF6BCB77);
  
  // Text colors
  static const Color textWhite = Colors.white;
  static const Color textGrey = Color(0xFFB0BEC5);
  
  // Status colors
  static const Color statusActive = Color(0xFF4CAF50);
  static const Color statusInactive = Color(0xFFFF9800);
  static const Color statusBanned = Color(0xFFF44336);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      
      brightness: Brightness.dark,
      primaryColor: AppColors.accentTeal,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      fontFamily: 'NotoKufiArabic',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.textWhite,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentPink,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: AppColors.cardColorLight, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cardColorLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accentTeal, width: 2),
        ),
        labelStyle: const TextStyle(color: AppColors.textGrey),
        hintStyle: const TextStyle(color: AppColors.textGrey),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.textWhite,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textWhite,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textWhite,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textGrey,
          fontSize: 14,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentTeal,
        secondary: AppColors.accentPink,
        surface: AppColors.cardColor,
      ),
    );
  }
}

// Custom gradient background widget
class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundDark,
            AppColors.backgroundLight,
            AppColors.backgroundDark,
          ],
        ),
      ),
      child: child,
    );
  }
}
