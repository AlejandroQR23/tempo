# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This App Does

## Commands

No test suite currently.

## Tech Stack

- **Framework:** React Native + Expo SDK 55 (expo-router for file-based routing)
- **Styling:** NativeWind (Tailwind for RN) + design tokens in `lib/theme.ts`
- **State:** Zustand for client state; TanStack Query for server state
- **Auth:** Supabase Auth (Google + Apple OAuth via expo-auth-session)
- **HTTP:** Axios with JWT interceptor (`lib/axios.ts`)
- **UI:** React Native Reusables (shadcn for RN) + custom components
- **Icons:** `@hugeicons/react-native` (1.5px stroke weight)
- **Fonts:** DM Serif Display (headings h1 only) + DM Sans (all UI)

## Architecture

### Navigation

### State Management

### Data Fetching

### Backend

## Key Conventions

**Commit format:**

```
feat 🎉: add undo animation for swipe gestures
fix 🔧: resolve token refresh race condition
```

## Design System

## Reference Files

| File               | Purpose                                                 |
| ------------------ | ------------------------------------------------------- |
| `PRD.md`           | Full product spec: DB schema, API endpoints, user flows |
| `design-system.md` | Component specs, colors, typography, motion             |
| `mobile-setup.md`  | Auth + TanStack Query integration guide                 |
| `frontend-todo.md` | Feature checklist and current progress                  |

## Code Guidelines
