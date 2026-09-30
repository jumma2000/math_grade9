import 'package:flutter/material.dart';
import '../models/unit.dart';
import '../models/lesson.dart';
import '../data/units_data.dart';
import '../utils/constants.dart';
import 'teacher_lesson_screen.dart';

class TeacherTab extends StatefulWidget {
  const TeacherTab({super.key});

  @override
  State<TeacherTab> createState() => _TeacherTabState();
}

class _TeacherTabState extends State<TeacherTab> {
  Unit _selectedUnit = allUnits.first;

  @override
  Widget build(BuildContext context) {
    try {
      final theme = Theme.of(context);
      return Scaffold(
        appBar: AppBar(
          title: const Text('👨‍🏫 تحضير الدروس'),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              // ── إحصائيات ──
              _statsBar(theme),

              // ── اختيار الوحدة ──
              _unitSelector(theme),

              // ── قائمة الدروس ──
              Expanded(
                child: _selectedUnit.lessons.isEmpty
                    ? _empty()
                    : _lessonsList(theme),
              ),
            ],
          ),
        ),
      );
    } catch (e, st) {
      debugPrint('TeacherTab error: $e\n$st');
      return Scaffold(
        appBar: AppBar(title: const Text('المعلم')),
        body: Center(child: Text('خطأ: $e')),
      );
    }
  }

  // ── شريط إحصائيات ──
  Widget _statsBar(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spaceM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppConstants.primaryColor,
            AppConstants.primaryColor.withValues(alpha: 0.7),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Row(
        children: [
          _statItem('${allUnits.length}', 'وحدات', Icons.library_books),
          _statItem('${allUnits.fold<int>(0, (sum, u) => sum + u.lessonsCount)}',
              'دروس', Icons.menu_book),
          _statItem(
              '${allUnits.fold<int>(0, (sum, u) => sum + u.totalQuestions)}',
              'أسئلة',
              Icons.quiz),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.white.withValues(alpha: 0.9), size: 22),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                fontFamily: 'Cairo',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          Text(label,
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: AppConstants.fontXS,
              )),
        ],
      ),
    );
  }

  // ── اختيار الوحدة ──
  Widget _unitSelector(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.spaceM,
        horizontal: AppConstants.spaceS,
      ),
      color: theme.cardColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: allUnits.map((u) {
            final selected = u.number == _selectedUnit.number;
            return Padding(
              padding: const EdgeInsets.only(left: AppConstants.spaceS),
              child: GestureDetector(
                onTap: () {
                  try {
                    setState(() => _selectedUnit = u);
                  } catch (e) {
                    debugPrint('Unit selection error: $e');
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppConstants.primaryColor
                        : AppConstants.primaryColor.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusL),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: AppConstants.primaryColor
                                  .withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      if (selected)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(Icons.check_circle,
                              size: 16, color: Colors.white),
                        ),
                      Text('و${u.number}',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: selected
                                ? Colors.white
                                : AppConstants.primaryColor,
                          )),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ── قائمة الدروس ──
  Widget _lessonsList(ThemeData theme) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppConstants.spaceM),
      itemCount: _selectedUnit.lessons.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppConstants.spaceM),
      itemBuilder: (_, i) =>
          _lessonCard(context, _selectedUnit.lessons[i], i + 1),
    );
  }

  Widget _lessonCard(BuildContext context, Lesson lesson, int index) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(AppConstants.radiusM),
      onTap: () {
        try {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => TeacherLessonScreen(lesson: lesson),
            ),
          );
        } catch (e) {
          debugPrint('Navigation error: $e');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spaceM),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: Border.all(
              color: AppConstants.primaryColor.withValues(alpha: 0.15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppConstants.primaryColor,
                    AppConstants.primaryColor.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Center(
                child: Text('${lesson.number}',
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    )),
              ),
            ),
            const SizedBox(width: AppConstants.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.fontM,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    children: [
                      _badge(
                          Icons.quiz_outlined,
                          '${lesson.questionCount} سؤال',
                          AppConstants.secondaryColor),
                      _badge(
                          Icons.menu_book_outlined,
                          'ص ${lesson.startPage}',
                          AppConstants.primaryColor),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants.primaryColor.withValues(alpha: 0.1),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppConstants.primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppConstants.radiusS),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(text,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }

  Widget _empty() => Center(
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
                      AppConstants.primaryColor.withValues(alpha: 0.08),
                ),
                child: Icon(Icons.menu_book_outlined,
                    size: 50,
                    color: AppConstants.primaryColor
                        .withValues(alpha: 0.4)),
              ),
              const SizedBox(height: AppConstants.spaceL),
              const Text('لا توجد دروس في هذه الوحدة',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: AppConstants.fontL,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: AppConstants.spaceS),
              Text('سيتم إضافتها قريباً',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: AppConstants.fontS,
                    color: AppConstants.textSecondaryLight,
                  )),
            ],
          ),
        ),
      );
}