import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../data/book_info_data.dart';
import 'main_navigation.dart';

/// ═══════════════════════════════════════════════════════════
/// شاشة مقدمة الكتاب
/// ═══════════════════════════════════════════════════════════
class BookIntroScreen extends StatelessWidget {
  const BookIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('مقدمة الكتاب')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.spaceL),
          child: Column(
            children: [
              const SizedBox(height: AppConstants.spaceM),

              // شعار الوزارة
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstants.primaryColor.withValues(alpha: 0.1),
                ),
                child: const Icon(Icons.school_outlined,
                    size: 44, color: AppConstants.primaryColor),
              ),

              const SizedBox(height: AppConstants.spaceM),

              // الدولة
              Text(
                bookInfo.country,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: AppConstants.fontL,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spaceXS),
              Text(
                bookInfo.ministry,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spaceXS),
              Text(
                bookInfo.curriculumCenter,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: AppConstants.fontXS,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppConstants.spaceXL),

              // أيقونة الكتاب
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstants.primaryColor.withValues(alpha: 0.15),
                ),
                child: const Icon(Icons.menu_book_rounded,
                    size: 56, color: AppConstants.primaryColor),
              ),

              const SizedBox(height: AppConstants.spaceL),

              // العنوان
              Text(
                bookInfo.title,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontSize: AppConstants.fontXXL,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spaceS),
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: AppConstants.secondaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: AppConstants.spaceS),

              Text(
                bookInfo.stage,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.spaceXS),
              Text(
                bookInfo.yearGregorian,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppConstants.spaceXXL),

              // زر ابدأ التعلم
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const MainNavigation(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow_rounded, size: 26),
                  label: const Text('ابدأ التعلم'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.spaceM),
                    textStyle: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: AppConstants.fontL,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusM),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppConstants.spaceL),

              // اسم المصمم
              Text(
                bookInfo.authorLine,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: AppConstants.fontXS,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
