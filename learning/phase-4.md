# Phase 4: Platform integration (the core feature)

## Approach

This is the phase the whole app exists for. Flutter has no cross-platform
concept of "which app is frontmost system-wide" — that's inherently
OS-specific, so it means writing a small amount of native Swift/Objective-C
and bridging it to Dart with a platform channel. On macOS the relevant API
is `NSWorkspace`, which can report the frontmost app and post a notification
whenever that changes — no polling required. One thing to research going
in: Flutter macOS builds are sandboxed by default via the
`macos/Runner/*.entitlements` files, so it's worth understanding what that
means for a native API call before you're debugging a permissions error
instead of your own logic. Once frontmost-app detection exists, the rest of
this phase is "wire it to the state layer from Phase 3." Because Tempo has
to keep observing focus changes even while some *other* app is in the
foreground, it also needs a way to keep running without needing its own
window focused — that's what the tray/menu-bar feature is for.

## Libraries / tools used this phase

- **AppKit `NSWorkspace`** (native side, via platform channel) — [developer.apple.com/documentation/appkit/nsworkspace](https://developer.apple.com/documentation/appkit/nsworkspace)
- **tray_manager** — [pub.dev/packages/tray_manager](https://pub.dev/packages/tray_manager)

## Required knowledge

Concepts from the graph in overview.md this phase assumes or introduces:

- **Platform channels (MethodChannel / EventChannel)** (introduced) — [Platform channels](https://docs.flutter.dev/platform-integration/platform-channels)
- **macOS foreground-app detection (`NSWorkspace`)** (introduced) — [NSWorkspace](https://developer.apple.com/documentation/appkit/nsworkspace)
- **macOS App Sandbox entitlements** (introduced) — [Building macOS apps with Flutter](https://docs.flutter.dev/platform-integration/macos/building)
- **System tray / menu bar presence** (introduced) — [tray_manager](https://pub.dev/packages/tray_manager)

## Features

### 4.1 Detect the frontmost application (your idea)

What it does: native Swift code observes macOS for frontmost-app changes
(app name/bundle identifier) and streams that information to the Dart side
via a platform channel. This is the mechanism behind "measure the time the
user has that app in the foreground."
Concept(s) exercised: Platform channels — [docs](https://docs.flutter.dev/platform-integration/platform-channels); macOS foreground-app detection — [docs](https://developer.apple.com/documentation/appkit/nsworkspace); macOS App Sandbox entitlements — [docs](https://docs.flutter.dev/platform-integration/macos/building).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 4.2 Auto start/pause based on tracked-app groups (your idea)

What it does: whenever the frontmost app (from 4.1) matches a member of a
configured TrackedAppGroup, the active timer starts (or resumes) for that
group; whenever focus leaves the group entirely, it pauses. This is "start
whenever the user opens an app... pause when it's in the background," and
"a combo of apps" — matching against any member of a group counts as the
group having focus.
Concept(s) exercised: App-wide state management — [docs](https://riverpod.dev); Platform channels — [docs](https://docs.flutter.dev/platform-integration/platform-channels).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 4.3 Menu bar / system tray presence (suggested)

What it does: Tempo lives in the macOS menu bar (via tray_manager) rather
than requiring its own window to stay open or focused, so it can keep
observing frontmost-app changes unobtrusively in the background while you
work in the apps it's tracking. This fills a structural gap the original
feature list didn't mention but 4.1/4.2 depend on: Tempo can't be the
frontmost app and also be watching for a *different* app to be frontmost.
Concept(s) exercised: System tray / menu bar presence — [docs](https://pub.dev/packages/tray_manager).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

## Checklist

- [ ] 4.1 Detect the frontmost application
- [ ] 4.2 Auto start/pause based on tracked-app groups
- [ ] 4.3 Menu bar / system tray presence
