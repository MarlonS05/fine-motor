# Results history — Design & Layout Specification

<!--
  AGENT METADATA — parse before implementing
  feature_id: results_history
  product_name: Fine Motor
  source: N/A
  target_platform: iOS, Android
  status: design-only
-->

> **Purpose:** Machine-readable design spec for local test-result history
> (list + detail fields).
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
| BLoC + codegen | `ResultsBloc`, `ResultDetailBloc` (if detail is separate) + Freezed |
| All screens registered in `lib/router/` | `/results`, optional `/results/:id` |
| All navigation in BLoCs | Views dispatch events only; BLoC calls router |
| Widget classes | Private widgets in `*_view.*`; shared under `screens/components/` |
| Infra I/O | None in BLoC; reads via repository interface |
| Persistence | `TestResultRepository` + DAO; reads only from this feature |
| Writes | Controllers do not write; saves happen from test-completion flow (use case) |
| Errors | Screen error state + retry; SnackBar for transient |
| Theme | `lib/theme/` design tokens |

**Replaces:** N/A.

**Reference implementations:** `docs/home-design-spec.md` for tab shell.

---

## 1. Feature overview

### 1.1 Screens

| Screen | Route | Top bar |
|--------|-------|---------|
| Results list | `/results` | Results |
| Result detail | `/results/:id` | Result |

Entry: bottom nav Results tab.

### 1.2 Flows

- **Browse history:** Open Results → load local `TestResult` list newest-first.
- **Open detail:** Tap row → BLoC navigates to `/results/:id` showing full scores.
- **Empty:** Friendly empty state when no results yet.
- **Back:** Detail → list via `backTapped` → router pop/go to `/results`.

---

## 2. Data model

```dart
enum LevelEnum {
  drawShapes,
}

class TestResult {
  final String id; // local primary key / UUID
  final LevelEnum level;
  final double totalScore;
  final Duration duration;
  final DateTime timestamp;
  final double smallShakeScore;
  final double mediumShakeScore;
  final double strongShakeScore;
}
```

| Field | Label | Notes |
|-------|-------|-------|
| `level` | Test | Title from catalog (`MotorTest`) |
| `totalScore` | Total | Primary list subtitle metric |
| `duration` | Duration | Formatted mm:ss or similar |
| `timestamp` | Date / time | Device local |
| `smallShakeScore` | Small shakes | Detail only |
| `mediumShakeScore` | Medium shakes | Detail only |
| `strongShakeScore` | Strong shakes | Detail only |

**Default:** Sort by `timestamp` descending.

**Persistence:** `TestResultRepository.getAll()`, `getById(id)`. List screen uses
repository (simple read). Save path owned by test-completion use case elsewhere.

---

## 3. Component reuse

### 3.1 Reuse as-is
`MainBottomNav`.

### 3.2 Adapt
N/A.

### 3.3 Do not reuse
Do not show raw DB rows or DTOs in the UI — domain `TestResult` only.

### 3.4 Build new

- `ResultListTile` — private in list view or shared under
  `screens/components/results/`.
- Detail score rows as private widgets in detail view.

---

## 4. Screens

### Results list

```yaml
route: /results
folder: screens/results/results_list/
bloc: ResultsBloc
view: ResultsView
```

```
ResultsView
  Scaffold
    AppBar (Results)
    body:
      loading → progress indicator
      error → error + retry
      empty → empty illustration/copy
      data → ListView of ResultListTile
        title: test type label
        subtitle: total score + timestamp
```

**Selection / actions:** Tile tap → `ResultsEvent.resultSelected(id)` → navigate
to `/results/:id`.

### Result detail

```yaml
route: /results/:id
folder: screens/results/result_detail/
bloc: ResultDetailBloc
view: ResultDetailView
```

```
ResultDetailView
  Scaffold
    AppBar (back)
    body:
      Test type
      Timestamp
      Duration
      Total score
      Small / medium / strong shake scores
```

**Selection / actions:** `backTapped` → pop to list.

**States & styling:** Loading/error/retry on missing id or DB failure.

---

## 5. Navigation & state

### Routes

```dart
static const results = '/results';
static String resultDetail(String id) => '/results/$id';
```

### BLoC events

**ResultsBloc:** `started`, `retryTapped`, `resultSelected(String id)`
- `started` / `retryTapped`: load all results from repository.
- `resultSelected`: navigate to detail route.

**ResultDetailBloc:** `started(String id)`, `retryTapped`, `backTapped`
- `started`: load by id.
- `backTapped`: navigate back to `/results`.

---

## 6. Interaction & tokens

- List and detail spacing from `lib/theme/`.
- All screens: error-handling wrapper on error state with retry.

---

## 7. Out of scope

- Syncing results to doctor API (phase 2)
- Charts / trend analytics
- Editing or deleting individual results (unless added later)
- Flame test UI

---

## Appendix A. Implementation checklist

```
[ ] TestResult entity + DAO + repository + getAll/getById
[ ] ResultsBloc + list view (empty/loading/error)
[ ] ResultDetailBloc + detail view (all score fields)
[ ] Routes + DI wiring
[ ] Verify: analyzer + architecture import test
```
