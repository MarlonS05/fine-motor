# Settings — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: settings
  product_name: Fine Motor
  source: N/A
  target_platform: iOS, Android
  status: design-only
-->

> **Purpose:** Machine-readable design spec for Settings: language, app
> version, and phase-2 API sync placeholder.
> **Audience:** Coding agents and contributors. Follow `AGENTS.md` and
> `docs/architecture.md` before writing code.

---

## Document map

| § | Section |
|---|---------|
| 0 | [Repo conventions](#0-repo-conventions) |
| 1 | [Feature overview](#1-feature-overview) |
| 2 | [Data model](#2-data-model) |
| 3 | [Component reuse](#3-component-reuse) |
| 4 | [Screens](#4-screens) |
| 5 | [Navigation & state](#5-navigation--state) |
| 6 | [Interaction & tokens](#6-interaction--tokens) |
| 7 | [Out of scope](#7-out-of-scope) |
| A | [Implementation checklist](#appendix-a-implementation-checklist) |

---

## 0. Repo conventions

| Rule | This feature |
|------|--------------|
| BLoC + codegen | `SettingsBloc` + Freezed event/state |
| All screens registered in `lib/router/` | Route `/settings` |
| All navigation in BLoCs | Views dispatch events only; BLoC calls router |
| Widget classes | Private widgets in `*_view.*`; shared under `screens/components/` |
| Infra I/O | Locale persistence via domain port / platform adapter if needed; package info for version |
| Persistence | Locale preference only (not test results) |
| Writes | Use case or port for set-locale; no direct plugin calls in BLoC |
| Errors | Screen error state + retry; SnackBar for sync placeholder / transient |
| Theme | `lib/theme/` design tokens |

**Replaces:** N/A.

**Reference implementations:** `docs/home-design-spec.md` for tab shell.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Settings | `/settings` | Settings |

Entry: bottom nav Settings tab.

### 1.2 Flows

- **Change language:** User picks `de` or `en` → BLoC persists locale → app UI updates.
- **View version:** Read-only app version from package info.
- **API sync placeholder:** Tap “Sync with doctor” → disabled control and/or SnackBar “Coming in phase 2”. No network call.
- **Back:** Tab root.

---

## 2. Data model

```dart
enum AppLocale {
  de,
  en,
}

class AppSettings {
  final AppLocale locale;
  // version is read from package metadata, not stored in domain settings
}
```

| Value | Label | Notes |
|-------|-------|-------|
| `de` | Deutsch | Default locale |
| `en` | English | |

**Default:** `AppLocale.de`.

**Persistence:** Load/save locale via settings repository or preferences port.
Version is not persisted — display from package info at runtime.

---

## 3. Component reuse

### 3.1 Reuse as-is
`MainBottomNav`.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Do not implement real HTTP sync UI here beyond the placeholder control.

### 3.4 Build new

- Settings sections as private widgets in `settings_view.*` (language picker,
  version row, sync placeholder button).

---

## 4. Screens

```yaml
route: /settings
folder: screens/settings/settings/
bloc: SettingsBloc
view: SettingsView
```

```
SettingsView
  Scaffold
    AppBar (Settings)
    body: ListView
      Language section
        Radio / segmented: Deutsch | English
      Version row (read-only)
      Sync with doctor button (placeholder — disabled or shows phase-2 message)
```

**Selection / actions:**

- Language change → `SettingsEvent.localeSelected(AppLocale)` → persist + apply.
- Sync tap → `SettingsEvent.syncTapped` → SnackBar “Coming in phase 2” (no API).

**States & styling:** Sync control visually disabled or secondary; version muted text token.

---

## 5. Navigation & state

### Routes

```dart
static const settings = '/settings';
```

### BLoC events

**SettingsBloc:** `started`, `localeSelected(AppLocale locale)`, `syncTapped`
- `started`: load current locale + version string.
- `localeSelected`: write preference / notify locale change.
- `syncTapped`: emit transient phase-2 message only.

---

## 6. Interaction & tokens

- Section spacing and list tile padding from `lib/theme/`.
- Error wrapper if settings load fails.

---

## 7. Out of scope

- Real API sync, auth, or doctor pairing
- Clearing local results from Settings (unless added later)
- Theme dark-mode toggle
- Patient identity fields

---

## Appendix A. Implementation checklist

```
[x] AppLocale + settings persistence port/repo
[x] SettingsBloc + view (language, version, sync placeholder)
[x] Route + DI wiring
[x] gen-l10n (DE/EN) + UI strings resolve via AppLocalizations
[x] Verify: analyzer + architecture import test
```
