# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This App Does

Tempo is a desktop time tracker (primary target: macOS) aimed at freelance/consulting
work. Instead of manually starting a stopwatch, the user configures which app (or
combo of apps, e.g. VS Code + Terminal, counting as one unit) should trigger tracking.
Tempo watches for when one of those apps is frontmost; the timer runs while a tracked
app has focus and pauses when focus moves away. Sessions are labeled by feature/ticket,
can carry an optional initial estimate, and accumulate against it.

This is also a learning project: `learning/overview.md` and `learning/phase-*.md`
document the curriculum this codebase is being built against, in deliberate
dependency order (widgets → async/timers → persistence/state management → native
platform integration → charting/reporting). Check `learning/overview.md`'s concept
graph before introducing a concept out of order (e.g. don't reach for Riverpod or
sqflite before the phase docs introduce them) unless the user explicitly asks for it.

## Commands

- Run the app (macOS): `flutter run -d macos`
- Static analysis / lint: `flutter analyze`
- Run all tests: `flutter test`
- Run a single test file: `flutter test test/theme/app_theme_test.dart`
- Run a single test by name: `flutter test --plain-name "test description"`
- Fetch/update packages: `flutter pub get`

## Tech Stack

- **Framework:** Flutter (Dart SDK ^3.12.2), desktop-first (macOS)
- **Fonts:** `google_fonts` (DM fonts, see `docs/design-system/typography.md`)
- **IDs:** `uuid` package for model identifiers
- **Lints:** `flutter_lints` via `analysis_options.yaml`
- Planned but not yet integrated (see `learning/overview.md`): `window_manager`
  (window behavior), `tray_manager` (menu bar presence), `sqflite` (local
  persistence), `flutter_riverpod` (app-wide state), `fl_chart` (estimate-vs-actual
  charts), and a macOS `NSWorkspace` platform channel (frontmost-app detection —
  the core feature).

## Architecture

- **Entry point:** `lib/main.dart` builds a single `MaterialApp` with `AppTheme.dark`
  and `Timer` (`lib/screens/timer.dart`) as home. Navigation elsewhere is plain
  `Navigator.push` with `MaterialPageRoute` — there is no named-route table or
  router package.
- **Screens** (`lib/screens/`) are `StatefulWidget`s that own their own in-memory
  list of models (e.g. `AppGroup` holds `List<TrackedAppGroup>` in `State`) and
  mutate it directly via `setState`. There is no shared state layer, store, or
  persistence yet — data does not survive navigating away from a screen. When
  state needs to be shared across screens or persisted, that's Riverpod (state)
  and sqflite (storage) per the phase docs — don't invent an ad hoc alternative.
- **Models** (`lib/models/`) are small immutable classes (`final` fields) with a
  `copyWith` method and a `uuid`-generated `id` defaulted in the constructor
  (`String? id`) so callers can omit it on create and preserve it on edit.
- **Add/edit dialogs** (`lib/widgets/*_dialog_form.dart`) are `showDialog` forms
  that return the created/updated model via `Navigator.pop(result)`; the owning
  screen's `_save*` method awaits the dialog and applies the result to its list
  in `setState`. New entity types should follow this same
  screen-owns-list + dialog-returns-model pattern rather than introducing a new
  one.
- **Theme** (`lib/theme/`) is the single source of styling truth, documented in
  `docs/design-system/`:
  - `color_tokens.dart` — raw color values (`ColorTokens`)
  - `tempo_colors.dart` — a `ThemeExtension` for colors outside Material's
    `ColorScheme` (e.g. the gold accent)
  - `typography.dart` — the `TextTheme` (DM fonts via `google_fonts`)
  - `app_theme.dart` — assembles the above into `AppTheme.dark`, plus
    component-level shape constants (`cardRadius`, `listRowCardRadius`)
  Screens/widgets consume theme via standard Material widgets (`AppBar`, `Card`,
  `FilledButton`, `TextFormField`, …) and inherited theme data — never hardcode
  colors or text styles inline. Read `docs/design-system/README.md` before
  changing anything under `lib/theme/`; it documents which doc maps to which
  implementation file and the design principles behind the values (dark-by-design,
  single gold accent, soft glow over Material elevation, pill-shaped controls).

## Key Conventions

**Commit format:** conventional-commit-style prefix, no emoji, e.g.:

```
feat: Add Timer screen with navigation to App Groups and Labels
learning: write phase docs
```

## Reference Files

| File                                             | Purpose                                                          |
| ------------------------------------------------- | ------------------------------------------------------------------ |
| `learning/overview.md`                           | Curriculum concept graph and phase breakdown for this project    |
| `learning/phase-*.md`                            | Per-phase learning goals, in dependency order                    |
| `docs/design-system/README.md`                   | Design system principles and doc-to-implementation-file mapping  |
| `docs/design-system/color.md`                    | Color token table and usage rules                                |
| `docs/design-system/typography.md`               | Font choice and type scale                                       |
| `docs/design-system/spacing-shape-elevation.md`  | Spacing grid, corner radii, elevation/glow rules                 |
| `docs/design-system/components.md`               | Component specs (buttons, cards, timer ring, dialogs, etc.)      |
