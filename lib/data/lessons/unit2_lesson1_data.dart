import '../../models/lesson.dart';

const Lesson unit2Lesson1 = Lesson(
  id: 'u2_l1',
  number: 1,
  title: 'طريقة معادلة المقادير',
  titleEn: 'Equating Expressions Method',
  startPage: 82,
  shortDescription: 'حل المعادلات الآنية بمعادلة الطرفين',
  unitTitle: 'المعادلات الآنية',
  unitNumber: 2,
  questionCount: 15,

  objectives: [
    'حل زوج من المعادلات الآنية بطريقة معادلة المقادير.',
    'استخدام خاصية التعدي للمساواة.',
    'التحقق من صحة الحل.',
  ],

  sections: [
    LessonSection(
      heading: 'الفكرة الأساسية',
      content:
          'إذا كان: ص = 3س - 5   و   ص = 2س + 3\n'
          'فبما أن الطرف الأيسر متساوٍ في المعادلتين، فإن الطرف الأيمن متساوٍ أيضاً:\n\n'
          '3س - 5 = 2س + 3',
      notes: [
        'نستخدم هذه الطريقة عندما يكون كلا الطرفين بدلالة نفس المتغير.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. اكتب المعادلتين بحيث يكون المتغير (ص) في طرف.\n'
          '2. ساوِ بين الطرفين الآخرين.\n'
          '3. حل المعادلة في متغير واحد.\n'
          '4. عوّض لإيجاد المتغير الثاني.',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'حل: ص = 3س - 5   و   ص = 2س + 3',
      solutionSteps: [
        '3س - 5 = 2س + 3',
        '3س - 2س = 3 + 5',
        'س = 8',
        'ص = 3(8) - 5 = 24 - 5 = 19',
      ],
      finalAnswer: 'س = 8، ص = 19',
    ),
    LessonExample(
      number: 2,
      question: 'حل: ص = 2س - 1   و   ص = س + 4',
      solutionSteps: [
        '2س - 1 = س + 4',
        '2س - س = 4 + 1',
        'س = 5',
        'ص = 2(5) - 1 = 9',
      ],
      finalAnswer: 'س = 5، ص = 9',
    ),
    LessonExample(
      number: 3,
      question: 'حل: ص = 4س - 3   و   ص = س + 6',
      solutionSteps: [
        '4س - 3 = س + 6',
        '4س - س = 6 + 3',
        '3س = 9',
        'س = 3',
        'ص = 4(3) - 3 = 9',
      ],
      finalAnswer: 'س = 3، ص = 9',
    ),
  ],

  summary: 'عندما يكون ص في طرف في المعادلتين، نساوي الطرفين الآخرين.',
);
