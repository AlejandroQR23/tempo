# Spacing, shape & elevation

## Spacing

4px base grid: `4, 8, 12, 16, 24, 32, 48, 64`. Applied directly as
`EdgeInsets`/`SizedBox` values in screens — there is no `AppSpacing`
constants class yet (no screen currently needs shared spacing constants;
add one if that changes rather than pre-building it).

## Shape

| Element | Radius |
|---|---|
| Cards (large surfaces — default) | `28px` (`AppTheme.cardRadius`) |
| Cards (compact single-row — list rows) | `16px` (`AppTheme.listRowCardRadius`) |
| Dialogs | `24px` |
| Text inputs | `12px` |
| Buttons | Stadium/pill (fully rounded) |
| Badges/chips | `999px` (fully rounded) |

`28px` is `cardTheme`'s default shape — right for a large surface (e.g. a
future timer card), but on a short single-line row it reads as an
over-rounded pill rather than a rounded rectangle. List rows (the App
Groups/Labels screens) opt into the tighter `16px` radius explicitly via
`Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.listRowCardRadius)))`
rather than changing the shared default.

Implemented via `cardTheme.shape`, `dialogTheme.shape`,
`inputDecorationTheme.border`, and `filledButtonTheme`/`textButtonTheme`
`shape: StadiumBorder()` in `lib/theme/app_theme.dart`.

## Elevation & glow

Surfaces are mostly flat — dark surfaces don't rely on Material's
drop-shadow elevation to read as "raised" the way light surfaces do.
Cards use a small elevation (2) for a subtle resting shadow; the app bar
is flat (elevation 0).

A **glow** — a soft, large-blur colored shadow at low opacity, using
`TempoColors.glowPrimary` or `TempoColors.glowSecondary` — is reserved for
active/emphasized elements only (the running timer card, a focused
primary action), not applied globally. This isn't a `ThemeData` property;
apply it per-widget with a `BoxShadow` when a component needs to signal
emphasis, e.g.:

```dart
BoxShadow(
  color: tempoColors.glowSecondary.withValues(alpha: 0.35),
  blurRadius: 32,
  spreadRadius: 4,
)
```
