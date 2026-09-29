import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/motor_test.dart';

abstract interface class MotorTestRepository {
  Future<List<MotorTest>> getAll();
  Future<MotorTest?> getTest(LevelEnum testName);
}
