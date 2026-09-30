import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/lesson.dart';

class PdfService {
  PdfService._();

  static Future<void> exportLesson({
    required Lesson lesson,
    required List<dynamic> questions, // غير مستخدم الآن
  }) async {
    try {
      final fontData =
          await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
      final font = pw.Font.ttf(fontData);

      final doc = pw.Document();

      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          textDirection: pw.TextDirection.rtl,
          margin: const pw.EdgeInsets.all(40),
          theme: pw.ThemeData.withFont(
            base: font,
            bold: font,
            italic: font,
            boldItalic: font,
          ),
          header: (context) => pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 20),
            child: pw.Text(
              'الرياضيات الممتعة - الصف التاسع',
              style: pw.TextStyle(
                font: font,
                fontSize: 10,
                color: PdfColors.grey600,
              ),
            ),
          ),
          footer: (context) => pw.Container(
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(top: 20),
            child: pw.Text(
              'صفحة ${context.pageNumber} من ${context.pagesCount}',
              style: pw.TextStyle(
                font: font,
                fontSize: 9,
                color: PdfColors.grey600,
              ),
            ),
          ),
          build: (context) => [
            // ── العنوان ──
            pw.Center(
              child: pw.Text(
                lesson.title,
                style: pw.TextStyle(
                  font: font,
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.teal900,
                ),
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Divider(color: PdfColors.teal900, thickness: 2),
            pw.SizedBox(height: 10),

            // ── معلومات ──
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('الوحدة: ${lesson.unitTitle}',
                    style: pw.TextStyle(font: font, fontSize: 12)),
                pw.Text('الصفحة: ${lesson.startPage}',
                    style: pw.TextStyle(font: font, fontSize: 12)),
              ],
            ),
            pw.SizedBox(height: 20),

            // ── الأهداف ──
            if (lesson.objectives.isNotEmpty) ...[
              _sectionHeader('الأهداف التعليمية', font),
              pw.SizedBox(height: 8),
              ...lesson.objectives.map((o) => pw.Padding(
                    padding: const pw.EdgeInsets.only(bottom: 4),
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('•  ',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 13,
                                color: PdfColors.teal)),
                        pw.Expanded(
                          child: pw.Text(o,
                              style: pw.TextStyle(
                                  font: font, fontSize: 12, lineSpacing: 3)),
                        ),
                      ],
                    ),
                  )),
              pw.SizedBox(height: 16),
            ],

            // ── الشرح ──
            if (lesson.sections.isNotEmpty) ...[
              _sectionHeader('الشرح والمفهوم', font),
              pw.SizedBox(height: 8),
              ...lesson.sections.map((s) => pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 10),
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey100,
                      borderRadius:
                          const pw.BorderRadius.all(pw.Radius.circular(6)),
                      border: pw.Border.all(
                          color: PdfColors.teal200, width: 0.5),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        if (s.heading != null) ...[
                          pw.Text(s.heading!,
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 13,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.teal800,
                              )),
                          pw.SizedBox(height: 6),
                        ],
                        pw.Text(s.content,
                            style: pw.TextStyle(
                                font: font, fontSize: 12, lineSpacing: 4)),
                        if (s.notes.isNotEmpty) ...[
                          pw.SizedBox(height: 6),
                          ...s.notes.map((n) => pw.Container(
                                margin:
                                    const pw.EdgeInsets.only(top: 4),
                                padding: const pw.EdgeInsets.all(6),
                                decoration: pw.BoxDecoration(
                                  color: PdfColors.amber50,
                                  borderRadius: const pw.BorderRadius.all(
                                      pw.Radius.circular(4)),
                                ),
                                child: pw.Text('💡 $n',
                                    style: pw.TextStyle(
                                        font: font,
                                        fontSize: 11,
                                        color: PdfColors.orange900)),
                              )),
                        ],
                      ],
                    ),
                  )),
              pw.SizedBox(height: 8),
            ],

            // ── الأمثلة ──
            if (lesson.examples.isNotEmpty) ...[
              _sectionHeader('الأمثلة المحلولة', font),
              pw.SizedBox(height: 8),
              ...lesson.examples.map((e) => pw.Container(
                    margin: const pw.EdgeInsets.only(bottom: 10),
                    padding: const pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                          color: PdfColors.amber300, width: 1),
                      borderRadius:
                          const pw.BorderRadius.all(pw.Radius.circular(6)),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          padding: const pw.EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: pw.BoxDecoration(
                            color: PdfColors.amber700,
                            borderRadius: const pw.BorderRadius.all(
                                pw.Radius.circular(4)),
                          ),
                          child: pw.Text('مثال ${e.number}',
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 10,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.bold,
                              )),
                        ),
                        pw.SizedBox(height: 8),
                        pw.Text(e.question,
                            style: pw.TextStyle(
                              font: font,
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                              lineSpacing: 4,
                            )),
                        pw.SizedBox(height: 6),
                        pw.Container(
                          width: double.infinity,
                          padding: const pw.EdgeInsets.all(8),
                          decoration: pw.BoxDecoration(
                            color: PdfColors.green50,
                            borderRadius: const pw.BorderRadius.all(
                                pw.Radius.circular(4)),
                          ),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              ...e.solutionSteps.map((s) => pw.Padding(
                                    padding:
                                        const pw.EdgeInsets.only(bottom: 3),
                                    child: pw.Text(s,
                                        style: pw.TextStyle(
                                            font: font,
                                            fontSize: 11,
                                            lineSpacing: 3)),
                                  )),
                              if (e.finalAnswer != null) ...[
                                pw.SizedBox(height: 6),
                                pw.Divider(
                                    color: PdfColors.green300, height: 1),
                                pw.SizedBox(height: 4),
                                pw.Text('الإجابة: ${e.finalAnswer}',
                                    style: pw.TextStyle(
                                      font: font,
                                      fontSize: 11,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.green900,
                                    )),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],

            // ── الملخص ──
            if (lesson.summary != null && lesson.summary!.isNotEmpty) ...[
              pw.SizedBox(height: 8),
              _sectionHeader('الملخص', font),
              pw.SizedBox(height: 8),
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(12),
                decoration: pw.BoxDecoration(
                  color: PdfColors.teal50,
                  borderRadius:
                      const pw.BorderRadius.all(pw.Radius.circular(6)),
                  border: pw.Border.all(color: PdfColors.teal300),
                ),
                child: pw.Text(lesson.summary!,
                    style: pw.TextStyle(
                        font: font, fontSize: 12, lineSpacing: 4)),
              ),
            ],
          ],
        ),
      );

      final bytes = await doc.save();
      await Printing.sharePdf(
        bytes: Uint8List.fromList(bytes),
        filename: '${lesson.id}_lesson.pdf',
      );
    } catch (e, st) {
      print('PDF error: $e\n$st');
      rethrow;
    }
  }

  // ── رأس قسم ──
  static pw.Widget _sectionHeader(String title, pw.Font font) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: pw.BoxDecoration(
        color: PdfColors.teal700,
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
      ),
      child: pw.Text(title,
          style: pw.TextStyle(
            font: font,
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.white,
          )),
    );
  }
}