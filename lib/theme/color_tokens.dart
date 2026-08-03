import 'package:flutter/material.dart';

/// Raw color values for the Tempo design system.
///
/// See docs/design-system/color.md for the full token table and usage
/// rules — this file only holds values, not usage guidance.
class ColorTokens {
  ColorTokens._();

  // Surfaces & neutrals.
  static const Color background = Color(0xFF0B0B16);
  static const Color surface = Color(0xFF14152A);
  static const Color surfaceContainer = Color(0xFF1F2041);
  static const Color surfaceContainerHigh = Color(0xFF262849);
  static const Color outline = Color(0xFF34366B);
  static const Color onSurface = Color(0xFFF5F5FA);
  static const Color onSurfaceVariant = Color(0xFF9A9BC0);

  // Primary (space indigo).
  static const Color primary = Color(0xFF6C6FD6);
  static const Color onPrimary = Color(0xFF0B0B16);
  static const Color primaryContainer = Color(0xFF1F2041);
  static const Color onPrimaryContainer = Color(0xFFF5F5FA);

  // Secondary (golden).
  static const Color secondary = Color(0xFFFFC857);
  static const Color onSecondary = Color(0xFF1F2041);
  static const Color secondaryContainer = Color(0xFF4A3A12);
  static const Color onSecondaryContainer = Color(0xFFFFDFA0);

  // Success (emerald green).
  static const Color success = Color(0xFF21A179);
  static const Color onSuccess = Color(0xFF0B0B16);
  static const Color successContainer = Color(0xFF123C30);
  static const Color onSuccessContainer = Color(0xFF7CE0BE);

  // Error (crimson red).
  static const Color error = Color(0xFFE5484D);
  static const Color onError = Color(0xFF0B0B16);
  static const Color errorContainer = Color(0xFF9A031E);
  static const Color onErrorContainer = Color(0xFFFFD9DC);

  // Glow accents (used at low opacity behind active/emphasized elements).
  static const Color glowPrimary = Color(0xFF6C6FD6);
  static const Color glowSecondary = Color(0xFFFFC857);
}
