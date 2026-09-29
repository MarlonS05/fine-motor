import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:finemotor_lint_rules/layer_import_rules.dart';

void main() {
  test('lib imports respect layer deny-lists', () {
    final root = Directory('lib');
    final violations = <String>[];
    for (final entity in root.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      if (entity.path.endsWith('.freezed.dart')) continue;
      final denials = LayerImportRules.denialsForFile(entity.path);
      if (denials.isEmpty) continue;
      final lines = entity.readAsLinesSync();
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i].trimLeft();
        if (!(line.startsWith('import ') || line.startsWith('export '))) {
          continue;
        }
        final uri = _uriOf(line);
        for (final denial in denials) {
          if (uri.startsWith(denial)) {
            violations.add('${entity.path}:${i + 1}: $uri denied by $denial');
          }
        }
      }
    }
    expect(violations, isEmpty, reason: violations.join('\n'));
  });
}

String _uriOf(String importLine) {
  final match = RegExp(r'''['"]([^'"]+)['"]''').firstMatch(importLine);
  return match?.group(1) ?? '';
}
