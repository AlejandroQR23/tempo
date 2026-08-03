import 'package:flutter/material.dart';
import 'package:tempo/theme/color_tokens.dart';
import 'package:tempo/theme/tempo_colors.dart';
import 'package:tempo/theme/typography.dart';

/// Assembles Tempo's dark theme from the design tokens.
///
/// See docs/design-system/ for the full documented system — this file is
/// the implementation of that document, not a second source of truth for
/// values (all values come from ColorTokens/AppTypography).
class AppTheme {
  AppTheme._();

  /// Corner radius for large surfaces (the default for every [Card] —
  /// e.g. a future timer card).
  static const double cardRadius = 28;

  /// Corner radius for compact single-row cards (list rows in the App
  /// Groups/Labels screens). The default [cardRadius] reads as an
  /// over-rounded pill at that short a height, so these opt into a
  /// smaller explicit radius via `Card(shape: ...)`.
  static const double listRowCardRadius = 16;

  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      primary: ColorTokens.primary,
      onPrimary: ColorTokens.onPrimary,
      primaryContainer: ColorTokens.primaryContainer,
      onPrimaryContainer: ColorTokens.onPrimaryContainer,
      secondary: ColorTokens.secondary,
      onSecondary: ColorTokens.onSecondary,
      secondaryContainer: ColorTokens.secondaryContainer,
      onSecondaryContainer: ColorTokens.onSecondaryContainer,
      error: ColorTokens.error,
      onError: ColorTokens.onError,
      errorContainer: ColorTokens.errorContainer,
      onErrorContainer: ColorTokens.onErrorContainer,
      surface: ColorTokens.surface,
      onSurface: ColorTokens.onSurface,
      onSurfaceVariant: ColorTokens.onSurfaceVariant,
      outline: ColorTokens.outline,
      surfaceContainer: ColorTokens.surfaceContainer,
      surfaceContainerHigh: ColorTokens.surfaceContainerHigh,
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: ColorTokens.background,
      textTheme: AppTypography.textTheme,
      extensions: const <ThemeExtension<dynamic>>[TempoColors.dark],
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorTokens.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ColorTokens.onSurface,
      ),
      cardTheme: CardThemeData(
        color: ColorTokens.surfaceContainer,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardRadius),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorTokens.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: ColorTokens.primary,
          foregroundColor: ColorTokens.onPrimary,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorTokens.onSurfaceVariant,
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorTokens.surfaceContainerHigh,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorTokens.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorTokens.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorTokens.primary, width: 2),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: ColorTokens.onSurfaceVariant,
        textColor: ColorTokens.onSurface,
      ),
    );
  }
}
