import 'package:flutter/material.dart';
import '../../utils/constants.dart';

/// ═══════════════════════════════════════════════════════════
/// تبويب الاختبار — اختبار شامل
/// ═══════════════════════════════════════════════════════════
class QuizTab extends StatelessWidget {
  const QuizTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('الاختبار')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.spaceXL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        AppConstants.primaryColor.withValues(alpha: 0.12),
                  ),
                  child: const Icon(Icons.quiz_outlined,
                      size: 52, color: AppConstants.primaryColor),
                ),
                const SizedBox(height: AppConstants.spaceL),
                Text(
                  'الاختبار الشامل',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.primaryColor,
                  ),
                ),
                const SizedBox(height: AppConstants.spaceS),
                Text(
                  'سيتم تجهيزه قريباً',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
