import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tempo/theme/typography.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Tests only inspect TextStyle metadata (family/weight/spacing), never
  // render glyphs, so skip google_fonts' runtime font-file fetch — it
  // would otherwise hit the network on every test run.
  GoogleFonts.config.allowRuntimeFetching = false;

  group('AppTypography.textTheme', () {
    test('uses Manrope with weight 800 and tabular figures for displayLarge', () {
      final style = AppTypography.textTheme.displayLarge!;

      expect(style.fontFamily, contains('Manrope'));
      expect(style.fontWeight, FontWeight.w800);
      expect(style.fontFeatures, contains(const FontFeature.tabularFigures()));
    });

    test('bodyLarge is weight 500, bodyMedium is weight 400', () {
      expect(AppTypography.textTheme.bodyLarge!.fontWeight, FontWeight.w500);
      expect(AppTypography.textTheme.bodyMedium!.fontWeight, FontWeight.w400);
    });

    test('labelSmall is weight 600 with 1.2 letter-spacing', () {
      final style = AppTypography.textTheme.labelSmall!;

      expect(style.fontWeight, FontWeight.w600);
      expect(style.letterSpacing, 1.2);
    });
  });
}
