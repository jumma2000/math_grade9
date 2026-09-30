import '../../models/question.dart';

/// ═══════════════════════════════════════════════════════════
/// أسئلة الدرس 1 — الوحدة 1 (الجبر)
/// عدد الأسئلة: 15
/// ═══════════════════════════════════════════════════════════
const List<Question> unit1Lesson1Questions = [
  Question(
    number: 1,
    question: 'ما ناتج 3(2س + 4)؟',
    options: ['6س + 4', '6س + 12', '5س + 7'],
    correctIndex: 1,
    explanation: '3 × 2س + 3 × 4 = 6س + 12',
  ),
  Question(
    number: 2,
    question: 'ما مفكوك 5(س - 3)؟',
    options: ['5س - 3', '5س - 15', '5س + 15'],
    correctIndex: 1,
    explanation: '5 × س + 5 × (-3) = 5س - 15',
  ),
  Question(
    number: 3,
    question: 'ما مفكوك -2(س + 7)؟',
    options: ['-2س + 14', '-2س - 14', '2س - 14'],
    correctIndex: 1,
    explanation: '-2 × س + (-2) × 7 = -2س - 14',
  ),
  Question(
    number: 4,
    question: 'ما مفكوك 4س(2س + 1)؟',
    options: ['8س² + 4س', '8س + 4', '6س² + 4س'],
    correctIndex: 0,
    explanation: '4س × 2س + 4س × 1 = 8س² + 4س',
  ),
  Question(
    number: 5,
    question: 'ما مفكوك 2(3س - 5) + 3(س + 2)؟',
    options: ['9س - 4', '9س - 16', '9س + 4'],
    correctIndex: 0,
    explanation: '6س - 10 + 3س + 6 = 9س - 4',
  ),
  Question(
    number: 6,
    question: 'ما مفكوك 7(2س + 3)؟',
    options: ['14س + 21', '14س + 3', '9س + 21'],
    correctIndex: 0,
    explanation: '7 × 2س + 7 × 3 = 14س + 21',
  ),
  Question(
    number: 7,
    question: 'ما مفكوك -3(2س - 4)؟',
    options: ['-6س + 12', '-6س - 12', '6س + 12'],
    correctIndex: 0,
    explanation: '-3 × 2س + (-3) × (-4) = -6س + 12',
  ),
  Question(
    number: 8,
    question: 'ما مفكوك س(س + 5)؟',
    options: ['س² + 5س', 'س² + 5', 'س + 5س'],
    correctIndex: 0,
    explanation: 'س × س + س × 5 = س² + 5س',
  ),
  Question(
    number: 9,
    question: 'ما مفكوك 6(س - 2) - 2(س - 3)؟',
    options: ['4س - 6', '4س + 6', '4س - 18'],
    correctIndex: 0,
    explanation: '6س - 12 - 2س + 6 = 4س - 6',
  ),
  Question(
    number: 10,
    question: 'ما مفكوك 3س(2س - 1)؟',
    options: ['6س² - 3س', '6س² - 1', '6س - 3س'],
    correctIndex: 0,
    explanation: '3س × 2س + 3س × (-1) = 6س² - 3س',
  ),
  Question(
    number: 11,
    question: 'ما مفكوك -4(س + 2) + 5(س - 1)؟',
    options: ['س - 13', 'س + 3', '9س - 13'],
    correctIndex: 0,
    explanation: '-4س - 8 + 5س - 5 = س - 13',
  ),
  Question(
    number: 12,
    question: 'ما مفكوك 2(س + 1) + 3(س + 1)؟',
    options: ['5س + 5', '5س + 1', '6س + 5'],
    correctIndex: 0,
    explanation: '(2 + 3)(س + 1) = 5(س + 1) = 5س + 5',
  ),
  Question(
    number: 13,
    question: 'ما مفكوك 8(3 - س)؟',
    options: ['24 - 8س', '24 + 8س', '8س - 24'],
    correctIndex: 0,
    explanation: '8 × 3 + 8 × (-س) = 24 - 8س',
  ),
  Question(
    number: 14,
    question: 'ما مفكوك -س(س - 4)؟',
    options: ['-س² + 4س', '-س² - 4س', 'س² + 4س'],
    correctIndex: 0,
    explanation: '-س × س + (-س) × (-4) = -س² + 4س',
  ),
  Question(
    number: 15,
    question: 'ما مفكوك 5(2س + 3) - 2(س + 4)؟',
    options: ['8س + 7', '8س - 7', '12س + 7'],
    correctIndex: 0,
    explanation: '10س + 15 - 2س - 8 = 8س + 7',
  ),
];