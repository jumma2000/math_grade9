import '../../models/lesson.dart';

const Lesson unit2Lesson2 = Lesson(
  id: 'u2_l2',
  number: 2,
  title: 'طريقة التعويض',
  titleEn: 'Substitution Method',
  startPage: 84,
  shortDescription: 'حل المعادلات الآنية بالتعويض',
  unitTitle: 'المعادلات الآنية',
  unitNumber: 2,
  questionCount: 15,

  objectives: [
    'حل زوج من المعادلات الآنية بطريقة التعويض.',
    'التعامل مع معادلة صريحة بدلالة متغير.',
    'التحقق من صحة الحل.',
  ],

  sections: [
    LessonSection(
      heading: 'الفكرة الأساسية',
      content:
          'إذا كانت إحدى المعادلتين على صورة: س = ... أو ص = ...\n'
          'نعوّض عن قيمة هذا المتغير في المعادلة الأخرى.',
      notes: [
        'مناسبة عندما تكون إحدى المعادلتين محلولة بالنسبة لأحد المتغيرات.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. عوّل إحدى المعادلتين عن المتغير المطلوب.\n'
          '2. عوّض في المعادلة الأخرى.\n'
          '3. حل المعادلة في متغير واحد.\n'
          '4. عوّض لإيجاد المتغير الثاني.',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'حل: ص = 2س + 1، 3س + 2ص = 16',
      solutionSteps: [
        'عوّض ص = 2س + 1 في المعادلة الثانية:',
        '3س + 2(2س + 1) = 16',
        '3س + 4س + 2 = 16',
        '7س = 14 → س = 2',
        'ص = 2(2) + 1 = 5',
      ],
      finalAnswer: 'س = 2، ص = 5',
    ),
    LessonExample(
      number: 2,
      question: 'حل: س = 3 + 2ص، 2س + ص = 11',
      solutionSteps: [
        'عوّض س = 3 + 2ص:',
        '2(3 + 2ص) + ص = 11',
        '6 + 4ص + ص = 11',
        '5ص = 5 → ص = 1',
        'س = 3 + 2 = 5',
      ],
      finalAnswer: 'س = 5، ص = 1',
    ),
    LessonExample(
      number: 3,
      question: 'حل: ص = س - 2، 2س + 3ص = 14',
      solutionSteps: [
        '2س + 3(س - 2) = 14',
        '2س + 3س - 6 = 14',
        '5س = 20 → س = 4',
        'ص = 4 - 2 = 2',
      ],
      finalAnswer: 'س = 4، ص = 2',
    ),
  ],

  summary: 'نعوّض قيمة متغير من معادلة في الأخرى، ثم نحل.',
);
