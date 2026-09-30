class BookInfo {
  final String title;
  final String grade;
  final String stage;
  final String country;
  final String ministry;
  final String curriculumCenter;
  final String yearGregorian;
  final String yearHijri;
  final String description;
  final String introduction;
  final String authorLine;
  final String? phone;
  final String? address;
  final String? whatsapp;   // ✅ جديد

  const BookInfo({
    required this.title,
    required this.grade,
    required this.stage,
    required this.country,
    required this.ministry,
    required this.curriculumCenter,
    required this.yearGregorian,
    required this.yearHijri,
    required this.description,
    required this.introduction,
    required this.authorLine,
    this.phone,
    this.address,
    this.whatsapp,   // ✅ جديد
  });
}