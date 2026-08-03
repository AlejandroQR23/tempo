import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tempo/theme/app_theme.dart';
import 'package:tempo/theme/color_tokens.dart';
import 'package:tempo/theme/tempo_colors.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  group('AppTheme.dark', () {
    test('maps ColorScheme roles to design tokens', () {
      final scheme = AppTheme.dark.colorScheme;

      expect(scheme.primary, ColorTokens.primary);
      expect(scheme.secondary, ColorTokens.secondary);
      expect(scheme.error, ColorTokens.error);
      expect(scheme.errorContainer, ColorTokens.errorContainer);
      expect(scheme.surface, ColorTokens.surface);
      expect(scheme.surfaceContainer, ColorTokens.surfaceContainer);
      expect(AppTheme.dark.scaffoldBackgroundColor, ColorTokens.background);
    });

    test('exposes the TempoColors extension with the dark values', () {
      final tempoColors = AppTheme.dark.extension<TempoColors>();

      expect(tempoColors, isNotNull);
      expect(tempoColors!.success, ColorTokens.success);
      expect(tempoColors.glowSecondary, ColorTokens.glowSecondary);
    });

    test('cards default to a 28px rounded rectangle on the surfaceContainer color', () {
      final cardTheme = AppTheme.dark.cardTheme;
      final shape = cardTheme.shape as RoundedRectangleBorder;

      expect(cardTheme.color, ColorTokens.surfaceContainer);
      expect(shape.borderRadius, BorderRadius.circular(AppTheme.cardRadius));
      expect(AppTheme.cardRadius, 28);
    });

    test('exposes a tighter radius constant for compact list-row cards', () {
      expect(AppTheme.listRowCardRadius, 16);
    });

    test('dialogs use a 24px rounded rectangle on the surface color', () {
      final dialogTheme = AppTheme.dark.dialogTheme;
      final shape = dialogTheme.shape as RoundedRectangleBorder;

      expect(dialogTheme.backgroundColor, ColorTokens.surface);
      expect(shape.borderRadius, BorderRadius.circular(24));
    });

    test('filled buttons are pill-shaped', () {
      final shape = AppTheme.dark.filledButtonTheme.style?.shape?.resolve(
        <WidgetState>{},
      );

      expect(shape, isA<StadiumBorder>());
    });

    test('text inputs are filled with a 12px rounded border', () {
      final decoration = AppTheme.dark.inputDecorationTheme;
      final border = decoration.border as OutlineInputBorder;

      expect(decoration.filled, isTrue);
      expect(decoration.fillColor, ColorTokens.surfaceContainerHigh);
      expect(border.borderRadius, BorderRadius.circular(12));
    });
  });
}
