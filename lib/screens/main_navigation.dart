import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'tabs/home_tab.dart';
import 'tabs/units_tab.dart';
import 'tabs/quiz_tab.dart';
import 'tabs/profile_tab.dart';
import 'teacher_tab.dart';

/// ═══════════════════════════════════════════════════════════
/// التنقل الرئيسي — Bottom Navigation (5 تبويبات)
/// ═══════════════════════════════════════════════════════════
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    UnitsTab(),
    TeacherTab(),   // ✅ جديد
    QuizTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    try {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: IndexedStack(index: _currentIndex, children: _tabs),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (i) {
              try {
                setState(() => _currentIndex = i);
              } catch (e) {
                debugPrint('Navigation error: $e');
              }
            },
            backgroundColor: Theme.of(context).cardColor,
            indicatorColor:
                AppConstants.primaryColor.withValues(alpha: 0.15),
            labelBehavior:
                NavigationDestinationLabelBehavior.alwaysShow,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home,
                    color: AppConstants.primaryColor),
                label: 'الرئيسية',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book,
                    color: AppConstants.primaryColor),
                label: 'الوحدات الدراسية',
              ),
              NavigationDestination(
                icon: Icon(Icons.school_outlined),
                selectedIcon: Icon(Icons.school,
                    color: AppConstants.primaryColor),
                label: 'تحضير الدروس ',
              ),
              NavigationDestination(
                icon: Icon(Icons.quiz_outlined),
                selectedIcon: Icon(Icons.quiz,
                    color: AppConstants.primaryColor),
                label: 'اختبار',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person,
                    color: AppConstants.primaryColor),
                label: 'الملف الشخصي',
              ),
            ],
          ),
        ),
      );
    } catch (e, st) {
      debugPrint('MainNavigation error: $e\n$st');
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text('حدث خطأ في التنقل',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 8),
                Text('$e',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Cairo', fontSize: 12)),
              ],
            ),
          ),
        ),
      );
    }
  }
}