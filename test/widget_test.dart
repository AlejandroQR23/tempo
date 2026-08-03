import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tempo/main.dart';
import 'package:tempo/theme/color_tokens.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets(
    'MyApp renders the Timer screen using the dark design system theme',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Timer'), findsWidgets);

      final materialApp = tester.widget<MaterialApp>(
        find.byType(MaterialApp),
      );
      expect(
        materialApp.theme?.scaffoldBackgroundColor,
        ColorTokens.background,
      );
      expect(materialApp.theme?.colorScheme.primary, ColorTokens.primary);
    },
  );
}
