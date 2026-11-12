import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/routes/app_routes.dart';
import '/core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      final route = ModalRoute.of(context);
      if (route != null && !route.isCurrent) return;
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.lightStatusIcons,
      child: Scaffold(
        backgroundColor: AppColors.charcoal,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0.95, -0.75),
                    radius: 1.05,
                    colors: [Color(0x42FF8A00), Color(0x00FF8A00)],
                  ),
                ),
              ),
            ),
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-1.0, 1.05),
                    radius: 0.9,
                    colors: [Color(0x1AFF8A00), Color(0x00FF8A00)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -8,
              left: -18,
              child: IgnorePointer(
                child: SizedBox(
                  width: 250,
                  height: 160,
                  child: ClipRect(
                    child: CustomPaint(painter: _DiagonalPainter()),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 24, 28, 28),
                child: Column(
                  children: [
                    const Spacer(),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 480),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 18 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(AppRadius.xl),
                              boxShadow: AppShadows.floating,
                            ),
                            child: Image.asset(
                              'assets/images/Logo.png',
                              height: 104,
                              fit: BoxFit.contain,
                              semanticLabel: 'Tlapalería App',
                            ),
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            'Tlapalería App',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.displayFont,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.6,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 132,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.brandOrange,
                                  AppColors.primaryOrange,
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Tu tlapalería en la palma de tu mano',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.bodyFont,
                              fontSize: 13.5,
                              height: 1.4,
                              color: Color(0xB3FFFFFF),
                            ),
                          ),
                          const SizedBox(height: 36),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: const SizedBox(
                              width: 168,
                              child: LinearProgressIndicator(
                                minHeight: 4,
                                backgroundColor: Color(0x24FFFFFF),
                                color: AppColors.brandOrange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Preparando tu mostrador...',
                            style: TextStyle(
                              fontFamily: AppTheme.bodyFont,
                              fontSize: 11.5,
                              letterSpacing: 0.2,
                              color: Color(0x80FFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Proyecto Final Flutter · v1.0.0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.bodyFont,
                        fontSize: 11,
                        color: Color(0x66FFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.brandOrange.withValues(alpha: 0.55);
    canvas.save();
    canvas.translate(-24, 16);
    canvas.rotate(0.68);
    for (var i = 0; i < 3; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, i * 26.0, 250, 9),
          const Radius.circular(6),
        ),
        paint,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
