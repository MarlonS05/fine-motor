/// DDL for local SQLite tables.
abstract final class Tables {
  static const motorTests = '''
CREATE TABLE motor_tests (
  level TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL
)
''';
}
