# Home & shell — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: home
  product_name: Fine Motor
  source: N/A
  target_platform: iOS, Android
  status: design-only
-->

> **Purpose:** Machine-readable design spec for implementing the main shell
> (bottom navigation) and Home tab with a stub daily check-in.
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
| BLoC + codegen | `MainShellBloc`, `HomeBloc` + Freezed event/state |
| All screens registered in `lib/router/` | Add routes when adding screens; BLoCs navigate only via registered routes |
| All navigation in BLoCs | Views dispatch events only; BLoC calls router — never navigate from views |
| Widget classes | Screen-specific private widgets in the same `*_view.*` file; shared widgets under `screens/components/` |
| Infra I/O | None for Home stub |
| Persistence | None for Home stub |
| Writes | None |
| Errors | Screen error state (+ retry where useful); SnackBar for transient messages (e.g. “coming soon”) |
| Theme | `lib/theme/` design tokens |

**Replaces:** N/A (initial shell).

**Reference implementations:** N/A (first feature).

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Main shell | (hosts tabs) | — |
| Home | `/home` | Fine Motor / Home |

Entry: app launch lands on Home inside the bottom-nav shell.

### 1.2 Flows

- **Daily check-in (stub):** User taps Daily check-in → SnackBar “Coming soon” (or equivalent transient message). No navigation, no persistence.
- **Tab switch:** User selects Catalog / Results / Settings in bottom nav → shell BLoC navigates to registered tab route.
- **Back:** On root tabs, system back does not pop the shell (or exits app per platform default); no in-tab back stack on Home.

---

## 2. Data model

No new domain entities for Home. Daily check-in is a UI stub only.

**Persistence:** None.

---

## 3. Component reuse

### 3.1 Reuse as-is
N/A (greenfield).

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
N/A.

### 3.4 Build new

- Shared: `screens/components/main_bottom_nav.*` — four tabs: Home, Catalog, Results, Settings (labels + icons from theme).
- Home `*_view.*`: private widgets for hero/welcome area and Daily check-in CTA.

---

## 4. Screens

### Main shell

```yaml
route: /home (default tab; shell wraps /home|/catalog|/results|/settings)
folder: screens/shell/main_shell/
bloc: MainShellBloc
view: MainShellView
```

```
MainShellView
  Scaffold
    body: IndexedStack / nested navigator for active tab
    bottomNavigationBar: MainBottomNav
      Home | Catalog | Results | Settings
```

**Selection / actions:** Tab tap → `MainShellEvent.tabSelected(index)` → BLoC navigates to registered route for that tab.

**States & styling:** Selected tab uses theme primary tint; unselected uses muted token.

### Home

```yaml
route: /home
folder: screens/home/home/
bloc: HomeBloc
view: HomeView
```

```
HomeView
  Scaffold / SafeArea
    AppBar (title: Fine Motor or localized Home)
    body: Column / scroll
      Welcome / brand headline (theme text styles)
      Short supporting line (e.g. complete your tremor checks)
      DailyCheckInButton (primary CTA)
```

**Selection / actions:** Daily check-in tap → `HomeEvent.dailyCheckInTapped` → SnackBar “Coming soon” (no route change).

**States & styling:** Primary CTA uses theme button tokens; disabled states N/A for stub.

---

## 5. Navigation & state

### Routes

```dart
static const home = '/home';
static const catalog = '/catalog';
static const results = '/results';
static const settings = '/settings';
// Future (not implemented here): '/test/:type'
```

### BLoC events

**MainShellBloc:** `started`, `tabSelected(int index)`
- `tabSelected`: navigate to the registered route for that tab.

**HomeBloc:** `started`, `dailyCheckInTapped`
- `dailyCheckInTapped`: emit/show transient “coming soon” (SnackBar via listener or one-shot state flag).

---

## 6. Interaction & tokens

- Spacing, gaps, CTA size, and nav icon sizes from `lib/theme/` — no hardcoded magic numbers.
- Bottom nav always visible on shell tabs.
- Home: screen error wrapper only if load fails later; stub needs no load.

---

## 7. Out of scope

- Real daily check-in flow or scheduling
- Flame test screens / `lib/flame_game/` UI
- Patient identity / login
- API sync
- Results detail beyond linking via Results tab (see `docs/results-history-design-spec.md`)

---

## Appendix A. Implementation checklist

```
[ ] Main shell + bottom nav routes (home, catalog, results, settings)
[ ] Home view + HomeBloc with stub Daily check-in → SnackBar
[ ] Shared MainBottomNav under screens/components/
[ ] DI wiring for shell/home BLoCs
[ ] Verify: analyzer + architecture import test
```
