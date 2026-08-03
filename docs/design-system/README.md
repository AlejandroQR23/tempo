# Tempo Design System

A dark, distinctive design system for Tempo — replacing Flutter's default
Material seed-color theme. Implemented in `lib/theme/`; this directory is
the reference documentation for it.

## Principles

- **Dark by design, not dimmed light.** Surfaces are near-black with a
  cool indigo undertone, not a darkened version of a light palette.
- **One accent, used deliberately.** Gold is the single "in progress /
  accent" color (e.g. the timer's progress ring). Green and red are
  reserved strictly for success and error — never used decoratively.
- **Soft glow instead of heavy elevation.** Surfaces are mostly flat;
  emphasis comes from a soft blurred colored shadow on active/important
  elements, not stacked Material elevation shadows.
- **Rounded, pill-shaped controls.** Cards, dialogs, and especially
  buttons favor large radii — buttons are fully rounded (stadium/pill)
  rather than the slightly-rounded rectangles of default Material.

## Documents

- [`color.md`](color.md) — full color token table and usage rules.
- [`typography.md`](typography.md) — font choice and type scale.
- [`spacing-shape-elevation.md`](spacing-shape-elevation.md) — spacing
  grid, corner radii, and elevation/glow rules.
- [`components.md`](components.md) — specs for buttons, cards, the timer
  ring, dialogs/forms, app bar, list items, and badges.

## Implementation

| Doc | Implemented in |
|---|---|
| `color.md` | `lib/theme/color_tokens.dart`, `lib/theme/tempo_colors.dart` |
| `typography.md` | `lib/theme/typography.dart` |
| `spacing-shape-elevation.md`, `components.md` | `lib/theme/app_theme.dart` |

`lib/main.dart` applies the theme via `MaterialApp(theme: AppTheme.dark)`.
Screens don't reference colors/styles directly — they use standard
Material widgets (`AppBar`, `Card`, `FilledButton`, `TextFormField`, …)
and inherit this theme automatically.

Currently dark-mode only; there is no light theme or theme switching.
