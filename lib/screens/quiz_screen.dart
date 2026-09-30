import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/quiz_engine.dart';
import '../utils/constants.dart';
import 'result_screen.dart';

/// ═══════════════════════════════════════════════════════════
/// شاشة الاختبار
/// ═══════════════════════════════════════════════════════════
class QuizScreen extends StatefulWidget {
  final String lessonTitle;
  final List<Question> questions;

  const QuizScreen({
    super.key,
    required this.lessonTitle,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizEngine _engine;
  int? _selectedIndex;   // مؤشر الخيار المختار حالياً
  bool _answered = false; // هل تم اختيار إجابة؟

  @override
  void initState() {
    super.initState();
    _engine = QuizEngine(questions: widget.questions, shuffle: false);
  }

  void _selectOption(int i) {
    if (_answered) return;
    setState(() {
      _selectedIndex = i;
      _answered = true;
      _engine.selectAnswer(i);
    });
  }

  void _next() {
    if (_engine.isLast) {
      _finish();
      return;
    }
    setState(() {
      _engine.next();
      _selectedIndex = null;
      _answered = false;
    });
  }

  void _finish() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          lessonTitle: widget.lessonTitle,
          engine: _engine,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = _engine.currentQuestion;
    final theme = Theme.of(context);
    final progress = (_engine.currentIndex + 1) / _engine.totalQuestions;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.lessonTitle)),
        body: SafeArea(
          child: Column(
            children: [
              // ── شريط التقدم + العداد ──
              Padding(
                padding: const EdgeInsets.all(AppConstants.spaceM),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'السؤال ${_engine.currentIndex + 1} من ${_engine.totalQuestions}',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        _counterBadge(
                          Icons.check_circle,
                          _engine.correctCount,
                          AppConstants.successColor,
                        ),
                        const SizedBox(width: AppConstants.spaceS),
                        _counterBadge(
                          Icons.cancel,
                          _engine.wrongCount,
                          AppConstants.errorColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spaceS),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation(
                            AppConstants.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),

              // ── السؤال + الخيارات ──
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spaceM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // السؤال
                      Container(
                        padding:
                            const EdgeInsets.all(AppConstants.spaceM),
                        decoration: BoxDecoration(
                          color: AppConstants.primaryColor
                              .withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(
                              AppConstants.radiusM),
                          border: Border.all(
                            color: AppConstants.primaryColor
                                .withValues(alpha: 0.2),
                          ),
                        ),
                        child: Text(
                          q.question,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: AppConstants.fontL,
                            fontWeight: FontWeight.bold,
                            height: 1.8,
                          ),
                        ),
                      ),

                      const SizedBox(height: AppConstants.spaceL),

                      // الخيارات
                      ...List.generate(q.options.length, (i) {
                        return _optionTile(context, i, q);
                      }),

                      const SizedBox(height: AppConstants.spaceM),

                      // الشرح بعد الإجابة
                      if (_answered && q.explanation != null)
                        Container(
                          padding:
                              const EdgeInsets.all(AppConstants.spaceM),
                          decoration: BoxDecoration(
                            color: AppConstants.successColor
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                                AppConstants.radiusM),
                            border: Border.all(
                              color: AppConstants.successColor
                                  .withValues(alpha: 0.3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.lightbulb_outline,
                                      size: 18,
                                      color:
                                          AppConstants.successColor),
                                  SizedBox(width: 6),
                                  Text('الشرح',
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppConstants.successColor,
                                      )),
                                ],
                              ),
                              const SizedBox(height: AppConstants.spaceS),
                              Text(q.explanation!,
                                  style: const TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: AppConstants.fontM,
                                    height: 1.7,
                                  )),
                            ],
                          ),
                        ),

                      const SizedBox(height: AppConstants.spaceL),
                    ],
                  ),
                ),
              ),

              // ── زر التالي ──
              if (_answered)
                Padding(
                  padding: const EdgeInsets.all(AppConstants.spaceM),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _next,
                      icon: Icon(_engine.isLast
                          ? Icons.done_all
                          : Icons.arrow_back_rounded),
                      label: Text(_engine.isLast
                          ? 'إظهار النتيجة'
                          : 'السؤال التالي'),
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
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _counterBadge(IconData icon, int value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text('$value',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: AppConstants.fontS,
              )),
        ],
      ),
    );
  }

  Widget _optionTile(BuildContext context, int i, Question q) {
    final isSelected = _selectedIndex == i;
    final isCorrect = i == q.correctIndex;

    Color borderColor = Colors.grey.shade300;
    Color bg = Colors.white;
    Color textColor = AppConstants.textPrimaryLight;
    IconData? icon;

    if (_answered) {
      if (isCorrect) {
        borderColor = AppConstants.successColor;
        bg = AppConstants.successColor.withValues(alpha: 0.1);
        textColor = AppConstants.successColor;
        icon = Icons.check_circle;
      } else if (isSelected) {
        borderColor = AppConstants.errorColor;
        bg = AppConstants.errorColor.withValues(alpha: 0.1);
        textColor = AppConstants.errorColor;
        icon = Icons.cancel;
      }
    } else if (isSelected) {
      borderColor = AppConstants.primaryColor;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.spaceM),
      child: InkWell(
        onTap: () => _selectOption(i),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        child: Container(
          padding: const EdgeInsets.all(AppConstants.spaceM),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: borderColor.withValues(alpha: 0.15),
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + i), // A, B, C, D
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: borderColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.spaceM),
              Expanded(
                child: Text(
                  q.options[i],
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: AppConstants.fontM,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (icon != null)
                Icon(icon, color: textColor, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}
