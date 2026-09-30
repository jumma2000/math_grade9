import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// ═══════════════════════════════════════════════════════════
/// ثيمات التطبيق - فاتح وداكن
/// ═══════════════════════════════════════════════════════════
class AppTheme {
  AppTheme._(); // منع إنشاء كائن

  // ═══════════════════════════════════════════════════════════
  // ☀️ الوضع الفاتح
  // ═══════════════════════════════════════════════════════════
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Cairo',
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: AppConstants.lightBackground,

        // ── مخطط الألوان ──
        colorScheme: const ColorScheme.light(
          primary: AppConstants.primaryColor,
          onPrimary: Colors.white,
          secondary: AppConstants.secondaryColor,
          onSecondary: Colors.white,
          surface: AppConstants.lightSurface,
          onSurface: AppConstants.textPrimaryLight,
          error: AppConstants.errorColor,
          onError: Colors.white,
        ),

        // ── شريط التطبيق ──
        appBarTheme: const AppBarTheme(
          backgroundColor: AppConstants.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Cairo',
            fontSize: AppConstants.fontL,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // ── الأزرار الرئيسية ──
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.primaryColor,
            foregroundColor: Colors.white,
            elevation: 2,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spaceL,
              vertical: AppConstants.spaceM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontM,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // ── الأزرار الثانوية (TextButton) ──
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppConstants.primaryColor,
            textStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontM,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // ── الأزرار المحدّدة (OutlinedButton) ──
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppConstants.primaryColor,
            side: const BorderSide(color: AppConstants.primaryColor, width: 1.5),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spaceL,
              vertical: AppConstants.spaceM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontM,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // ── البطاقات ──
        cardTheme: CardThemeData(
          color: AppConstants.lightSurface,
          elevation: 2,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.spaceM,
            vertical: AppConstants.spaceS,
          ),
        ),

        // ── حقول الإدخال ──
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spaceM,
            vertical: AppConstants.spaceM,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            borderSide: const BorderSide(
              color: AppConstants.primaryColor,
              width: 2,
            ),
          ),
        ),

        // ── النصوص ──
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: AppConstants.fontHuge,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryLight,
            height: 1.5,
          ),
          headlineLarge: TextStyle(
            fontSize: AppConstants.fontXXL,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryLight,
            height: 1.5,
          ),
          titleLarge: TextStyle(
            fontSize: AppConstants.fontXL,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryLight,
            height: 1.6,
          ),
          titleMedium: TextStyle(
            fontSize: AppConstants.fontL,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimaryLight,
            height: 1.6,
          ),
          bodyLarge: TextStyle(
            fontSize: AppConstants.fontM,
            color: AppConstants.textPrimaryLight,
            height: 1.8,
          ),
          bodyMedium: TextStyle(
            fontSize: AppConstants.fontS,
            color: AppConstants.textSecondaryLight,
            height: 1.8,
          ),
          labelLarge: TextStyle(
            fontSize: AppConstants.fontS,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimaryLight,
          ),
        ),

        // ── الفواصل ──
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade300,
          thickness: 1,
          space: AppConstants.spaceL,
        ),

        // ── الأيقونات ──
        iconTheme: const IconThemeData(
          color: AppConstants.textPrimaryLight,
          size: 24,
        ),
      );

  // ═══════════════════════════════════════════════════════════
  // 🌙 الوضع الداكن
  // ═══════════════════════════════════════════════════════════
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Cairo',
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: AppConstants.darkBackground,

        // ── مخطط الألوان ──
        colorScheme: const ColorScheme.dark(
          primary: AppConstants.primaryLight,
          onPrimary: Colors.black,
          secondary: AppConstants.secondaryColor,
          onSecondary: Colors.black,
          surface: AppConstants.darkSurface,
          onSurface: AppConstants.textPrimaryDark,
          error: AppConstants.errorColor,
          onError: Colors.white,
        ),

        // ── شريط التطبيق ──
        appBarTheme: const AppBarTheme(
          backgroundColor: AppConstants.darkSurface,
          foregroundColor: AppConstants.textPrimaryDark,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Cairo',
            fontSize: AppConstants.fontL,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryDark,
          ),
        ),

        // ── الأزرار الرئيسية ──
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.primaryLight,
            foregroundColor: Colors.black,
            elevation: 2,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spaceL,
              vertical: AppConstants.spaceM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontM,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // ── الأزرار الثانوية ──
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppConstants.primaryLight,
            textStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontM,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // ── الأزرار المحدّدة ──
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppConstants.primaryLight,
            side: const BorderSide(
              color: AppConstants.primaryLight,
              width: 1.5,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spaceL,
              vertical: AppConstants.spaceM,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontM,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // ── البطاقات ──
        cardTheme: CardThemeData(
          color: AppConstants.darkSurface,
          elevation: 2,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.spaceM,
            vertical: AppConstants.spaceS,
          ),
        ),

        // ── حقول الإدخال ──
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppConstants.darkSurface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spaceM,
            vertical: AppConstants.spaceM,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            borderSide: const BorderSide(
              color: AppConstants.primaryLight,
              width: 2,
            ),
          ),
        ),

        // ── النصوص ──
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: AppConstants.fontHuge,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryDark,
            height: 1.5,
          ),
          headlineLarge: TextStyle(
            fontSize: AppConstants.fontXXL,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryDark,
            height: 1.5,
          ),
          titleLarge: TextStyle(
            fontSize: AppConstants.fontXL,
            fontWeight: FontWeight.bold,
            color: AppConstants.textPrimaryDark,
            height: 1.6,
          ),
          titleMedium: TextStyle(
            fontSize: AppConstants.fontL,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimaryDark,
            height: 1.6,
          ),
          bodyLarge: TextStyle(
            fontSize: AppConstants.fontM,
            color: AppConstants.textPrimaryDark,
            height: 1.8,
          ),
          bodyMedium: TextStyle(
            fontSize: AppConstants.fontS,
            color: AppConstants.textSecondaryDark,
            height: 1.8,
          ),
          labelLarge: TextStyle(
            fontSize: AppConstants.fontS,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimaryDark,
          ),
        ),

        // ── الفواصل ──
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade800,
          thickness: 1,
          space: AppConstants.spaceL,
        ),

        // ── الأيقونات ──
        iconTheme: const IconThemeData(
          color: AppConstants.textPrimaryDark,
          size: 24,
        ),
      );
}
