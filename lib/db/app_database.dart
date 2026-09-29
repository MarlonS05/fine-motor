import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:finemotor/db/schema/tables.dart';
import 'package:finemotor/db/seeders/motor_tests_seeder.dart';
import 'package:finemotor/logger/logger.dart';

class AppDatabase {
  static const _version = 1;
  static const _fileName = 'finemotor.db';

  Database? _db;

  Future<Database> get database async => _db ??= await _open();

  Future<Database> _open() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final path = p.join(dir.path, _fileName);
      return openDatabase(
        path,
        version: _version,
        onCreate: (db, version) async {
          await db.execute(Tables.motorTests);
          await MotorTestsSeeder.seed(db);
        },
        onUpgrade: (db, oldVersion, newVersion) async {},
      );
    } on DatabaseException catch (e, st) {
      logger.w('Failed opening database', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<void> ensureOpen() async {
    await database;
  }

  Future<void> wipe() async {
    try {
      await _db?.close();
      _db = null;
      final dir = await getApplicationDocumentsDirectory();
      final path = p.join(dir.path, _fileName);
      await deleteDatabase(path);
    } on DatabaseException catch (e, st) {
      logger.w('Failed wiping database', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<T> transaction<T>(
    Future<T> Function(DatabaseExecutor db) action,
  ) async {
    try {
      final db = await database;
      return db.transaction((txn) => action(txn));
    } on DatabaseException catch (e, st) {
      logger.w('Failed database transaction', error: e, stackTrace: st);
      rethrow;
    }
  }
}

