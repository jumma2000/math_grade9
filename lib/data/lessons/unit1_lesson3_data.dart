import '../../models/lesson.dart';

const Lesson unit1Lesson3 = Lesson(
  id: 'u1_l3',
  number: 3,
  title: 'مفكوك مربع كامل',
  titleEn: 'Expansion of Perfect Squares',
  startPage: 15,
  shortDescription: 'مفكوك (أ + ب)² و (أ - ب)²',
  unitTitle: 'الجبر',
  unitNumber: 1,
  questionCount: 15,

  objectives: [
    'إيجاد مفكوك مربع مجموع حدين.',
    'إيجاد مفكوك مربع الفرق بين حدين.',
    'التعامل مع معاملات مختلفة.',
  ],

  sections: [
    LessonSection(
      heading: 'القانونان الأساسيان',
      content:
          '(أ + ب)² = أ² + 2أب + ب²\n\n'
          '(أ - ب)² = أ² - 2أب + b²',
      notes: [
        'المربع الكامل: مربع الأول + 2 × الأول × الثاني + مربع الثاني.',
        'الإشارة الوسطى تتبع إشارة الحد الثاني.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. حدّد الحد الأول (أ) والحد الثاني (ب).\n'
          '2. طبّق القانون المناسب.\n'
          '3. احسب كل حد.\n'
          '4. اجمع النواتج.',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'أوجد مفكوك: (س + 3)²',
      solutionSteps: [
        '(س + 3)² = س² + 2 × س × 3 + 3²',
        '        = س² + 6س + 9',
      ],
      finalAnswer: 'س² + 6س + 9',
    ),
    LessonExample(
      number: 2,
      question: 'أوجد مفكوك: (2س - 5)²',
      solutionSteps: [
        '(2س - 5)² = (2س)² - 2 × 2س × 5 + 5²',
        '         = 4س² - 20س + 25',
      ],
      finalAnswer: '4س² - 20س + 25',
    ),
    LessonExample(
      number: 3,
      question: 'أوجد مفكوك: (3س + 4)²',
      solutionSteps: [
        '(3س + 4)² = 9س² + 2 × 3س × 4 + 16',
        '         = 9س² + 24س + 16',
      ],
      finalAnswer: '9س² + 24س + 16',
    ),
  ],

  summary:
      '(أ ± ب)² = أ² ± 2أب + ب²\n'
      'الحد الأوسط = ضعف حاصل ضرب الحدين.',
);
