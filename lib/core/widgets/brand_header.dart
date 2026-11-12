import 'package:flutter/material.dart';

import '/core/theme/app_theme.dart';

/// Placa blanca con el logotipo oficial, legible sobre fondos oscuros.
class BrandLogo extends StatelessWidget {
  final double height;
  final bool withBorder;

  const BrandLogo({super.key, this.height = 36, this.withBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: height * 0.18, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: withBorder ? Border.all(color: AppColors.border) : null,
      ),
      child: SizedBox(
        width: height * 1.82,
        height: height,
        child: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          semanticLabel: 'Logotipo de Tlapalería App',
        ),
      ),
    );
  }
}

/// Encabezado de marca con fondo carbón, destellos naranja y diagonales.
class BrandHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  final Widget? trailing;
  final Widget? child;
  final bool showLogo;
  final EdgeInsetsGeometry padding;

  const BrandHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.trailing,
    this.child,
    this.showLogo = true,
    this.padding = const EdgeInsets.fromLTRB(20, 14, 20, 24),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(AppRadius.hero),
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.charcoal, AppColors.charcoalSoft],
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(painter: _HeaderPainter()),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (showLogo) ...[
                          const BrandLogo(height: 30),
                          const SizedBox(width: 14),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eyebrow.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: AppTheme.bodyFont,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.6,
                                  color: AppColors.brandOrangeLight,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontFamily: AppTheme.displayFont,
                                  fontSize: 26,
                                  height: 1.1,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (trailing != null) ...[
                          const SizedBox(width: 8),
                          trailing!,
                        ],
                      ],
                    ),
                    if (child != null) ...[const SizedBox(height: 18), child!],
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

class _HeaderPainter extends CustomPainter {
  const _HeaderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final glowCenter = Offset(size.width * 0.92, -size.height * 0.1);
    final glowRect = Rect.fromCircle(center: glowCenter, radius: 230);
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.brandOrange.withValues(alpha: 0.28),
          AppColors.brandOrange.withValues(alpha: 0),
        ],
      ).createShader(glowRect);
    canvas.drawCircle(glowCenter, 230, glowPaint);

    final stripePaint = Paint()
      ..color = AppColors.brandOrange.withValues(alpha: 0.6);
    canvas.save();
    canvas.translate(-32, -26);
    canvas.rotate(0.68);
    for (var i = 0; i < 3; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, i * 18.0, 110, 7),
          const Radius.circular(5),
        ),
        stripePaint,
      );
    }
    canvas.restore();

    final accentPaint = Paint()
      ..color = AppColors.brandOrange.withValues(alpha: 0.55);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width - 74, size.height - 10, 54, 4),
        const Radius.circular(4),
      ),
      accentPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
