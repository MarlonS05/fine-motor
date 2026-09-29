# Catalog — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: catalog
  product_name: Fine Motor
  source: N/A
  target_platform: iOS, Android
  status: design-only
-->

> **Purpose:** Machine-readable design spec for the test catalog tab
> (placeholder tremor tests; no Flame UI in this spec).
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
| BLoC + codegen | `CatalogBloc` + Freezed event/state |
| All screens registered in `lib/router/` | Route `/catalog`; BLoCs navigate only via registered routes |
| All navigation in BLoCs | Views dispatch events only; BLoC calls router |
| Widget classes | Private widgets in `*_view.*`; shared under `screens/components/` |
| Infra I/O | Catalog reads via `MotorTestRepository` (DAO → SQLite) |
| Persistence | `motor_tests` table; seeded on v1 `onCreate` |
| Writes | None from catalog UI |
| Errors | Screen error state + retry; SnackBar for transient |
| Theme | `lib/theme/` design tokens |

**Replaces:** N/A.

**Reference implementations:** `docs/home-design-spec.md` for shell/tab patterns.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Catalog | `/catalog` | Catalog / Tests |

Entry: bottom nav Catalog tab (see `docs/home-design-spec.md`).

### 1.2 Flows

- **Browse:** User opens Catalog → sees motor tests from SQLite (title + description).
- **Start test (stub):** Tap entry → SnackBar “Coming soon” or navigate only when `/test/:level` is registered later. Phase 1 catalog must not host Flame UI.
- **Back:** Tab root; no in-feature back stack.

---

## 2. Data model

Catalog entries map to domain `LevelEnum` (see `docs/architecture.md`):

```dart
enum LevelEnum {
  drawShapes,
}

class MotorTest {
  final String title;
  final LevelEnum level;
  final String description;
}
```

| Value | Label (en) | Notes |
|-------|------------|-------|
| `drawShapes` | Draw shapes | Seeded production default |

**Default:** Show seeded rows from `motor_tests`.

**Persistence:** The catalog loads motor tests from SQLite through
`MotorTestRepository`. The production database seeder inserts “Draw shapes”
when the schema is created. Catalog display strings are stored directly in
each row. Results of completed tests are separate (`TestResult`).

---

## 3. Component reuse

### 3.1 Reuse as-is
`MainBottomNav` from shell.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Do not embed Flame `GameWidget` in catalog rows.

### 3.4 Build new

- Catalog list row as private widget in `catalog_view.*`, or shared
  `screens/components/catalog/catalog_test_tile.*` if reused later.
- Props: title, description, `onTap`.

---

## 4. Screens

```yaml
route: /catalog
folder: screens/catalog/catalog/
bloc: CatalogBloc
view: CatalogView
```

```
CatalogView
  Scaffold
    AppBar (Catalog)
    body: ListView
      CatalogTestTile (drawShapes)
```

**Selection / actions:** Tile tap → `CatalogEvent.testSelected(LevelEnum)` →
phase 1: SnackBar “Coming soon”. When Flame screens exist: BLoC navigates to
registered `/test/:level` only.

**States & styling:** Loading while reading DB; error + retry if load fails;
list of seeded tests when ready.

---

## 5. Navigation & state

### Routes

```dart
static const catalog = '/catalog';
// Future: static String test(LevelEnum level) => '/test/${level.name}';
```

### BLoC events

**CatalogBloc:** `started`, `testSelected(LevelEnum level)`
- `started`: load motor tests from `MotorTestRepository`.
- `testSelected`: stub feedback; later navigate via router.

---

## 6. Interaction & tokens

- List padding, tile gaps, and typography from `lib/theme/`.
- Screen error wrapper on error state.

---

## 7. Out of scope

- Flame game design or `lib/flame_game/` implementation
- Real scoring during play
- Doctor-assigned test lists / remote catalog
- Patient identity

---

## Appendix A. Implementation checklist

```
[x] MotorTest / LevelEnum wired via DB seeder + repository
[x] CatalogBloc + CatalogView list (loading / error / ready)
[x] Stub tap → SnackBar (no Flame)
[x] Route + DI wiring
[x] Verify: analyzer + architecture import test
```
