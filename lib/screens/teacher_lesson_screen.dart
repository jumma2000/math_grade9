import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../models/question.dart';
import '../utils/constants.dart';
import '../data/questions/unit1_lesson1_questions.dart';
import '../data/questions/unit1_lesson2_questions.dart';
import '../data/questions/unit1_lesson3_questions.dart';
import '../data/questions/unit1_lesson4_questions.dart';
import '../data/questions/unit1_lesson5_questions.dart';
import '../data/questions/unit1_lesson6_questions.dart';
import '../data/questions/unit2_lesson1_questions.dart';
import '../data/questions/unit2_lesson2_questions.dart';
import '../data/questions/unit2_lesson3_questions.dart';
import '../data/questions/unit2_lesson4_questions.dart';
import '../data/questions/unit2_lesson5_questions.dart';
import '../services/pdf_service.dart';

class TeacherLessonScreen extends StatelessWidget {
  final Lesson lesson;
  const TeacherLessonScreen({super.key, required this.lesson});

  List<Question> _getQuestions() {
    try {
      switch (lesson.id) {
        case 'u1_l1':
          return unit1Lesson1Questions;
        case 'u1_l2':
          return unit1Lesson2Questions;
        case 'u1_l3':
          return unit1Lesson3Questions;
        case 'u1_l4':
          return unit1Lesson4Questions;
        case 'u1_l5':
          return unit1Lesson5Questions;
        case 'u1_l6':
          return unit1Lesson6Questions;
        case 'u2_l1':
          return unit2Lesson1Questions;
        case 'u2_l2':
          return unit2Lesson2Questions;
        case 'u2_l3':
          return unit2Lesson3Questions;
        case 'u2_l4':
          return unit2Lesson4Questions;
        case 'u2_l5':
          return unit2Lesson5Questions;
        default:
          return unit1Lesson1Questions;
      }
    } catch (e) {
      debugPrint('getQuestions error: $e');
      return unit1Lesson1Questions;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      final questions = _getQuestions();
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(lesson.title, overflow: TextOverflow.ellipsis),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.spaceM),
              child: Column(
                children: [
                  _heroHeader(),
                  const SizedBox(height: AppConstants.spaceM),
                  _expandCard(
                    title: '🎯 الأهداف التعليمية',
                    icon: Icons.flag_outlined,
                    color: AppConstants.primaryColor,
                    children: lesson.objectives
                        .map((o) => _bullet(o))
                        .toList(),
                  ),
                  const SizedBox(height: AppConstants.spaceM),
                  _expandCard(
                    title: '📖 الشرح والمفهوم',
                    icon: Icons.menu_book_outlined,
                    color: const Color(0xFF00897B),
                    children: lesson.sections
                        .map((s) => _sectionView(s))
                        .toList(),
                  ),
                  const SizedBox(height: AppConstants.spaceM),
                  _expandCard(
                    title: '💡 الأمثلة المحلولة',
                    icon: Icons.lightbulb_outline,
                    color: AppConstants.secondaryColor,
                    children: lesson.examples
                        .map((e) => _exampleView(e))
                        .toList(),
                  ),
                  
                  const SizedBox(height: AppConstants.spaceXL),
                ],
              ),
            ),
          ),
          // ✅ زر PDF في المكان الصحيح
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              try {
                await PdfService.exportLesson(
                  lesson: lesson,
                  questions: questions,
                );
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('خطأ: $e')),
                  );
                }
              }
            },
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('PDF'),
            backgroundColor: AppConstants.primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      );
    } catch (e, st) {
      debugPrint('TeacherLessonScreen error: $e\n$st');
      return Scaffold(
        appBar: AppBar(title: const Text('خطأ')),
        body: Center(child: Text('حدث خطأ: $e')),
      );
    }
  }

  // ── رأس الصفحة ──
  Widget _heroHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.spaceL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppConstants.primaryColor,
            AppConstants.primaryColor.withValues(alpha: 0.75),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppConstants.primaryColor.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.school,
                    color: Colors.white, size: 26),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الوحدة: ${lesson.unitTitle}',
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontM,
                        )),
                    Text('درس رقم ${lesson.number}',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: AppConstants.fontXS,
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spaceM),
          Row(
            children: [
              _heroBadge(
                  Icons.menu_book_outlined, 'صفحة ${lesson.startPage}'),
              const SizedBox(width: 8),
              _heroBadge(Icons.quiz_outlined,
                  '${lesson.questionCount} سؤالاً'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(text,
              style: const TextStyle(
                fontFamily: 'Cairo',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }

  Widget _expandCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border:
            Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(title,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: AppConstants.fontM,
              color: color,
            )),
        childrenPadding: const EdgeInsets.all(AppConstants.spaceM),
        iconColor: color,
        collapsedIconColor: color,
        children: children,
      ),
    );
  }

  Widget _bullet(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppConstants.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: AppConstants.fontM,
                    height: 1.7,
                  )),
            ),
          ],
        ),
      );

  Widget _sectionView(LessonSection s) => Container(
        margin: const EdgeInsets.only(bottom: AppConstants.spaceM),
        padding: const EdgeInsets.all(AppConstants.spaceM),
        decoration: BoxDecoration(
          color: const Color(0xFF00897B).withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppConstants.radiusS),
          border: Border.all(
              color: const Color(0xFF00897B).withValues(alpha: 0.15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (s.heading != null) ...[
              Text(s.heading!,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00897B),
                    fontSize: AppConstants.fontM,
                  )),
              const SizedBox(height: 8),
            ],
            Text(s.content,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: AppConstants.fontM,
                  height: 1.8,
                )),
            if (s.notes.isNotEmpty) ...[
              const SizedBox(height: 10),
              ...s.notes.map((n) => Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppConstants.secondaryColor
                          .withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: AppConstants.secondaryColor
                              .withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('💡 ',
                            style: TextStyle(fontSize: 14)),
                        Expanded(
                          child: Text(n,
                              style: const TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: AppConstants.fontS,
                                height: 1.6,
                              )),
                        ),
                      ],
                    ),
                  )),
            ],
          ],
        ),
      );

  Widget _exampleView(LessonExample e) => Container(
        margin: const EdgeInsets.only(bottom: AppConstants.spaceM),
        padding: const EdgeInsets.all(AppConstants.spaceM),
        decoration: BoxDecoration(
          color: AppConstants.secondaryColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppConstants.radiusS),
          border: Border.all(
              color: AppConstants.secondaryColor.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('مثال ${e.number}',
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  )),
            ),
            const SizedBox(height: 10),
            Text(e.question,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.fontM,
                  height: 1.7,
                )),
            const Divider(height: 20),
            ...e.solutionSteps.map((s) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(s,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: AppConstants.fontS,
                        height: 1.7,
                      )),
                )),
            if (e.finalAnswer != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:
                      AppConstants.successColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: AppConstants.successColor, size: 18),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text('الإجابة: ${e.finalAnswer}',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: AppConstants.successColor,
                            fontSize: AppConstants.fontS,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      );

  Widget _questionView(Question q) => Container(
        margin: const EdgeInsets.only(bottom: AppConstants.spaceM),
        padding: const EdgeInsets.all(AppConstants.spaceM),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(AppConstants.radiusS),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text('${q.number}',
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(q.question,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.fontM,
                        height: 1.6,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...List.generate(q.options.length, (i) {
              final correct = i == q.correctIndex;
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: correct
                      ? AppConstants.successColor.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: correct
                      ? Border.all(
                          color: AppConstants.successColor
                              .withValues(alpha: 0.4))
                      : null,
                ),
                child: Row(
                  children: [
                    Text('${String.fromCharCode(65 + i)})',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: correct
                              ? AppConstants.successColor
                              : AppConstants.textSecondaryLight,
                        )),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(q.options[i],
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: AppConstants.fontS,
                            color: correct
                                ? AppConstants.successColor
                                : AppConstants.textPrimaryLight,
                            fontWeight: correct
                                ? FontWeight.bold
                                : FontWeight.normal,
                          )),
                    ),
                    if (correct)
                      const Icon(Icons.check_circle,
                          color: AppConstants.successColor, size: 18),
                  ],
                ),
              );
            }),
            if (q.explanation != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('📝 ', style: TextStyle(fontSize: 14)),
                    Expanded(
                      child: Text(q.explanation!,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: AppConstants.fontXS,
                            height: 1.6,
                            color: AppConstants.textSecondaryLight,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      );
}