# Color

Source palette:

| Name | Hex | Role |
|---|---|---|
| Space Indigo | `#1F2041` | Primary |
| Golden | `#FFC857` | Secondary |
| Emerald Green | `#21A179` | Success |
| Crimson Red | `#9A031E` | Error |

The literal indigo swatch becomes the **card/surface color**
(`surfaceContainer`), not a bright interactive color — Material's
`primary` role needs a *light*, legible tone in a dark scheme, so it gets
a lighter tint derived from indigo instead; the deep brand color lives in
`primaryContainer`.

## Tokens

| Token | Hex | Dart constant | Used for |
|---|---|---|---|
| `background` | `#0B0B16` | `ColorTokens.background` | App canvas (near-black, cool undertone) |
| `surface` | `#14152A` | `ColorTokens.surface` | Base surface, dialogs |
| `surfaceContainer` | `#1F2041` | `ColorTokens.surfaceContainer` | Cards — the literal "space indigo" swatch |
| `surfaceContainerHigh` | `#262849` | `ColorTokens.surfaceContainerHigh` | Elevated/hover surfaces, filled inputs |
| `outline` | `#34366B` | `ColorTokens.outline` | Borders, dividers, ring track |
| `onSurface` | `#F5F5FA` | `ColorTokens.onSurface` | Primary text |
| `onSurfaceVariant` | `#9A9BC0` | `ColorTokens.onSurfaceVariant` | Secondary/muted text (e.g. "FOCUS" labels) |
| `primary` | `#6C6FD6` | `ColorTokens.primary` | Interactive accents, focus rings, links |
| `onPrimary` | `#0B0B16` | `ColorTokens.onPrimary` | Text/icons on primary fills |
| `primaryContainer` | `#1F2041` | `ColorTokens.primaryContainer` | Filled brand surfaces |
| `onPrimaryContainer` | `#F5F5FA` | `ColorTokens.onPrimaryContainer` | Text/icons on primaryContainer |
| `secondary` | `#FFC857` | `ColorTokens.secondary` | Golden accent — progress ring, highlights, badges |
| `onSecondary` | `#1F2041` | `ColorTokens.onSecondary` | Text/icons on gold fills |
| `secondaryContainer` | `#4A3A12` | `ColorTokens.secondaryContainer` | Muted gold fill (subtle secondary surfaces) |
| `onSecondaryContainer` | `#FFDFA0` | `ColorTokens.onSecondaryContainer` | Text/icons on secondaryContainer |
| `success` | `#21A179` | `ColorTokens.success` / `TempoColors.success` | Success text/icons |
| `onSuccess` | `#0B0B16` | `ColorTokens.onSuccess` / `TempoColors.onSuccess` | Text/icons on success fills |
| `successContainer` | `#123C30` | `ColorTokens.successContainer` / `TempoColors.successContainer` | Success badge backgrounds |
| `onSuccessContainer` | `#7CE0BE` | `ColorTokens.onSuccessContainer` / `TempoColors.onSuccessContainer` | Text/icons on successContainer |
| `error` | `#E5484D` | `ColorTokens.error` | Error text/icons (lightened for contrast on dark bg) |
| `onError` | `#0B0B16` | `ColorTokens.onError` | Text/icons on error fills |
| `errorContainer` | `#9A031E` | `ColorTokens.errorContainer` | Error fills/badges — the literal swatch |
| `onErrorContainer` | `#FFD9DC` | `ColorTokens.onErrorContainer` | Text/icons on errorContainer |
| `glowPrimary` | `#6C6FD6` | `TempoColors.glowPrimary` | Soft accent shadow, primary-themed elements |
| `glowSecondary` | `#FFC857` | `TempoColors.glowSecondary` | Soft accent shadow, secondary/accent-themed elements (e.g. active timer) |

`success`/`onSuccess`/`successContainer`/`onSuccessContainer`/`glowPrimary`/
`glowSecondary` have no Material `ColorScheme` role — access them via
`Theme.of(context).extension<TempoColors>()`.

## Usage rules

- **Gold is the accent.** Anything communicating "active" or "in
  progress" (a running timer, a progress arc) uses `secondary`/gold —
  never `error`/red.
- **Red is only for errors.** Destructive actions, validation errors,
  failed states. Never used decoratively or for "active."
- **Green is only for success.** Confirmations, completed states. Never
  used as a generic accent.
- **`surfaceContainer` is the card color**, not `primaryContainer` — even
  though both currently resolve to the same hex — because a future retint
  of the brand color shouldn't also change every card's background.
