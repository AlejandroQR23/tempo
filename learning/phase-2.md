# Phase 2: Async Dart & manual timer mechanics

## Approach

Before any OS automation exists, prove out the timer itself: a session that
starts, ticks visibly, and stops, triggered manually by a button rather than
by focus detection. This deliberately separates "how does a running timer
actually work in Dart" from "how do we detect the right moment to start
it" — Phase 4 will swap the manual trigger for an automatic one without
touching the ticking mechanism itself.

## Libraries / tools used this phase

- Flutter SDK / Dart core `async` library only — [Asynchronous programming](https://dart.dev/libraries/async/async-await)

## Required knowledge

Concepts from the graph in overview.md this phase assumes or introduces:

- **StatefulWidget & `setState`** (introduced) — [State.setState](https://api.flutter.dev/flutter/widgets/State/setState.html)
- **Async Dart (Future, Timer, Stream, async/await)** (introduced) — [Asynchronous programming](https://dart.dev/libraries/async/async-await)

## Features

### 2.1 Manual timer core (your idea)

What it does: on the Timer screen, a start/pause/stop control that runs a
live-updating elapsed-time display for the current session. This is the
mechanical heart of "measure the time" from your original ask, built by
hand-triggering before Phase 4 automates the trigger.
Concept(s) exercised: StatefulWidget & `setState` — [docs](https://api.flutter.dev/flutter/widgets/State/setState.html); Async Dart (Timer/Duration) — [docs](https://dart.dev/libraries/async/async-await).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 2.2 Attach a label to a session before starting it (your idea)

What it does: before starting a manual session, the user picks one of the
labels created in Phase 1.4, so the running session is associated with a
feature/ticket from the start. This is the setup half of "label timers
based on features" — the comparison half arrives in Phase 5.
Concept(s) exercised: StatefulWidget & `setState` — [docs](https://api.flutter.dev/flutter/widgets/State/setState.html).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

## Checklist

- [ ] 2.1 Manual timer core (start/pause/stop, live elapsed display)
- [ ] 2.2 Attach a label to a session before starting it
