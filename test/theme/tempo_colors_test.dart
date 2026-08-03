import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tempo/theme/color_tokens.dart';
import 'package:tempo/theme/tempo_colors.dart';

void main() {
  group('TempoColors', () {
    test('dark instance uses the design tokens', () {
      const colors = TempoColors.dark;

      expect(colors.success, ColorTokens.success);
      expect(colors.onSuccess, ColorTokens.onSuccess);
      expect(colors.successContainer, ColorTokens.successContainer);
      expect(colors.onSuccessContainer, ColorTokens.onSuccessContainer);
      expect(colors.glowPrimary, ColorTokens.glowPrimary);
      expect(colors.glowSecondary, ColorTokens.glowSecondary);
    });

    test('copyWith overrides only the given field', () {
      const colors = TempoColors.dark;
      final updated = colors.copyWith(success: Colors.black);

      expect(updated.success, Colors.black);
      expect(updated.onSuccess, colors.onSuccess);
      expect(updated.glowPrimary, colors.glowPrimary);
    });

    test("lerp at t=0 returns this instance's values, t=1 returns other's", () {
      const a = TempoColors.dark;
      const b = TempoColors(
        success: Colors.black,
        onSuccess: Colors.white,
        successContainer: Colors.black,
        onSuccessContainer: Colors.white,
        glowPrimary: Colors.black,
        glowSecondary: Colors.white,
      );

      final atStart = a.lerp(b, 0);
      final atEnd = a.lerp(b, 1);

      expect(atStart.success, a.success);
      expect(atEnd.success, b.success);
      expect(atEnd.glowSecondary, b.glowSecondary);
    });
  });
}
