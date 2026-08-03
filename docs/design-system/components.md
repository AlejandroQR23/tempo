# Components

## Buttons

- **Primary** — filled pill: `primary` fill / `onPrimary` text.
  `FilledButton` picks this up automatically via `filledButtonTheme`.
- **Secondary** — tonal pill: `secondaryContainer` fill /
  `onSecondaryContainer` text. Build with
  `FilledButton.styleFrom(backgroundColor: ..., foregroundColor: ...)`
  passing the secondary-container tokens (no separate Flutter button
  theme role — Material only themes one "filled" button type globally).
- **Text button** — `onSurfaceVariant` text, pill shape, no fill.
  `TextButton` picks this up via `textButtonTheme`.
- **Action pill (neutral)** — `surfaceContainerHigh` fill / `onSurface`
  text. Matches the mockup's START/PAUSE/settings buttons. Build with
  `FilledButton.styleFrom(backgroundColor: ColorTokens.surfaceContainerHigh, foregroundColor: ColorTokens.onSurface)`
  where a screen needs this variant (e.g. the Timer screen's primary
  controls) — there's no dedicated Flutter theme role for a third button
  style, so it's built per-call-site from the tokens.

## Cards

Base `Card` uses `surfaceContainer` fill and `28px` radius
(`AppTheme.cardRadius`) via `cardTheme` — right for a large surface (e.g.
a future timer card). An "active" card variant (e.g. a running timer)
wraps the card in a `Container` with a glow `BoxShadow` (see
`spacing-shape-elevation.md`) — themed globally for shape/fill, glow
applied per-instance since it's conditional on state, not a static style.

Compact single-row cards (the App Groups/Labels list rows) override to
the tighter `16px` radius (`AppTheme.listRowCardRadius`) explicitly via
`Card(shape: ...)`, since `28px` reads as an over-rounded pill at that
row height rather than a rounded rectangle.

## Timer ring

Not yet built (Timer screen is still placeholder buttons) — spec for when
it is:

- `CircularProgressIndicator` (or a custom painter for a thicker ring):
  - Track color: `outline`.
  - Progress arc color: `secondary` (gold).
  - Center content: `displayLarge` digits (Manrope 800, tabular figures)
    with a `labelSmall` state tag below (e.g. "FOCUS"), using
    `onSurfaceVariant`.

## Dialogs & forms

Applies to the existing `AppGroupDialogForm` and `LabelsDialogForm`:
`surface` background and `24px` radius via `dialogTheme` (both use
`Dialog`/`AlertDialog`, both inherit this automatically). Text inputs
(`TextFormField`) get filled `surfaceContainerHigh` backgrounds with
`12px`-radius `outline`-colored borders via `inputDecorationTheme`,
already wired via `AppTheme.dark` — no per-form changes needed.

## App bar

Transparent-tinted, `background`-colored, no elevation shadow,
`onSurface` title/icon color — via `appBarTheme`. Applies automatically
to every screen's `AppBar` (Timer, App Groups, Labels).

## List items

`ListTile` theming (Labels/AppGroup screens' list rows):
`onSurfaceVariant` icon color, `onSurface` text color via
`listTileTheme`. Rows already sit inside `Card`s
(`surfaceContainer`/`28px`), so no additional per-tile background is set.

## Badges/tags

No dedicated Flutter theme role for chips yet (none exist in the app).
When needed, build a small pill (`999px` radius) using
`successContainer`/`errorContainer`/`secondaryContainer` fill with the
matching `on*Container` text color, per the semantic meaning of the
badge (success/error/accent) — never decorative.
