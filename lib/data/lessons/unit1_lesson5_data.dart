import '../../models/lesson.dart';

const Lesson unit1Lesson5 = Lesson(
  id: 'u1_l5',
  number: 5,
  title: 'المجموع والفرق بين مكعبين',
  titleEn: 'Sum and Difference of Cubes',
  startPage: 19,
  shortDescription: 'مفكوك أ³ ± ب³',
  unitTitle: 'الجبر',
  unitNumber: 1,
  questionCount: 15,

  objectives: [
    'إيجاد مفكوك مجموع مكعبين.',
    'إيجاد مفكوك الفرق بين مكعبين.',
    'التعامل مع الحدود المكعبة.',
  ],

  sections: [
    LessonSection(
      heading: 'القانونان',
      content:
          'أ³ + ب³ = (أ + ب)(أ² - أب + ب²)\n\n'
          'أ³ - ب³ = (أ - ب)(أ² + أب + ب²)',
      notes: [
        'لاحظ الإشارات: في المجموع → (أ + ب) مع (أ² - أب + ب²).',
        'في الفرق → (أ - ب) مع (أ² + أب + ب²).',
        'القوس الثاني دائماً موجب بالكامل.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. تأكد أن الحدين مكعبان كاملان.\n'
          '2. حدّد أ و ب (الجذر التكعيبي لكل حد).\n'
          '3. طبّق القانون.\n'
          '4. بسط القوس الثاني.',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'حلّل: س³ + 8',
      solutionSteps: [
        'س³ + 8 = س³ + 2³',
        '       = (س + 2)(س² - 2س + 4)',
      ],
      finalAnswer: '(س + 2)(س² - 2س + 4)',
    ),
    LessonExample(
      number: 2,
      question: 'حلّل: 27س³ - 1',
      solutionSteps: [
        '27س³ - 1 = (3س)³ - 1³',
        '        = (3س - 1)(9س² + 3س + 1)',
      ],
      finalAnswer: '(3س - 1)(9س² + 3س + 1)',
    ),
    LessonExample(
      number: 3,
      question: 'حلّل: 8س³ + 27',
      solutionSteps: [
        '8س³ + 27 = (2س)³ + 3³',
        '         = (2س + 3)(4س² - 6س + 9)',
      ],
      finalAnswer: '(2س + 3)(4س² - 6س + 9)',
    ),
  ],

  summary:
      'أ³ + ب³ = (أ + ب)(أ² - أب + ب²)\n'
      'أ³ - ب³ = (أ - ب)(أ² + أب + ب²)',
);
