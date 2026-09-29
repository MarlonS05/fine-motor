import 'package:sqflite/sqflite.dart';
import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/logger/logger.dart';

abstract final class MotorTestsSeeder {
  static const table = 'motor_tests';

  static Future<void> seed(DatabaseExecutor db) async {
    try {
      await db.insert(table, {
        'title': 'Draw shapes',
        'level': LevelEnum.drawShapes.name,
        'description': 'Draw the shown shapes as accurately as possible.',
      });
    } on DatabaseException catch (error, stackTrace) {
      logger.w(
        'Failed seeding motor tests',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
