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
import 'quiz_screen.dart';

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({super.key, required this.lesson});

  /// ✅ اختيار الأسئلة حسب الدرس
  List<Question> _getQuestions() {
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(lesson.title)),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.spaceL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.title,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.primaryColor,
                  ),
                ),
                const SizedBox(height: AppConstants.spaceS),
                Text(lesson.shortDescription,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: AppConstants.spaceM),
                Wrap(
                  spacing: AppConstants.spaceS,
                  runSpacing: AppConstants.spaceS,
                  children: [
                    _chip(Icons.quiz_outlined,
                        '${lesson.questionCount} سؤالاً'),
                    _chip(Icons.menu_book_outlined,
                        'صفحة ${lesson.startPage}'),
                  ],
                ),
                const SizedBox(height: AppConstants.spaceXL),

                if (lesson.objectives.isNotEmpty) ...[
                  _sectionTitle('الأهداف', Icons.flag_outlined),
                  const SizedBox(height: AppConstants.spaceM),
                  ...lesson.objectives.map((o) => _bullet(o)),
                  const SizedBox(height: AppConstants.spaceXL),
                ],

                if (lesson.sections.isNotEmpty) ...[
                  _sectionTitle('الشرح', Icons.menu_book_outlined),
                  const SizedBox(height: AppConstants.spaceM),
                  ...lesson.sections.map((s) => _sectionCard(s)),
                  const SizedBox(height: AppConstants.spaceXL),
                ],

                if (lesson.examples.isNotEmpty) ...[
                  _sectionTitle('أمثلة محلولة', Icons.lightbulb_outline),
                  const SizedBox(height: AppConstants.spaceM),
                  ...lesson.examples.map((e) => _exampleCard(e)),
                  const SizedBox(height: AppConstants.spaceXL),
                ],

                if (lesson.summary != null &&
                    lesson.summary!.isNotEmpty) ...[
                  _sectionTitle('الملخص', Icons.summarize_outlined),
                  const SizedBox(height: AppConstants.spaceM),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppConstants.spaceM),
                    decoration: BoxDecoration(
                      color: AppConstants.primaryColor
                          .withValues(alpha: 0.08),
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusM),
                      border: Border.all(
                        color: AppConstants.primaryColor
                            .withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(lesson.summary!,
                        style: theme.textTheme.bodyLarge),
                  ),
                  const SizedBox(height: AppConstants.spaceXL),
                ],

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(
                            lessonTitle: lesson.title,
                            questions: _getQuestions(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.play_arrow_rounded, size: 26),
                    label: const Text('ابدأ الاختبار'),
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
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusM),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.spaceXL),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _chip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spaceM,
          vertical: AppConstants.spaceS),
      decoration: BoxDecoration(
        color: AppConstants.secondaryColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppConstants.secondaryColor),
          const SizedBox(width: 6),
          Text(text,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: AppConstants.fontXS,
                fontWeight: FontWeight.w600,
                color: AppConstants.secondaryColor,
              )),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppConstants.primaryColor, size: 22),
        const SizedBox(width: AppConstants.spaceS),
        Text(title,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: AppConstants.fontXL,
              fontWeight: FontWeight.bold,
              color: AppConstants.primaryColor,
            )),
      ],
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.spaceS),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppConstants.primaryColor,
            ),
          ),
          const SizedBox(width: AppConstants.spaceS),
          Expanded(
              child: Text(text,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: AppConstants.fontM,
                    height: 1.7,
                  ))),
        ],
      ),
    );
  }

  Widget _sectionCard(LessonSection section) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppConstants.spaceM),
      padding: const EdgeInsets.all(AppConstants.spaceM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (section.heading != null) ...[
            Text(section.heading!,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.fontL,
                  color: AppConstants.primaryColor,
                )),
            const SizedBox(height: AppConstants.spaceS),
          ],
          Text(section.content,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: AppConstants.fontM,
                height: 1.8,
              )),
          if (section.notes.isNotEmpty) ...[
            const SizedBox(height: AppConstants.spaceM),
            Container(
              padding: const EdgeInsets.all(AppConstants.spaceS),
              decoration: BoxDecoration(
                color:
                    AppConstants.secondaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
                border: Border.all(
                  color:
                      AppConstants.secondaryColor.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: section.notes
                    .map((n) => Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 2),
                          child: Text('• $n',
                              style: const TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: AppConstants.fontS,
                                height: 1.6,
                              )),
                        ))
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _exampleCard(LessonExample ex) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: AppConstants.spaceM),
      padding: const EdgeInsets.all(AppConstants.spaceM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(
          color: AppConstants.secondaryColor.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppConstants.secondaryColor,
                  borderRadius:
                      BorderRadius.circular(AppConstants.radiusS),
                ),
                child: Text('مثال ${ex.number}',
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontSize: AppConstants.fontXS,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spaceM),
          Text(ex.question,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: AppConstants.fontM,
                fontWeight: FontWeight.w600,
                height: 1.7,
              )),
          const SizedBox(height: AppConstants.spaceM),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppConstants.spaceM),
            decoration: BoxDecoration(
              color: AppConstants.successColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.check_circle_outline,
                        size: 16, color: AppConstants.successColor),
                    SizedBox(width: 4),
                    Text('الحل:',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: AppConstants.successColor,
                          fontSize: AppConstants.fontS,
                        )),
                  ],
                ),
                const SizedBox(height: AppConstants.spaceS),
                ...ex.solutionSteps.map((s) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(s,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: AppConstants.fontS,
                            height: 1.7,
                          )),
                    )),
                if (ex.finalAnswer != null) ...[
                  const Divider(),
                  Text('الإجابة: ${ex.finalAnswer}',
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: AppConstants.fontS,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.successColor,
                      )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}