import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart';
import '../../data/book_info_data.dart';

/// ═══════════════════════════════════════════════════════════
/// تبويب الملف الشخصي — اتصل بنا
/// ═══════════════════════════════════════════════════════════
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final theme = Theme.of(context);
      return Scaffold(
        appBar: AppBar(title: const Text('اتصل بنا')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.spaceL),
            child: Column(
              children: [
                const SizedBox(height: AppConstants.spaceM),

                // ── أيقونة ──
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppConstants.primaryColor.withValues(alpha: 0.12),
                  ),
                  child: const Icon(Icons.person,
                      size: 56, color: AppConstants.primaryColor),
                ),

                const SizedBox(height: AppConstants.spaceM),

                Text(
                  bookInfo.authorLine,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.spaceS),
                Text(
                  '${bookInfo.grade} — ${bookInfo.yearGregorian}',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppConstants.spaceXXL),

                // ── بطاقات التواصل ──
                if (bookInfo.phone != null && bookInfo.phone!.isNotEmpty)
                  _contactTile(
                    context,
                    icon: Icons.phone,
                    title: 'الهاتف',
                    subtitle: bookInfo.phone!,
                    color: AppConstants.successColor,
                    onTap: () => _callPhone(bookInfo.phone!),
                  ),
                const SizedBox(height: AppConstants.spaceM),

                if (bookInfo.whatsapp != null && bookInfo.whatsapp!.isNotEmpty)
                  _contactTile(
                    context,
                    icon: Icons.chat,
                    title: 'واتساب',
                    subtitle: bookInfo.whatsapp!,
                    color: const Color(0xFF25D366),
                    onTap: () => _openWhatsApp(bookInfo.whatsapp!),
                  ),

                if (bookInfo.address != null && bookInfo.address!.isNotEmpty)
                  _contactTile(
                    context,
                    icon: Icons.location_on,
                    title: 'العنوان',
                    subtitle: bookInfo.address!,
                    color: AppConstants.warningColor,
                    onTap: () => _showAddress(context),
                  ),

                const SizedBox(height: AppConstants.spaceXXL),

                
              ],
            ),
          ),
        ),
      );
    } catch (e, st) {
      debugPrint('ProfileTab error: $e\n$st');
      return Scaffold(
        appBar: AppBar(title: const Text('خطأ')),
        body: Center(child: Text('حدث خطأ: $e')),
      );
    }
  }

  // ── بطاقة تواصل ──
  Widget _contactTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.radiusM),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spaceM),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: Border.all(color: color.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withValues(alpha: 0.12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: AppConstants.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: AppConstants.fontS,
                        color: color,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            Icon(Icons.arrow_back_ios_new,
                size: 14, color: color.withValues(alpha: 0.5)),
          ],
        ),
      ),
    );
  }

  // ── فتح الاتصال ──
  Future<void> _callPhone(String phone) async {
    try {
      final uri = Uri.parse('tel:$phone');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      debugPrint('call error: $e');
    }
  }

  // ── فتح واتساب ──
  Future<void> _openWhatsApp(String phone) async {
    try {
      final cleanPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');
      final fullPhone = cleanPhone.startsWith('218')
          ? cleanPhone
          : '218$cleanPhone';
      final uri = Uri.parse('https://wa.me/$fullPhone');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('whatsapp error: $e');
    }
  }

  // ── عرض العنوان ──
  void _showAddress(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.location_on, color: AppConstants.warningColor),
            SizedBox(width: 8),
            Text('العنوان'),
          ],
        ),
        content: Text(bookInfo.address ?? ''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}