# Phase 3: Persistence & state management

## Approach

Two things happen at once in this phase, and they're related: data needs to
survive a restart (otherwise "compare estimate vs. actual" is meaningless
beyond a single session), and once persistence exists, the four screens
built so far (Timer, App Groups, Labels, and eventually History) all need to
agree on one source of truth rather than each holding their own copy of
state. Riverpod is introduced here specifically because `setState` alone
can't share state across sibling screens cleanly.

## Libraries / tools used this phase

- **sqflite** — [pub.dev/packages/sqflite](https://pub.dev/packages/sqflite)
- **flutter_riverpod** — [riverpod.dev](https://riverpod.dev)

## Required knowledge

Concepts from the graph in overview.md this phase assumes or introduces:

- **Local persistence (sqflite)** (introduced) — [sqflite](https://pub.dev/packages/sqflite)
- **App-wide state management (Riverpod)** (introduced) — [riverpod.dev](https://riverpod.dev)

## Features

### 3.1 Persist app groups, labels, and time entries (suggested)

What it does: everything created in Phases 1–2 (tracked-app groups, labels,
recorded sessions) survives an app restart, stored locally via sqflite. This
fills a gap the original feature list implied but didn't state outright —
without it, "compare the first estimate with actual time" only works within
a single run of the app.
Concept(s) exercised: Local persistence — [docs](https://pub.dev/packages/sqflite); Dart classes — [docs](https://dart.dev/language/classes).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 3.2 Shared state layer across screens (suggested)

What it does: refactor the Timer, App Groups, and Labels screens to read
and write through a shared Riverpod state layer backed by the persistence
from 3.1, instead of each screen managing its own local state. This is what
lets Phase 4's automatic timer and Phase 5's reporting see the same data
the manual-entry screens produce.
Concept(s) exercised: App-wide state management — [docs](https://riverpod.dev).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

## Checklist

- [ ] 3.1 Persist app groups, labels, and time entries
- [ ] 3.2 Shared state layer across screens
