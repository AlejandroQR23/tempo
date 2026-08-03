import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tempo/theme/color_tokens.dart';

void main() {
  group('ColorTokens', () {
    test('surface family', () {
      expect(ColorTokens.background, const Color(0xFF0B0B16));
      expect(ColorTokens.surface, const Color(0xFF14152A));
      expect(ColorTokens.surfaceContainer, const Color(0xFF1F2041));
      expect(ColorTokens.surfaceContainerHigh, const Color(0xFF262849));
      expect(ColorTokens.outline, const Color(0xFF34366B));
      expect(ColorTokens.onSurface, const Color(0xFFF5F5FA));
      expect(ColorTokens.onSurfaceVariant, const Color(0xFF9A9BC0));
    });

    test('primary family', () {
      expect(ColorTokens.primary, const Color(0xFF6C6FD6));
      expect(ColorTokens.onPrimary, const Color(0xFF0B0B16));
      expect(ColorTokens.primaryContainer, const Color(0xFF1F2041));
      expect(ColorTokens.onPrimaryContainer, const Color(0xFFF5F5FA));
    });

    test('secondary family', () {
      expect(ColorTokens.secondary, const Color(0xFFFFC857));
      expect(ColorTokens.onSecondary, const Color(0xFF1F2041));
      expect(ColorTokens.secondaryContainer, const Color(0xFF4A3A12));
      expect(ColorTokens.onSecondaryContainer, const Color(0xFFFFDFA0));
    });

    test('success family', () {
      expect(ColorTokens.success, const Color(0xFF21A179));
      expect(ColorTokens.onSuccess, const Color(0xFF0B0B16));
      expect(ColorTokens.successContainer, const Color(0xFF123C30));
      expect(ColorTokens.onSuccessContainer, const Color(0xFF7CE0BE));
    });

    test('error family', () {
      expect(ColorTokens.error, const Color(0xFFE5484D));
      expect(ColorTokens.onError, const Color(0xFF0B0B16));
      expect(ColorTokens.errorContainer, const Color(0xFF9A031E));
      expect(ColorTokens.onErrorContainer, const Color(0xFFFFD9DC));
    });

    test('glow family', () {
      expect(ColorTokens.glowPrimary, const Color(0xFF6C6FD6));
      expect(ColorTokens.glowSecondary, const Color(0xFFFFC857));
    });
  });
}
