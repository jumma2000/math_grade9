/// ═══════════════════════════════════════════════════════════
/// نموذج السؤال — لاختبارات الدروس
/// ═══════════════════════════════════════════════════════════
class Question {
  final int number;              // رقم السؤال
  final String question;         // نص السؤال
  final List<String> options;    // الخيارات (3-4)
  final int correctIndex;        // رقم الإجابة الصحيحة (0-based)
  final String? explanation;     // شرح الإجابة

  const Question({
    required this.number,
    required this.question,
    required this.options,
    required this.correctIndex,
    this.explanation,
  });

  /// هل الإجابة صحيحة؟
  bool isCorrect(int selectedIndex) => selectedIndex == correctIndex;
}

/// ═══════════════════════════════════════════════════════════
/// دالة مساعدة: خلط الأسئلة
/// ═══════════════════════════════════════════════════════════
List<Question> shuffleQuestions(List<Question> questions, {int? limit}) {
  final shuffled = List<Question>.from(questions)..shuffle();
  if (limit != null && shuffled.length > limit) {
    return shuffled.sublist(0, limit);
  }
  return shuffled;
}
