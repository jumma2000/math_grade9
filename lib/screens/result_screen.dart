import 'package:flutter/material.dart';
import '../services/quiz_engine.dart';
import '../utils/constants.dart';

/// ═══════════════════════════════════════════════════════════
/// شاشة النتيجة
/// ═══════════════════════════════════════════════════════════
class ResultScreen extends StatelessWidget {
  final String lessonTitle;
  final QuizEngine engine;

  const ResultScreen({
    super.key,
    required this.lessonTitle,
    required this.engine,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = engine.successPercent;
    final correct = engine.correctCount;
    final total = engine.totalQuestions;

    // لون وتقييم
    Color color;
    String message;
    IconData icon;

    if (percent >= 90) {
      color = AppConstants.successColor;
      message = 'ممتاز! 🎉';
      icon = Icons.emoji_events;
    } else if (percent >= 75) {
      color = const Color(0xFF00897B);
      message = 'جيد جداً! 👍';
      icon = Icons.thumb_up_alt;
    } else if (percent >= 50) {
      color = AppConstants.warningColor;
      message = 'جيد، حاول مرة أخرى';
      icon = Icons.sentiment_satisfied_alt;
    } else {
      color = AppConstants.errorColor;
      message = 'تحتاج مزيداً من المراجعة';
      icon = Icons.sentiment_dissatisfied;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('النتيجة')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.spaceL),
            child: Column(
              children: [
                const SizedBox(height: AppConstants.spaceL),

                // أيقونة النتيجة
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withValues(alpha: 0.15),
                    border: Border.all(color: color, width: 3),
                  ),
                  child: Icon(icon, size: 64, color: color),
                ),

                const SizedBox(height: AppConstants.spaceL),

                Text(
                  message,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),

                const SizedBox(height: AppConstants.spaceS),

                Text(
                  lessonTitle,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppConstants.spaceXXL),

                // النسبة
                Text(
                  '${percent.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),

                const SizedBox(height: AppConstants.spaceL),

                // تفصيل
                Container(
                  padding: const EdgeInsets.all(AppConstants.spaceL),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(
                        AppConstants.radiusM),
                    border: Border.all(
                        color: color.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _stat('صحيحة', correct,
                            AppConstants.successColor,
                            Icons.check_circle),
                      ),
                      Container(
                          width: 1,
                          height: 50,
                          color: Colors.grey.shade300),
                      Expanded(
                        child: _stat('خاطئة', total - correct,
                            AppConstants.errorColor, Icons.cancel),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppConstants.spaceXXL),

                // زر إعادة
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('العودة للدرس'),
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
                        borderRadius: BorderRadius.circular(
                            AppConstants.radiusM),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _stat(String label, int value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: AppConstants.spaceS),
        Text('$value',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            )),
        Text(label,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontS,
            )),
      ],
    );
  }
}
