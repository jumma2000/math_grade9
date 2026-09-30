import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../data/book_info_data.dart';

/// ═══════════════════════════════════════════════════════════
/// التبويب الرئيسي — مقدمة الكتاب
/// ═══════════════════════════════════════════════════════════
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final theme = Theme.of(context);
      final size = MediaQuery.of(context).size;
      final isWide = size.width > 600;
      final coverWidth = isWide ? 260.0 : size.width * 0.55;
      final coverHeight = coverWidth * 1.4;

      return Scaffold(
        appBar: AppBar(title: const Text('مقدمة الكتاب')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.spaceL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: AppConstants.spaceL),

                // ── شعار الوزارة ──
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppConstants.primaryColor
                          .withValues(alpha: 0.1),
                    ),
                    child: const Icon(Icons.school_outlined,
                        size: 38, color: AppConstants.primaryColor),
                  ),
                ),
                const SizedBox(height: AppConstants.spaceM),
                Text(bookInfo.country,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: AppConstants.fontL,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(height: 4),
                Text(bookInfo.ministry,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: 2),
                Text(bookInfo.curriculumCenter,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: AppConstants.fontXS),
                    textAlign: TextAlign.center),

                const SizedBox(height: AppConstants.spaceXL),

                // ── صورة الكتاب ──
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusL),
                      boxShadow: [
                        BoxShadow(
                          color: AppConstants.primaryColor
                              .withValues(alpha: 0.25),
                          blurRadius: 30,
                          spreadRadius: 2,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusM),
                      child: Image.asset(
                        'assets/images/book_cover.png',
                        width: coverWidth,
                        height: coverHeight,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Container(
                          width: coverWidth,
                          height: coverHeight,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.menu_book,
                              size: 80,
                              color: AppConstants.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.spaceXL),

                // ── العنوان ──
                Text(
                  bookInfo.title,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: isWide ? 32 : 26,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.spaceS),
                Center(
                  child: Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.spaceS),
                Text(bookInfo.stage,
                    style:
                        theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
                    textAlign: TextAlign.center),
                const SizedBox(height: 4),
                Text(bookInfo.yearGregorian,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center),

                const SizedBox(height: AppConstants.spaceXXL),
              ],
            ),
          ),
        ),
      );
    } catch (e, st) {
      debugPrint('HomeTab error: $e\n$st');
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('حدث خطأ: $e',
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Cairo')),
          ),
        ),
      );
    }
  }
}