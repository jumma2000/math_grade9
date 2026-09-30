import '../models/question.dart';

/// ═══════════════════════════════════════════════════════════
/// محرك الاختبار — يدير حالة الاختبار الحالي
/// ═══════════════════════════════════════════════════════════
class QuizEngine {
  final List<Question> questions;
  final List<int?> userAnswers;    // إجابات المستخدم (null = لم يجب)
  int _currentIndex = 0;

  QuizEngine({required List<Question> questions, bool shuffle = true})
      : questions = shuffle
            ? shuffleQuestions(questions)
            : List<Question>.from(questions),
        userAnswers = List<int?>.filled(questions.length, null);

  // ═══ خصائص محسوبة ═══
  int get currentIndex => _currentIndex;
  Question get currentQuestion => questions[_currentIndex];
  int get totalQuestions => questions.length;
  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == questions.length - 1;

  /// عدد الإجابات الصحيحة
  int get correctCount {
    int c = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctIndex) c++;
    }
    return c;
  }

  /// عدد الإجابات الخاطئة
  int get wrongCount {
    int c = 0;
    for (int i = 0; i < questions.length; i++) {
      final a = userAnswers[i];
      if (a != null && a != questions[i].correctIndex) c++;
    }
    return c;
  }

  /// عدد الأسئلة المُجابة
  int get answeredCount => userAnswers.where((a) => a != null).length;

  /// نسبة التقدم (0.0 - 1.0)
  double get progress =>
      totalQuestions == 0 ? 0 : answeredCount / totalQuestions;

  /// النسبة المئوية للنجاح
  double get successPercent =>
      totalQuestions == 0 ? 0 : (correctCount / totalQuestions) * 100;

  /// هل الاختبار مكتمل؟
  bool get isCompleted => answeredCount == totalQuestions;

  // ═══ عمليات ═══
  /// اختيار إجابة للسؤال الحالي
  void selectAnswer(int optionIndex) {
    userAnswers[_currentIndex] = optionIndex;
  }

  /// الانتقال للسؤال التالي
  bool next() {
    if (isLast) return false;
    _currentIndex++;
    return true;
  }

  /// العودة للسؤال السابق
  bool previous() {
    if (isFirst) return false;
    _currentIndex--;
    return true;
  }

  /// الانتقال لسؤال محدد
  void goTo(int index) {
    if (index >= 0 && index < questions.length) {
      _currentIndex = index;
    }
  }

  /// إعادة التهيئة
  void reset() {
    _currentIndex = 0;
    for (int i = 0; i < userAnswers.length; i++) {
      userAnswers[i] = null;
    }
  }

  /// إجابة المستخدم على سؤال معين
  int? answerAt(int index) =>
      (index >= 0 && index < userAnswers.length) ? userAnswers[index] : null;

  /// هل السؤال مُجاب؟
  bool isAnswered(int index) => answerAt(index) != null;

  /// هل إجابة السؤال صحيحة؟
  bool isCorrectAt(int index) =>
      answerAt(index) == questions[index].correctIndex;
}
