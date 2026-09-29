# Database exceptions

## Rule

Every database operation that can throw must be wrapped in `try`/`catch`.
Do not let `DatabaseException` (or the project’s DB driver exception) escape
uncaught to the framework or terminate the isolate accidentally.

Apply this at:

- **`AppDatabase`** — open, close, `onCreate` / `onUpgrade`, `transaction()`
- **DAOs** — every query/write; map to domain errors or rethrow a domain
  exception after logging
- **Any other DB call site** (including one-off scripts/tests that open the DB)

On catch: log with `logger.w` (or `logger.d` only for temporary diagnostics),
then either recover, return a domain failure, or rethrow a domain-appropriate
exception. Do not swallow without logging.

## App startup

Opening or migrating the database during startup (from `main`, before
`runApp`, typically inside or before `configureDependencies()` /
`setupDi()`) **must** be inside `try`/`catch`.

If startup DB init fails, follow **`{{DATABASE_STARTUP_FAILURE_BEHAVIOR}}`**
as documented in `docs/architecture.md` for this project (examples projects
may choose: fatal error screen, process exit, retry UI). When adapting the
blueprint, replace the placeholder with the chosen behavior. If it is still
unset, **ask the developer** — do not invent a failure UX.
