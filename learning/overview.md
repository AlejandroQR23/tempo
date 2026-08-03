# Tempo — Learning Overview

## What we're building

Tempo is a desktop time tracker aimed at freelance/consulting work: instead of
manually starting a stopwatch, you configure which app (or combo of apps —
e.g. VS Code + Terminal + iTerm counting as one unit) should trigger tracking,
and Tempo watches macOS for when one of those apps is frontmost. The timer
runs while a tracked app has focus and pauses the moment focus moves away —
no manual start/stop for the common case. Sessions get labeled by feature or
ticket, carry an optional initial estimate, and accumulate against it, so at
the end of a sprint or ticket you can see estimate vs. actual instead of
reconstructing it from memory.

It's a good vehicle for learning Flutter because it forces the full spine of
the framework in a natural order: ordinary widgets and state first, then real
async/timer mechanics, then local persistence and a proper state-management
layer once several screens need to share one truth, and — the part most
tutorials never touch — genuine native platform integration, since "which
app is in the foreground system-wide" isn't something Flutter (or any
cross-platform toolkit) exposes on its own. That last piece is also the
whole point of the app, not a side quest.

## Tool / stack

- **Flutter** (desktop target, macOS) — [flutter.dev](https://docs.flutter.dev)
- **Dart** — [dart.dev](https://dart.dev)
- **window_manager** (window behavior/lifecycle) — [pub.dev/packages/window_manager](https://pub.dev/packages/window_manager)
- **tray_manager** (menu bar / system tray presence) — [pub.dev/packages/tray_manager](https://pub.dev/packages/tray_manager)
- **sqflite** (local persistence) — [pub.dev/packages/sqflite](https://pub.dev/packages/sqflite)
- **flutter_riverpod** (app-wide state) — [riverpod.dev](https://riverpod.dev)
- **fl_chart** (estimate-vs-actual charting) — [pub.dev/packages/fl_chart](https://pub.dev/packages/fl_chart)
- **AppKit `NSWorkspace`** (native macOS frontmost-app detection, via platform channel) — [developer.apple.com/documentation/appkit/nsworkspace](https://developer.apple.com/documentation/appkit/nsworkspace)

## Concept graph

Every concept this curriculum teaches, in prerequisite order. Concept B
depends on concept A if you need A to understand B. This is the graph the
phase breakdown below is derived from.

| # | Concept | Depends on | Doc link |
|---|---------|------------|----------|
| 1 | Widgets & the widget tree (StatelessWidget) | — | [Introduction to widgets](https://docs.flutter.dev/ui/widgets-intro) |
| 2 | StatefulWidget & `setState` | 1 | [State.setState](https://api.flutter.dev/flutter/widgets/State/setState.html) |
| 3 | Layout widgets (Column, Row, ListView, Padding) | 1 | [Building layouts](https://docs.flutter.dev/ui/layout) |
| 4 | Desktop windowing (app shell + window_manager) | 1 | [Flutter desktop](https://docs.flutter.dev/platform-integration/desktop), [window_manager](https://pub.dev/packages/window_manager) |
| 5 | Dart classes & immutable data models | — | [Classes](https://dart.dev/language/classes) |
| 6 | Async Dart (Future, Timer, Stream, async/await) | — | [Asynchronous programming](https://dart.dev/libraries/async/async-await) |
| 7 | Navigation & routes | 4 | [Navigation](https://docs.flutter.dev/ui/navigation) |
| 8 | Dynamic lists (`ListView.builder`, keys) | 1, 5 | [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html) |
| 9 | Local persistence (sqflite) | 5 | [sqflite](https://pub.dev/packages/sqflite) |
| 10 | App-wide state management (Riverpod) | 2, 5, 9 | [riverpod.dev](https://riverpod.dev) |
| 11 | Platform channels (MethodChannel / EventChannel) | 6 | [Platform channels](https://docs.flutter.dev/platform-integration/platform-channels) |
| 12 | macOS foreground-app detection (`NSWorkspace`) | 11 | [NSWorkspace](https://developer.apple.com/documentation/appkit/nsworkspace) |
| 13 | macOS App Sandbox entitlements | 12 | [Building macOS apps with Flutter](https://docs.flutter.dev/platform-integration/macos/building) |
| 14 | System tray / menu bar presence (tray_manager) | 4 | [tray_manager](https://pub.dev/packages/tray_manager) |
| 15 | Charting library integration (fl_chart) | 5, 6 | [fl_chart](https://pub.dev/packages/fl_chart) |
| 16 | Date/time & duration aggregation | 5, 6 | [Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html) |

## Phases

| Phase | Theme | Concepts covered | Doc |
|-------|-------|-------------------|-----|
| 0 | Setup / project orientation | — | [phase-0.md](phase-0.md) |
| 1 | Widgets, desktop shell & data models | 1, 3, 4, 5, 7, 8 | [phase-1.md](phase-1.md) |
| 2 | Async Dart & manual timer mechanics | 2, 6 | [phase-2.md](phase-2.md) |
| 3 | Persistence & state management | 9, 10 | [phase-3.md](phase-3.md) |
| 4 | Platform integration (the core feature) | 11, 12, 13, 14 | [phase-4.md](phase-4.md) |
| 5 | Labeling, estimates & reporting | 15, 16 | [phase-5.md](phase-5.md) |
