import '../models/unit.dart';   
import 'lessons/unit1_lesson1_data.dart';
import 'lessons/unit1_lesson2_data.dart';
import 'lessons/unit1_lesson3_data.dart';
import 'lessons/unit1_lesson4_data.dart';
import 'lessons/unit1_lesson5_data.dart';
import 'lessons/unit1_lesson6_data.dart';
import 'lessons/unit2_lesson1_data.dart';
import 'lessons/unit2_lesson2_data.dart';
import 'lessons/unit2_lesson3_data.dart';
import 'lessons/unit2_lesson4_data.dart';
import 'lessons/unit2_lesson5_data.dart';
/// ═══════════════════════════════════════════════════════════
/// الوحدات السبع للصف التاسع
/// ═══════════════════════════════════════════════════════════
final List<Unit> allUnits = [
  // ═══ الوحدة 1: الجبر ═══
    Unit(
      number: 1,
      title: 'الجبر',
      titleEn: 'Algebra',
      description: 'المفكوك والتحليل الجبري',
      startPage: 10,
      endPage: 27,
      lessons: const [
      unit1Lesson1,
      unit1Lesson2,
      unit1Lesson3,
      unit1Lesson4,
      unit1Lesson5,
      unit1Lesson6,
      
      ],   // ✅ عدّل  // ✅ ربط الدرس الأول
    ),

    // ═══ الوحدة 2: المعادلات الآنية ═══
    // ignore: prefer_const_constructors
    Unit(
      number: 2,
      title: 'المعادلات الآنية',
      titleEn: 'Simultaneous Equations',
      description: 'حل المعادلات الآنية بيانياً وجبرياً',
      startPage: 80,
      endPage: 94,
      lessons: const [
      unit2Lesson1,
      unit2Lesson2,
      unit2Lesson3,
      unit2Lesson4,
      unit2Lesson5,
      ],
    ),

    // ═══ الوحدة 3: مساحات السطوح ═══
    Unit(
      number: 3,
      title: 'مساحات السطوح',
      titleEn: 'Surface Areas',
      description: 'مساحات المجسمات الهندسية',
      startPage: 96,
      endPage: 125,
      lessons: const [],
    ),

    // ═══ الوحدة 4: المضلعات ═══
    Unit(
      number: 4,
      title: 'المضلعات',
      titleEn: 'Polygons',
      description: 'خصائص المضلعات المنتظمة',
      startPage: 128,
      endPage: 136,
      lessons: const [],
    ),

    // ═══ الوحدة 5: التماثل ═══
    Unit(
      number: 5,
      title: 'التماثل',
      titleEn: 'Symmetry',
      description: 'التماثل المحوري والدوراني',
      startPage: 137,
      endPage: 154,
      lessons: const [],
    ),

    // ═══ الوحدة 6: التطابق والتشابه ═══
    Unit(
      number: 6,
      title: 'التطابق والتشابه',
      titleEn: 'Congruence and Similarity',
      description: 'حالات التطابق والتشابه للمثلثات',
      startPage: 156,
      endPage: 193,
      lessons: const [],
    ),

    // ═══ الوحدة 7: الإحصاء ═══
    Unit(
      number: 7,
      title: 'الإحصاء',
      titleEn: 'Statistics',
      description: 'جمع البيانات وعرضها وتحليلها',
      startPage: 195,
      endPage: 212,
      lessons: const [],
    ),
];