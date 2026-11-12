import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Paleta de marca de Tlapalería App.
///
/// El naranja vibrante se reserva para acentos y gradientes; el naranja
/// profundo garantiza contraste AA cuando hay texto encima.
class AppColors {
  const AppColors._();

  static const Color brandOrange = Color(0xFFFF8A00);
  static const Color brandOrangeLight = Color(0xFFFFB25C);
  static const Color primaryOrange = Color(0xFFC2410C);
  static const Color orangeDeep = Color(0xFF9A3412);
  static const Color orangeTint = Color(0xFFFFF1E0);
  static const Color orangeTintStrong = Color(0xFFFFE0BC);

  static const Color charcoal = Color(0xFF151515);
  static const Color charcoalSoft = Color(0xFF23201D);
  static const Color ink = Color(0xFF1C1917);
  static const Color inkMuted = Color(0xFF6B6560);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF7F7F8);
  static const Color surfaceMuted = Color(0xFFF2EFEA);
  static const Color border = Color(0xFFE7E5E4);

  static const Color success = Color(0xFF15803D);
  static const Color danger = Color(0xFFDC2626);
}

/// Radios y espaciados compartidos para mantener ritmo visual.
class AppRadius {
  const AppRadius._();

  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double hero = 28;

  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlAll = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius heroAll = BorderRadius.all(Radius.circular(hero));
}

class AppShadows {
  const AppShadows._();

  static const List<BoxShadow> card = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 18, offset: Offset(0, 6)),
  ];

  static const List<BoxShadow> floating = [
    BoxShadow(color: Color(0x14000000), blurRadius: 24, offset: Offset(0, 10)),
  ];
}

class AppTheme {
  /// Alias conservados para el resto del proyecto.
  static const Color brandOrange = AppColors.brandOrange;
  static const Color primaryOrange = AppColors.primaryOrange;

  static const String displayFont = 'Outfit';
  static const String bodyFont = 'Inter';

  static const SystemUiOverlayStyle darkStatusIcons = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.surface,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle lightStatusIcons = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.charcoal,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static ThemeData light() {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryOrange,
      onPrimary: Colors.white,
      primaryContainer: AppColors.orangeTint,
      onPrimaryContainer: AppColors.orangeDeep,
      secondary: AppColors.charcoal,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.orangeTintStrong,
      onSecondaryContainer: AppColors.orangeDeep,
      tertiary: AppColors.brandOrange,
      onTertiary: AppColors.charcoal,
      error: AppColors.danger,
      onError: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.ink,
      surfaceContainerHighest: AppColors.surfaceMuted,
      onSurfaceVariant: AppColors.inkMuted,
      outline: Color(0xFFA8A29E),
      outlineVariant: AppColors.border,
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: AppColors.charcoal,
      onInverseSurface: Color(0xFFF5F5F4),
      inversePrimary: AppColors.brandOrangeLight,
      surfaceTint: Colors.transparent,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _textTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.ink,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle: darkStatusIcons,
        titleTextStyle: const TextStyle(
          fontFamily: displayFont,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        iconTheme: const IconThemeData(color: AppColors.ink),
        actionsIconTheme: const IconThemeData(color: AppColors.ink),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceMuted,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        hintStyle: const TextStyle(
          fontFamily: bodyFont,
          color: AppColors.inkMuted,
          fontSize: 14,
        ),
        prefixIconColor: AppColors.inkMuted,
        suffixIconColor: AppColors.inkMuted,
        border: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.primaryOrange, width: 1.6),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.danger, width: 1.6),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 52),
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.orangeTintStrong,
          disabledForegroundColor: AppColors.orangeDeep,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
          textStyle: const TextStyle(
            fontFamily: displayFont,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 48),
          foregroundColor: AppColors.primaryOrange,
          side: const BorderSide(color: AppColors.border),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
          textStyle: const TextStyle(
            fontFamily: bodyFont,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryOrange,
          minimumSize: const Size(0, 44),
          textStyle: const TextStyle(
            fontFamily: bodyFont,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.ink,
          highlightColor: AppColors.orangeTint,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.orangeTint,
        selectedColor: AppColors.primaryOrange,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        labelStyle: const TextStyle(
          fontFamily: bodyFont,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.orangeDeep,
        ),
        secondaryLabelStyle: const TextStyle(
          fontFamily: bodyFont,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.charcoal,
        contentTextStyle: const TextStyle(
          fontFamily: bodyFont,
          color: Colors.white,
          fontSize: 14,
        ),
        actionTextColor: AppColors.brandOrange,
        elevation: 8,
        insetPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.xlAll),
        titleTextStyle: TextStyle(
          fontFamily: displayFont,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        contentTextStyle: TextStyle(
          fontFamily: bodyFont,
          fontSize: 14,
          height: 1.45,
          color: AppColors.inkMuted,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryOrange,
        linearTrackColor: AppColors.orangeTintStrong,
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.primaryOrange,
        textColor: Colors.white,
        textStyle: TextStyle(
          fontFamily: bodyFont,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.charcoal,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontFamily: bodyFont,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.inkMuted,
      ),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 56,
        fontWeight: FontWeight.w800,
        height: 1.05,
        letterSpacing: -1.5,
        color: AppColors.ink,
      ),
      displayMedium: TextStyle(
        fontFamily: displayFont,
        fontSize: 44,
        fontWeight: FontWeight.w800,
        height: 1.08,
        letterSpacing: -1,
        color: AppColors.ink,
      ),
      displaySmall: TextStyle(
        fontFamily: displayFont,
        fontSize: 36,
        fontWeight: FontWeight.w800,
        height: 1.1,
        letterSpacing: -0.8,
        color: AppColors.ink,
      ),
      headlineLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 30,
        fontWeight: FontWeight.w800,
        height: 1.15,
        letterSpacing: -0.5,
        color: AppColors.ink,
      ),
      headlineMedium: TextStyle(
        fontFamily: displayFont,
        fontSize: 26,
        fontWeight: FontWeight.w800,
        height: 1.18,
        letterSpacing: -0.3,
        color: AppColors.ink,
      ),
      headlineSmall: TextStyle(
        fontFamily: displayFont,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.ink,
      ),
      titleLarge: TextStyle(
        fontFamily: displayFont,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: AppColors.ink,
      ),
      titleMedium: TextStyle(
        fontFamily: displayFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: AppColors.ink,
      ),
      titleSmall: TextStyle(
        fontFamily: displayFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: AppColors.ink,
      ),
      bodyLarge: TextStyle(
        fontFamily: bodyFont,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.45,
        color: AppColors.ink,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.45,
        color: AppColors.ink,
      ),
      bodySmall: TextStyle(
        fontFamily: bodyFont,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: AppColors.inkMuted,
      ),
      labelLarge: TextStyle(
        fontFamily: bodyFont,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: AppColors.ink,
      ),
      labelMedium: TextStyle(
        fontFamily: bodyFont,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.2,
        color: AppColors.ink,
      ),
      labelSmall: TextStyle(
        fontFamily: bodyFont,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.3,
        color: AppColors.inkMuted,
      ),
    );
  }
}
