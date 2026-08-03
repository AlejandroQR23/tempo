import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tempo/theme/color_tokens.dart';

/// Tempo's type scale: Manrope throughout, weight differentiates roles.
///
/// See docs/design-system/typography.md for the full scale and usage.
class AppTypography {
  AppTypography._();

  static TextTheme get textTheme {
    final base = GoogleFonts.manropeTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    );

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w800,
        color: ColorTokens.onSurface,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: ColorTokens.onSurface,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: ColorTokens.onSurface,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: ColorTokens.onSurface,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
        color: ColorTokens.onSurfaceVariant,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: ColorTokens.onSurfaceVariant,
      ),
    );
  }
}
