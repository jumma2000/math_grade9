import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ═══════════════════════════════════════════════════════════
/// أداة الخروج من التطبيق
/// - على الجوال: يُغلق التطبيق فعلياً
/// - على الويب: يعرض رسالة شكر
/// ═══════════════════════════════════════════════════════════
class ExitHelper {
  ExitHelper._();

  /// عرض حوار تأكيد الخروج
  static Future<void> showExitDialog(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(
          Icons.exit_to_app,
          size: 40,
          color: Color(0xFFD84315),
        ),
        title: const Text(
          'الخروج من التطبيق',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'هل تريد الخروج من التطبيق؟',
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          // زر "لا"
          OutlinedButton.icon(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            icon: const Icon(Icons.close, size: 18),
            label: const Text('لا'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey.shade700,
              side: BorderSide(color: Colors.grey.shade400),
            ),
          ),

          // زر "نعم"
          ElevatedButton.icon(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            icon: const Icon(Icons.exit_to_app, size: 18),
            label: const Text('نعم، اخرج'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD84315),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );

    if (shouldExit == true && context.mounted) {
      _performExit(context);
    }
  }

  /// تنفيذ الخروج حسب المنصة
  static void _performExit(BuildContext context) {
    if (kIsWeb) {
      // على الويب — نعرض رسالة شكر
      _showWebExitMessage(context);
    } else {
      // على الجوال/سطح المكتب — نُغلق التطبيق
      SystemNavigator.pop();
    }
  }

  /// رسالة على الويب — لا يمكن إغلاق التبويب برمجياً
  static void _showWebExitMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        icon: const Icon(
          Icons.check_circle_outline,
          size: 48,
          color: Color(0xFF43A047),
        ),
        title: const Text(
          'شكراً لك 💚',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'يمكنك الآن إغلاق هذا التبويب يدوياً.\n\n'
          'نتمنى لك التوفيق في دراستك!',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}