import '../../models/lesson.dart';

const Lesson unit1Lesson6 = Lesson(
  id: 'u1_l6',
  number: 6,
  title: 'العامل المشترك الأعلى',
  titleEn: 'Highest Common Factor',
  startPage: 20,
  shortDescription: 'إخراج العامل المشترك من المقادير الجبرية',
  unitTitle: 'الجبر',
  unitNumber: 1,
  questionCount: 15,

  objectives: [
    'إيجاد العامل المشترك الأعلى لعدة حدود.',
    'إخراج العامل المشترك خارج القوس.',
    'التحليل البسيط للمقادير الجبرية.',
  ],

  sections: [
    LessonSection(
      heading: 'المفهوم',
      content:
          'العامل المشترك الأعلى (ع.م.أ) هو أكبر مقدار يقبل القسمة على كل حدود المقدار.\n\n'
          'عند إخراجه: نقسم كل حد على العامل، ثم نضعه خارج القوس.',
      notes: [
        'نأخذ أصغر أس للمتغير المشترك.',
        'نأخذ ع.م.أ للمعاملات الرقمية.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. حلّل كل معامل إلى عوامله الأولية.\n'
          '2. خذ العوامل المشتركة بأصغر أس.\n'
          '3. اكتب المقدار: ع.م.أ × (الباقي).',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'حلّل بإخراج العامل المشترك: 6س + 9',
      solutionSteps: [
        'ع.م.أ للعددين 6 و 9 هو 3',
        '6س + 9 = 3(2س + 3)',
      ],
      finalAnswer: '3(2س + 3)',
    ),
    LessonExample(
      number: 2,
      question: 'حلّل: 4س² + 8س',
      solutionSteps: [
        'ع.م.أ = 4س',
        '4س² + 8س = 4س(س + 2)',
      ],
      finalAnswer: '4س(س + 2)',
    ),
    LessonExample(
      number: 3,
      question: 'حلّل: 12س³ - 18س² + 6س',
      solutionSteps: [
        'ع.م.أ = 6س',
        '12س³ - 18س² + 6س = 6س(2س² - 3س + 1)',
      ],
      finalAnswer: '6س(2س² - 3س + 1)',
    ),
  ],

  summary: 'نُخرج ع.م.أ خارج القوس، ثم نقسم كل حد عليه.',
);
