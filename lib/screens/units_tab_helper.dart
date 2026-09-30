import 'package:flutter/material.dart';
import '../models/unit.dart';
import '../utils/constants.dart';
import 'lessons_list_screen.dart';

/// ═══════════════════════════════════════════════════════════
/// بناء بطاقة وحدة
/// ═══════════════════════════════════════════════════════════
Widget buildUnitCard(BuildContext context, Unit unit) {
  final theme = Theme.of(context);
  final colors = [
    AppConstants.primaryColor,
    const Color(0xFF00897B),
    const Color(0xFF3949AB),
    const Color(0xFF6D4C41),
    const Color(0xFF00838F),
    const Color(0xFFD81B60),
    const Color(0xFF5E35B1),
  ];
  final color = colors[(unit.number - 1) % colors.length];

  return InkWell(
    borderRadius: BorderRadius.circular(AppConstants.radiusM),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LessonsListScreen(unit: unit),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(AppConstants.spaceM),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: color.withValues(alpha: 0.25), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // رقم الوحدة
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Center(
              child: Text(
                '${unit.number}',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.spaceM),

          // المعلومات
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unit.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.fontL,
                  ),
                ),
                const SizedBox(height: AppConstants.spaceXS),
                Text(
                  unit.description,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppConstants.spaceXS),
                Row(
                  children: [
                    Icon(Icons.menu_book_outlined,
                        size: 14, color: color),
                    const SizedBox(width: 4),
                    Text(
                      '${unit.lessonsCount} دروس',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: AppConstants.fontXS,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Icon(Icons.arrow_back_ios_new,
              size: 16, color: color.withValues(alpha: 0.6)),
        ],
      ),
    ),
  );
}
