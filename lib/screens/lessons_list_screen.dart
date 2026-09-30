import 'package:flutter/material.dart';
import '../models/unit.dart';
import '../utils/constants.dart';
import 'lesson_detail_screen.dart';

/// ═══════════════════════════════════════════════════════════
/// قائمة دروس وحدة معينة
/// ═══════════════════════════════════════════════════════════
class LessonsListScreen extends StatelessWidget {
  final Unit unit;

  const LessonsListScreen({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(unit.title)),
        body: SafeArea(
          child: unit.lessons.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.spaceXL),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.auto_stories_outlined,
                            size: 80,
                            color: AppConstants.primaryColor
                                .withValues(alpha: 0.4)),
                        const SizedBox(height: AppConstants.spaceL),
                        Text(
                          'لم تُضف دروس هذه الوحدة بعد',
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppConstants.spaceS),
                        Text(
                          'سيتم إضافتها قريباً',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(AppConstants.spaceM),
                  itemCount: unit.lessons.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppConstants.spaceM),
                  itemBuilder: (context, i) {
                    final lesson = unit.lessons[i];
                    return InkWell(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusM),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                LessonDetailScreen(lesson: lesson),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(AppConstants.spaceM),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(
                              AppConstants.radiusM),
                          border: Border.all(
                            color: AppConstants.primaryColor
                                .withValues(alpha: 0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            // رقم الدرس
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppConstants.primaryColor,
                                borderRadius: BorderRadius.circular(
                                    AppConstants.radiusS),
                              ),
                              child: Center(
                                child: Text(
                                  '${lesson.number}',
                                  style: const TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: AppConstants.spaceM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lesson.title,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    lesson.shortDescription,
                                    style: theme.textTheme.bodyMedium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                          Icons.quiz_outlined,
                                          size: 14,
                                          color: AppConstants
                                              .secondaryColor),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${lesson.questionCount} سؤالاً',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          fontSize: AppConstants.fontXS,
                                          color:
                                              AppConstants.secondaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_back_ios_new,
                                size: 14, color: Colors.grey),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
