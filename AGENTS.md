# AGENTS.md — Fine Motor

Patient tremor-test app (iOS/Android): Flame dragging/tapping tests scored
locally; doctor API sync is phase 2. Read `docs/architecture.md` and the
relevant `docs/*-design-spec.md` before making changes. For Dart/Flutter
practices, see `docs/agent-guidelines/`.

## Architecture & layers

- **Layers:** Domain (`lib/domain/`) pure models/ports/use cases/business;
  Data-access (`lib/repo/`) repository impls; Persistence (`lib/db/`)
  AppDatabase/schema/migrations/DAOs; Infra (`lib/platform/`) OS adapters;
  Games (`lib/flame_game/`) Flame test components; Presentation
  (`lib/screens/`) views+BLoCs; Cross-cutting router/di/theme/logger.
- **BLoC** talks to a **use case** for writes/deletes and to a **repository
  interface** for simple reads.
- **All navigation happens in BLoCs** — views only dispatch events; never
  call the router or navigator from a view/widget.
  No `context.go` / `Navigator` / router imports in `*_view.*` — never navigate
  from views.
- **Register every screen in `lib/router/`** — each screen has a route
  entry; BLoCs navigate only via those registered routes (never ad-hoc paths
  or view-level navigation).
- **No infrastructure in BLoCs** (no sqflite, http, path_provider,
  shared_preferences, or other plugins in controllers; Flame `GameWidget`
  hosting stays in views / `flame_game`, not in BLoC logic).
- **`lib/domain/` must not import** Flutter, `lib/screens/`, `lib/repo/`,
  `lib/db/`, `lib/platform/`, `lib/flame_game/`, `lib/router/`, `lib/di/`,
  `lib/theme/`, flutter_bloc.
- Import boundaries are enforced by `finemotor_lint_rules` and
  `test/architecture/import_boundaries_test.dart` (to be added with app code).
  Update both (and `docs/architecture.md`) if boundaries change.

## Conventions

- **One directory per screen** under `screens/<feature>/<screen>/` — BLoC,
  Freezed event/state, and UI (`*_view`) live together; never share a folder
  across screens (see docs/agent-guidelines/project-structure.md).
- **Widget classes.** Prefer `Widget` classes over helper methods that return
  a `Widget`. Screen-specific private widgets live in the same `*_view.*`
  file; shared widgets live under `screens/components/` (see
  docs/agent-guidelines/project-structure.md). Prefer `StatelessWidget` before `StatefulWidget`.
- **Dart/Flutter practices.** Interaction, tooling, style, serialization,
  testing, layout/assets, and dartdoc — see `docs/agent-guidelines/`.
- **Use cases grouped by entity/function** under `domain/use_cases/<group>/`
  — do not dump all use cases in one flat folder (see docs/agent-guidelines/project-structure.md).
- **Non-trivial business logic** lives under `domain/business/<group>/`
  — keep use cases thin; extract multi-step rules, calculations, and
  reusable domain decisions (see docs/agent-guidelines/project-structure.md).
- **DI registration split by kind** in `di/` — `_registerSingletons`,
  `_registerUseCases`, `_registerScreens` (etc.), with comment-marked
  sections inside (e.g. `// results use cases`); call them from one startup
  method in `main` (see docs/agent-guidelines/project-structure.md).
- **Routes + navigation.** Register every new screen and its route in
  `router/`. Views dispatch navigation-intent events; the BLoC calls the
  router for that registered route. No `context.go` / `Navigator` / router
  imports in `*_view.*` or shared components.
- **Keep docs in sync.** When you add or change functionality, structure, or
  layer boundaries, update the relevant docs in the same change — especially
  `docs/architecture.md`, affected `docs/*-design-spec.md`, and enforcement
  artifacts (lint rules, architecture tests) when boundaries change.
- Run `dart run build_runner build --delete-conflicting-outputs` after editing
  Freezed / json_serializable sources.
- UI uses `lib/theme/` design tokens. Errors via screen error state (+ retry
  where useful) and SnackBar for transient non-blocking messages.
- Persistence: sqflite via `lib/db/`; never skip migrations; bump version in
  `AppDatabase` when schema changes.
- Log API interactions at completion in the shared HTTP client — see
  `docs/architecture.md` (core rules) for placement; use `Success …` /
  `Failed …` with `logger.i` / `logger.w`. (Phase 2 — unused until sync.)
- Configure the shared logger in `lib/logger/` — see `docs/architecture.md`
  (Logger setup) for `PrettyPrinter` options.
- Temporary diagnostic logs while investigating: `logger.d` only — remove before
  considering work done.
- **Catch every database exception** — never let DB errors propagate
  uncaught. Detail: `docs/agent-guidelines/07-database-exceptions.md`.
- **DB open on startup** must be `try`/`catch`ed in `main` (before
  `runApp`). On failure show `DatabaseError` screen with **Retry** and
  **Wipe** (delete DB file, re-open so migrations recreate schema).

## Tremor tests & Flame

- All Flame game code lives under `lib/flame_game/`. It may use domain types for
  scores/results but must not import repo, db, router, or di.
- Screens/BLoCs start tests and persist via use cases; do not write results from
  Flame components directly to the database.
- Phase 1: local only. Phase 2: sync results to doctor website via API — do not
  invent sync UX beyond the Settings placeholder until a design spec exists.
- No patient identity in phase 1; one install equals one patient.
- Shell: bottom nav Home | Catalog | Results | Settings — see
  `docs/home-design-spec.md` and related design specs.

## Plan mode

When using Plan mode, the plan body contains only three sections — see
[plan.template.md](../../../agent-instructions/plan.template.md): **Description**, **Files & layers**
(mermaid diagram), and **Code to add** (exact snippets, not prose about what to
write). Omit goals-as-bullets, step narratives, checklists, assumptions, and
file-touch summaries.

## Commits

Use this format for commit messages:

```
[<type>] <short description>
```

Choose `type` from:

| Type | Use for |
|------|---------|
| `feat` | Feature |
| `fix` | Bug fix |
| `style` | Styling |
| `refrac` | Verbesserung des Codes |
| `test` | Automatisierte Tests |
| `docs` | Dokumentation |
| `project` | Änderungen der Projektkonfiguration |
| `perf` | Verbesserung der Performance |
| `wip` | Work in Progress / Zwischenstände |

Example: `[feat] Add order export to CSV`

## Verify

```bash
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```
