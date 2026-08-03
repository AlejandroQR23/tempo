# Phase 1: Widgets, desktop shell & data models

## Approach

This phase builds the app's skeleton and the screens for configuring what
Tempo will eventually track — before any actual timing or automation exists.
You'll build a desktop-appropriate app shell with navigation between a
(currently empty) Timer screen, an App Groups screen, and a Labels screen,
and give the data you sketched in Phase 0 real Dart types. Everything here
lives in memory; nothing survives a restart yet — that's Phase 3's job. The
point of keeping automation, persistence, and state management out of this
phase is to isolate "building a desktop UI with several screens and CRUD
lists" from those separate concerns.

## Libraries / tools used this phase

- Flutter SDK — [docs.flutter.dev](https://docs.flutter.dev)
- **window_manager** (basic window title/size on desktop) — [pub.dev/packages/window_manager](https://pub.dev/packages/window_manager)

## Required knowledge

Concepts from the graph in overview.md this phase assumes or introduces:

- **Widgets & the widget tree** (introduced) — [Introduction to widgets](https://docs.flutter.dev/ui/widgets-intro)
- **Layout widgets** (introduced) — [Building layouts](https://docs.flutter.dev/ui/layout)
- **Desktop windowing** (introduced) — [Flutter desktop](https://docs.flutter.dev/platform-integration/desktop), [window_manager](https://pub.dev/packages/window_manager)
- **Dart classes & immutable data models** (introduced) — [Classes](https://dart.dev/language/classes)
- **Navigation & routes** (introduced) — [Navigation](https://docs.flutter.dev/ui/navigation)
- **Dynamic lists (`ListView.builder`, keys)** (introduced) — [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)

## Features

### 1.1 App shell, window basics & navigation (suggested)

What it does: a `MaterialApp` with a basic desktop window (reasonable
default size/title via window_manager) and navigation between three
screens: Timer (placeholder for now), App Groups, and Labels. Every later
feature hangs off this scaffolding, so it's called out on its own even
though you didn't name it explicitly.
Concept(s) exercised: Desktop windowing — [docs](https://docs.flutter.dev/platform-integration/desktop); Navigation & routes — [docs](https://docs.flutter.dev/ui/navigation).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 1.2 Data models: TrackedAppGroup, Label, TimeEntry (suggested)

What it does: Dart classes for the three shapes sketched in Phase 0.3. These
are plain in-memory models for now — no persistence annotations, no
database concerns, just the types the rest of the app will depend on.
Concept(s) exercised: Dart classes & immutable data models — [docs](https://dart.dev/language/classes).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 1.3 Manage tracked-app groups (your idea)

What it does: a screen to create a named group (e.g. "Coding"), add one or
more app identifiers to it (for now, just typed-in names/identifiers — real
matching against actually-running apps arrives in Phase 4), and edit/delete
existing groups. This is the "user can select which apps can trigger the
timer, or a combo of apps" feature, minus the OS-level detection part.
Concept(s) exercised: Dynamic lists (`ListView.builder`, keys) — [docs](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html); Dart classes — [docs](https://dart.dev/language/classes).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 1.4 Manage labels (your idea)

What it does: a screen to create, edit, and delete labels representing a
feature or ticket — the "label timers based on features" ask. Estimates
aren't wired up yet (Phase 5); this is just the CRUD list of label names.
Concept(s) exercised: Dynamic lists (`ListView.builder`, keys) — [docs](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

## Checklist

- [x] 1.1 App shell, window basics & navigation
- [x] 1.2 Data models: TrackedAppGroup, Label, TimeEntry
  - [x] 1.2a TrackedAppGroup class
  - [x] 1.2b Label class
  - [x] 1.2c TimeEntry class
- [x] 1.3 Manage tracked-app groups
- [x] 1.4 Manage labels
