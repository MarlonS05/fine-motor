import 'package:sqflite/sqflite.dart';
import 'package:finemotor/db/app_database.dart';
import 'package:finemotor/db/seeders/motor_tests_seeder.dart';
import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/motor_test.dart';
import 'package:finemotor/logger/logger.dart';

class MotorTestDao {
  MotorTestDao(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<MotorTest>> findAll() async {
    try {
      final db = await _appDatabase.database;
      final rows = await db.query(MotorTestsSeeder.table, orderBy: 'rowid');
      return rows
          .map(
            (row) => MotorTest(
              title: row['title']! as String,
              level: LevelEnum.values.byName(row['level']! as String),
              description: row['description']! as String,
            ),
          )
          .toList(growable: false);
    } on DatabaseException catch (error, stackTrace) {
      logger.w(
        'Failed loading motor tests',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<MotorTest?> getTest(LevelEnum testName) async {
    try {
      final db = await _appDatabase.database;
      final rows = await db.query(
        MotorTestsSeeder.table,
        where: 'level = ?',
        whereArgs: [testName.name],
        limit: 1,
      );
      if (rows.isEmpty) {
        return null;
      }
      final row = rows.first;
      return MotorTest(
        title: row['title']! as String,
        level: LevelEnum.values.byName(row['level']! as String),
        description: row['description']! as String,
      );
    } on DatabaseException catch (error, stackTrace) {
      logger.w(
        'Failed loading motor tests',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
