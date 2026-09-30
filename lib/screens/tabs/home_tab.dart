import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../data/units_data.dart';
import '../units_tab_helper.dart';

/// ═══════════════════════════════════════════════════════════
/// التبويب الرئيسي — قائمة الوحدات
/// ═══════════════════════════════════════════════════════════
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final theme = Theme.of(context);
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.spaceL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppConstants.spaceM),

                // ── الوحدات ──
                Row(
                  children: [
                    const Icon(Icons.library_books,
                        color: AppConstants.primaryColor, size: 22),
                    const SizedBox(width: 8),
                    Text('الوحدات الدراسية',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryColor,
                        )),
                  ],
                ),
                const SizedBox(height: AppConstants.spaceM),

                ...allUnits.map((unit) => Padding(
                      padding: const EdgeInsets.only(
                          bottom: AppConstants.spaceM),
                      child: buildUnitCard(context, unit),
                    )),

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