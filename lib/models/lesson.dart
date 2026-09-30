/// ═══════════════════════════════════════════════════════════
/// نموذج الدرس — الوحدة الأساسية للمحتوى التعليمي
/// ═══════════════════════════════════════════════════════════
class Lesson {
  // ═══ المعلومات الأساسية ═══
  final String id;              // معرّف فريد (lesson_1)
  final int number;             // رقم الدرس داخل الوحدة
  final String title;           // العنوان بالعربية
  final String titleEn;         // العنوان بالإنجليزية
  final int startPage;          // الصفحة في الكتاب
  final String shortDescription;// وصف مختصر (سطر)
  final String unitTitle;       // عنوان الوحدة (نص)
  final int unitNumber;         // رقم الوحدة

  // ═══ المحتوى ═══
  final List<String> objectives;        // الأهداف
  final List<LessonSection> sections;   // أقسام الشرح
  final List<LessonExample> examples;   // أمثلة محلولة
  final String? summary;                // ملخص (اختياري)

  // ═══ الاختبار ═══
  final int questionCount;              // عدد الأسئلة

  const Lesson({
    required this.id,
    required this.number,
    required this.title,
    required this.titleEn,
    required this.startPage,
    required this.shortDescription,
    required this.unitTitle,
    required this.unitNumber,
    this.objectives = const [],
    this.sections = const [],
    this.examples = const [],
    this.summary,
    this.questionCount = 10,
  });
}

/// ═══════════════════════════════════════════════════════════
/// قسم من الشرح النظري
/// ═══════════════════════════════════════════════════════════
class LessonSection {
  final String? heading;         // عنوان القسم
  final String content;          // نص الشرح
  final List<String> notes;      // ملاحظات (صندوق مميز)

  const LessonSection({
    this.heading,
    required this.content,
    this.notes = const [],
  });
}

/// ═══════════════════════════════════════════════════════════
/// مثال محلول
/// ═══════════════════════════════════════════════════════════
class LessonExample {
  final int number;              // رقم المثال
  final String question;         // نص المسألة
  final List<String> solutionSteps; // خطوات الحل
  final String? finalAnswer;     // الإجابة النهائية

  const LessonExample({
    required this.number,
    required this.question,
    required this.solutionSteps,
    this.finalAnswer,
  });
}