import 'lesson.dart';

/// ═══════════════════════════════════════════════════════════
/// نموذج الوحدة الدراسية
/// ═══════════════════════════════════════════════════════════
class Unit {
  final int number;
  final String title;
  final String titleEn;
  final String description;
  final int startPage;
  final int endPage;                  // ✅ هذا الحقل
  final List<Lesson> lessons;
  final String? iconName;
  final int? colorValue;

  const Unit({
    required this.number,
    required this.title,
    required this.titleEn,
    required this.description,
    required this.startPage,
    required this.endPage,            // ✅ وهذا
    required this.lessons,
    this.iconName,
    this.colorValue,
  });

  int get lessonsCount => lessons.length;
  bool get hasLessons => lessons.isNotEmpty;
  Lesson? get firstLesson => lessons.isEmpty ? null : lessons.first;
  Lesson? get lastLesson => lessons.isEmpty ? null : lessons.last;

  int get totalQuestions =>
      lessons.fold(0, (sum, l) => sum + l.questionCount);
}