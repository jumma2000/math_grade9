import '../../models/lesson.dart';

const Lesson unit1Lesson4 = Lesson(
  id: 'u1_l4',
  number: 4,
  title: 'الفرق بين مربعين',
  titleEn: 'Difference of Perfect Squares',
  startPage: 18,
  shortDescription: 'تحليل ومفكوك أ² - ب²',
  unitTitle: 'الجبر',
  unitNumber: 1,
  questionCount: 15,

  objectives: [
    'إيجاد مفكوك (أ + ب)(أ - ب).',
    'تحليل الفرق بين مربعين.',
    'التعامل مع المعاملات والحدود المختلفة.',
  ],

  sections: [
    LessonSection(
      heading: 'القانون',
      content:
          '(أ + ب)(أ - ب) = أ² - ب²\n\n'
          'أي: حاصل ضرب مجموع حدين في الفرق بينهما = مربع الأول - مربع الثاني.',
      notes: [
        'الحد الأوسط يُحذف (لأنه +أب - أب = 0).',
        'الناتج: حدان فقط.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. حدّد الحد الأول (أ) والحد الثاني (ب).\n'
          '2. طبّق القانون: أ² - ب².\n'
          '3. تأكد من الإشارة.',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'أوجد مفكوك: (س + 4)(س - 4)',
      solutionSteps: [
        '(س + 4)(س - 4) = س² - 4²',
        '               = س² - 16',
      ],
      finalAnswer: 'س² - 16',
    ),
    LessonExample(
      number: 2,
      question: 'أوجد مفكوك: (2س + 3)(2س - 3)',
      solutionSteps: [
        '(2س + 3)(2س - 3) = (2س)² - 3²',
        '                = 4س² - 9',
      ],
      finalAnswer: '4س² - 9',
    ),
    LessonExample(
      number: 3,
      question: 'أوجد مفكوك: (5س + 1)(5س - 1)',
      solutionSteps: [
        '(5س + 1)(5س - 1) = (5س)² - 1²',
        '                = 25س² - 1',
      ],
      finalAnswer: '25س² - 1',
    ),
  ],

  summary: 'أ² - ب² = (أ + ب)(أ - ب)',
);
