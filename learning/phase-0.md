# Phase 0: Setup / project orientation

## Approach

No new concepts yet — this phase is about being able to run the existing
scaffold on macOS and knowing where native code will eventually live, before
Phase 1 starts adding real Dart code. Desktop support is already enabled in
this project; the goal here is confidence in the toolchain and a rough shape
for the data you'll be modeling, not code.

## Libraries / tools used this phase

- Flutter SDK, macOS desktop target (already enabled in this project) — [Flutter desktop](https://docs.flutter.dev/platform-integration/desktop)

## Required knowledge

None yet — Phase 0 has no entries in the concept graph. Concepts 1–8 begin
in Phase 1.

## Features

### 0.1 Run the app on macOS (suggested)

What it does: get the existing scaffold running as a macOS desktop app
(`flutter run -d macos`), confirming the toolchain works before anything
else is built on top of it.
Concept(s) exercised: none formally — tooling prerequisite for everything
that follows.

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 0.2 Read the generated project structure, especially `macos/Runner` (suggested)

What it does: look through `lib/main.dart`, `pubspec.yaml`, and specifically
the `macos/Runner` folder (`AppDelegate`, `MainFlutterWindow`,
`*.entitlements` files) — this is where Phase 4's native platform code will
live, so knowing it exists now saves confusion later.
Concept(s) exercised: none formally — orientation for concept 11 (platform
channels) and concept 13 (App Sandbox entitlements) in Phase 4.

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 0.3 Sketch the core data shapes (suggested)

What it does: before any Dart code exists, write down what each of these
needs to hold:

- **TrackedAppGroup** — a name, and the set of one or more apps that count
  as "this group has focus" (e.g. a group named "Coding" containing VS Code,
  Terminal, and iTerm).
- **Label** — a name (feature/ticket), and an optional initial time estimate.
- **TimeEntry** — which label it belongs to, start time, end time (or
  "still running"), and which TrackedAppGroup triggered it.

This sketch is what Phase 1's data-model feature formalizes into Dart
classes.
Concept(s) exercised: none formally — sets up concept 5 (Dart classes) in
Phase 1.

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

## Checklist

- [x] 0.1 Run the app on macOS
- [x] 0.2 Read the generated project structure, especially macos/Runner
- [x] 0.3 Sketch TrackedAppGroup, Label, and TimeEntry data shapes
