import '../../models/lesson.dart';

const Lesson unit2Lesson4 = Lesson(
  id: 'u2_l4',
  number: 4,
  title: 'الحلول البيانية للمعادلتين الآيتين',
  titleEn: 'Graphical Solutions of Simultaneous Equations',
  startPage: 89,
  shortDescription: 'حل المعادلات الآنية برسم الخطوط',
  unitTitle: 'المعادلات الآنية',
  unitNumber: 2,
  questionCount: 15,

  objectives: [
    'حل زوج من المعادلات الآنية بيانياً.',
    'تحديد نقطة تقاطع خطين مستقيمين.',
    'معرفة الحالات الخاصة (خطوط متوازية، منطبقة).',
  ],

  sections: [
    LessonSection(
      heading: 'الفكرة الأساسية',
      content:
          'حل زوج المعادلتين الآيتين بيانياً = '
          'إحداثيا نقطة تقاطع الخطين المستقيمين الممثلين لهما.',
      notes: [
        'خطان متقاطعان → حل واحد (نقطة تقاطع).',
        'خطان متوازيان → لا يوجد حل.',
        'خطان منطبقان → عدد لا نهائي من الحلول.',
      ],
    ),
    LessonSection(
      heading: 'خطوات الحل',
      content:
          '1. أنشئ جدول قيم لكل معادلة (نقطتان تكفيان).\n'
          '2. ارسم كلا الخطين على نفس المستوى.\n'
          '3. حدّد نقطة التقاطع.\n'
          '4. اقرأ الإحداثيين (س، ص).',
    ),
  ],

  examples: [
    LessonExample(
      number: 1,
      question: 'حل بيانياً: ص = س + 1، ص = -س + 3',
      solutionSteps: [
        'المعادلة (1): ص = س + 1',
        '  س=0 → ص=1، س=2 → ص=3',
        'المعادلة (2): ص = -س + 3',
        '  س=0 → ص=3، س=3 → ص=0',
        'نقطة التقاطع: (1، 2)',
      ],
      finalAnswer: 'س = 1، ص = 2',
    ),
    LessonExample(
      number: 2,
      question: 'حل بيانياً: س + ص = 5، س - ص = 1',
      solutionSteps: [
        'نقطة التقاطع من الرسم: (3، 2)',
      ],
      finalAnswer: 'س = 3، ص = 2',
    ),
    LessonExample(
      number: 3,
      question: 'حل بيانياً: ص = 2س، ص = 2س + 3',
      solutionSteps: [
        'الخطان متوازيان (نفس الميل = 2)',
        'لا يوجد تقاطع',
      ],
      finalAnswer: 'لا يوجد حل',
    ),
  ],

  summary: 'الحل البياني هو إحداثيا نقطة تقاطع الخطين.',
);
