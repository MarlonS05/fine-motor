/// Path-keyed deny-lists matching docs/architecture.md strict import table.
class LayerImportRules {
  static const domain = [
    'package:flutter/',
    'package:flutter_bloc/',
    'package:finemotor/screens/',
    'package:finemotor/repo/',
    'package:finemotor/db/',
    'package:finemotor/platform/',
    'package:finemotor/flame_game/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:finemotor/theme/',
  ];

  static const repo = [
    'package:flutter/',
    'package:flutter_bloc/',
    'package:finemotor/screens/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:finemotor/flame_game/',
  ];

  static const db = [
    'package:flutter/',
    'package:flutter_bloc/',
    'package:finemotor/screens/',
    'package:finemotor/repo/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:finemotor/flame_game/',
  ];

  static const platform = [
    'package:finemotor/screens/',
    'package:finemotor/repo/',
    'package:finemotor/db/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:flutter_bloc/',
    'package:finemotor/flame_game/',
  ];

  static const flameGame = [
    'package:finemotor/screens/',
    'package:finemotor/repo/',
    'package:finemotor/db/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static const view = [
    'package:finemotor/repo/',
    'package:finemotor/db/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:go_router/',
  ];

  static const controller = [
    'package:finemotor/repo/',
    'package:finemotor/db/',
    'package:go_router/',
    'package:sqflite/',
    'package:http/',
    'package:path_provider/',
    'package:shared_preferences/',
  ];

  static const component = [
    'package:finemotor/repo/',
    'package:finemotor/db/',
    'package:finemotor/router/',
    'package:finemotor/di/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static List<String> denialsForFile(String path) {
    final p = path.replaceAll('\\', '/');
    if (p.contains('/lib/domain/')) return domain;
    if (p.contains('/lib/repo/')) return repo;
    if (p.contains('/lib/db/')) return db;
    if (p.contains('/lib/platform/')) return platform;
    if (p.contains('/lib/flame_game/')) return flameGame;
    if (p.contains('/lib/screens/components/')) return component;
    if (p.contains('/lib/screens/')) {
      if (p.contains('_view.')) return view;
      if (p.contains('_bloc.') ||
          p.contains('_event.') ||
          p.contains('_state.')) {
        return controller;
      }
    }
    return const [];
  }
}
