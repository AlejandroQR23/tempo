# Typography

**Font:** [Manrope](https://fonts.google.com/specimen/Manrope), loaded via
the `google_fonts` package. One family for the entire type scale — weight
differentiates roles rather than mixing families.

Implemented in `lib/theme/typography.dart` as `AppTypography.textTheme`,
built on Flutter's named Material 3 scale (`displayLarge` → `labelSmall`)
with these roles retuned:

| Style | Weight | Notes | Example use |
|---|---|---|---|
| `displayLarge` | 800 | Tabular figures (`FontFeature.tabularFigures()`) so digits don't shift width as they change | Big centered timer readout |
| `headlineMedium` | 700 | — | Screen titles |
| `titleLarge` | 700 | — | Section/dialog titles |
| `bodyLarge` | 500 | — | Primary UI text |
| `bodyMedium` | 400 | Uses `onSurfaceVariant` | Secondary UI text |
| `labelSmall` | 600 | `letterSpacing: 1.2` | All-caps tag labels — e.g. "FOCUS", "SHORT BREAK" (apply `.toUpperCase()` at the call site; the token doesn't transform case) |

All other scale entries fall back to `GoogleFonts.manropeTextTheme`'s
defaults for the dark `ThemeData` base.

## Testing note

Tests that touch `AppTypography.textTheme` should call
`TestWidgetsFlutterBinding.ensureInitialized()` and set
`GoogleFonts.config.allowRuntimeFetching = false` before asserting, so the
test only inspects `TextStyle` metadata (family/weight/spacing) without
`google_fonts` attempting a real network font-file fetch.
