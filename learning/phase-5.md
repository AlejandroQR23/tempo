# Phase 5: Labeling, estimates & reporting

## Approach

With automatic tracking working, this phase closes the loop the app was
built for: turning accumulated time entries into an estimate-vs-actual
comparison per label, and making that comparison visible rather than
something you'd have to query the database to see.

## Libraries / tools used this phase

- **fl_chart** — [pub.dev/packages/fl_chart](https://pub.dev/packages/fl_chart)

## Required knowledge

Concepts from the graph in overview.md this phase assumes or introduces:

- **Charting library integration (fl_chart)** (introduced) — [fl_chart](https://pub.dev/packages/fl_chart)
- **Date/time & duration aggregation** (introduced) — [Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)

## Features

### 5.1 Initial estimate per label vs. accumulated actual (your idea)

What it does: a label (from Phase 1.4) can carry an initial time estimate,
and its total actual tracked duration is computed by summing every
TimeEntry attached to it. This is "compare the first estimate with the
actual time it took."
Concept(s) exercised: Date/time & duration aggregation — [docs](https://api.flutter.dev/flutter/dart-core/Duration-class.html).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 5.2 History / report view grouped by label (suggested)

What it does: a screen listing every label with its estimate, its
accumulated actual duration, and the difference — the view that makes 5.1's
computation actually useful day to day (e.g. for a freelance invoice or a
Jira ticket retro).
Concept(s) exercised: Dynamic lists (`ListView.builder`, keys) — [docs](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

### 5.3 Estimate-vs-actual chart (your idea)

What it does: a simple chart (e.g. a bar per label, estimate and actual
side by side) summarizing where time went across labels — useful for
spotting which kinds of tickets/features consistently run over or under
estimate, for future project-budget planning.
Concept(s) exercised: Charting library integration — [docs](https://pub.dev/packages/fl_chart).

No code. No step-by-step implementation instructions here — this is a
conceptual spec, not a recipe. The reader still has to work out the how.

## Checklist

- [ ] 5.1 Initial estimate per label vs. accumulated actual
- [ ] 5.2 History / report view grouped by label
- [ ] 5.3 Estimate-vs-actual chart
