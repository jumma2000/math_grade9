import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════
/// ثوابت التطبيق - المكان الوحيد لتعديل الألوان والأحجام والنصوص
/// ═══════════════════════════════════════════════════════════
class AppConstants {
  AppConstants._(); // منع إنشاء كائن من هذا الكلاس

  // ═══════════════════════════════════════════════════════════
  // 📌 معلومات التطبيق
  // ═══════════════════════════════════════════════════════════
  static const String appName = 'الرياضيات الممتعة';
  static const String grade = 'الصف التاسع';
  static const String curriculum = 'المنهج الليبي 2025-2026';
  static const String designer = 'تصميم وتنفيذ: جمعة ضو';

  /// العنوان الكامل (يظهر في شاشة Splash وعنوان النافذة)
  static const String fullTitle =
      '$appName - $grade - $curriculum';

  // ═══════════════════════════════════════════════════════════
  // 🎨 الألوان
  // ═══════════════════════════════════════════════════════════
  // -- الألوان الأساسية --
  static const Color primaryColor = Color(0xFF00695C); // أزرق مخضرّ هادئ
  static const Color primaryLight = Color(0xFF4DB6AC); // درجة أفتح من الأساسي
  static const Color primaryDark = Color(0xFF004D40);  // درجة أغمق من الأساسي

  // -- الألوان الثانوية --
  static const Color secondaryColor = Color(0xFFF9A825); // ذهبي للتمييز
  static const Color accentColor = Color(0xFF26A69A);    // لمعة إضافية

  // -- ألوان الحالات --
  static const Color successColor = Color(0xFF43A047); // إجابة صحيحة
  static const Color errorColor = Color(0xFFE53935);   // إجابة خاطئة
  static const Color warningColor = Color(0xFFFB8C00); // تنبيه

  // -- ألوان الخلفيات (الوضع الفاتح) --
  static const Color lightBackground = Color(0xFFF8FAFB); // أبيض ثلجي
  static const Color lightSurface = Color(0xFFFFFFFF);    // بطاقات بيضاء

  // -- ألوان الخلفيات (الوضع الداكن) --
  static const Color darkBackground = Color(0xFF121212);  // أسود ناعم
  static const Color darkSurface = Color(0xFF1E1E1E);     // بطاقات داكنة

  // -- ألوان النصوص --
  static const Color textPrimaryLight = Color(0xFF263238); // نص أساسي (فاتح)
  static const Color textSecondaryLight = Color(0xFF546E7A); // نص ثانوي (فاتح)
  static const Color textPrimaryDark = Color(0xFFECEFF1);  // نص أساسي (داكن)
  static const Color textSecondaryDark = Color(0xFFB0BEC5); // نص ثانوي (داكن)

  // ═══════════════════════════════════════════════════════════
  // 📏 المسافات (نظام مضاعفات الـ 4)
  // ═══════════════════════════════════════════════════════════
  static const double spaceXS = 4.0;   // صغيرة جداً
  static const double spaceS = 8.0;    // صغيرة
  static const double spaceM = 16.0;   // متوسطة (الأكثر استخداماً)
  static const double spaceL = 24.0;   // كبيرة
  static const double spaceXL = 32.0;  // كبيرة جداً
  static const double spaceXXL = 48.0; // ضخمة

  // ═══════════════════════════════════════════════════════════
  // 🔤 أحجام الخطوط
  // ═══════════════════════════════════════════════════════════
  static const double fontXS = 12.0;   // تلميحات صغيرة
  static const double fontS = 14.0;    // نصوص ثانوية
  static const double fontM = 16.0;    // ✅ الافتراضي للنصوص
  static const double fontL = 18.0;    // عناوين فرعية
  static const double fontXL = 22.0;   // عناوين رئيسية
  static const double fontXXL = 28.0;  // عناوين الشاشات
  static const double fontHuge = 36.0; // اسم التطبيق في Splash

  // ═══════════════════════════════════════════════════════════
  // 🔲 الحواف الدائرية
  // ═══════════════════════════════════════════════════════════
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 20.0;
  static const double radiusXL = 28.0;
  static const double radiusCircle = 999.0; // للدوائر الكاملة

  // ═══════════════════════════════════════════════════════════
  // 🌐 اللغة
  // ═══════════════════════════════════════════════════════════
  static const Locale arabicLocale = Locale('ar', 'LY');
  static const Locale englishLocale = Locale('en', 'US');
}