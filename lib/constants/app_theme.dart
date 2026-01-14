import 'package:flutter/material.dart';

class AppColors {
  // Background & Surface
  static const Color background = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFFFFFFFF);
  
  // Text
  static const Color textPrimary = Color(0xFF323232);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textHint = Color(0xFF666666);
  
  // UI Elements
  static const Color border = Color(0xFF323232);
  static const Color iconColor = Color(0xFF323232);
  
  // Accent & Focus
  static const Color accent = Color(0xFF8B9556);
  static const Color inputFocus = Color(0xFF2d8cf0);
}

class AppSizes {
  static const double borderRadius = 5.0;
  static const double buttonHeight = 55.0;
  static const double inputPadding = 15.0;
  static const double spacing = 20.0;
  static const double borderWidth = 2.0;
}

class AppShadows {
  static List<BoxShadow> elevated = [
    const BoxShadow(
      color: Color(0xFF323232),
      offset: Offset(4, 4),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> pressed = [
    const BoxShadow(
      color: Color(0xFF323232),
      offset: Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> none = [];
}

class AppTheme {
  static const TextTheme textTheme = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    
    // Headline styles - for page headers
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    
    // Title styles - for card titles
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    
    // Body styles - for regular text
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    
    // Label styles - for small labels, buttons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
  );
}
