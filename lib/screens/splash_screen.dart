import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'book_intro_screen.dart';

/// ═══════════════════════════════════════════════════════════
/// شاشة الافتتاح
/// ═══════════════════════════════════════════════════════════
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoCtrl;
  late Animation<double> _logoFade;
  late Animation<double> _logoScale;

  late AnimationController _titleCtrl;
  late Animation<double> _titleFade;
  late Animation<Offset> _titleSlide;

  late AnimationController _infoCtrl;
  late Animation<double> _infoFade;

  @override
  void initState() {
    super.initState();

    _logoCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _logoFade = CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOut);
    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutBack));

    _titleCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _titleFade = CurvedAnimation(parent: _titleCtrl, curve: Curves.easeIn);
    _titleSlide = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _titleCtrl, curve: Curves.easeOutCubic));

    _infoCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _infoFade = CurvedAnimation(parent: _infoCtrl, curve: Curves.easeIn);

    _runSequence();
  }

  Future<void> _runSequence() async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;
    _logoCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _titleCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    _infoCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    _goToNext();
  }

  void _goToNext() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const BookIntroScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _titleCtrl.dispose();
    _infoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ استخدام MediaQuery بدلاً من LayoutBuilder
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;
    final logoSize = isWide ? 180.0 : 140.0;
    final titleSize = isWide ? 40.0 : 30.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppConstants.primaryColor, AppConstants.primaryDark],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spaceL,
                vertical: AppConstants.spaceM,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ── الشعار ──
                    FadeTransition(
                      opacity: _logoFade,
                      child: ScaleTransition(
                        scale: _logoScale,
                        child: Container(
                          width: logoSize,
                          height: logoSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.15),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.4),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.calculate_outlined,
                              size: logoSize * 0.55,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppConstants.spaceXL),

                    // ── اسم التطبيق ──
                    SlideTransition(
                      position: _titleSlide,
                      child: FadeTransition(
                        opacity: _titleFade,
                        child: Text(
                          AppConstants.appName,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.4,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppConstants.spaceM),

                    // ── خط ذهبي ──
                    FadeTransition(
                      opacity: _infoFade,
                      child: Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppConstants.secondaryColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppConstants.spaceM),

                    // ── الصف والمنهج ──
                    FadeTransition(
                      opacity: _infoFade,
                      child: Column(
                        children: [
                          Text(
                            AppConstants.grade,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: isWide ? 22 : 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppConstants.spaceXS),
                          Text(
                            AppConstants.curriculum,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: isWide ? 16 : 14,
                              color: Colors.white.withValues(alpha: 0.85),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppConstants.spaceXXL),

                    // ── اسم المصمم ──
                    FadeTransition(
                      opacity: _infoFade,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.spaceM,
                          vertical: AppConstants.spaceS,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                              AppConstants.radiusL),
                        ),
                        child: const Text(
                          AppConstants.designer,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
