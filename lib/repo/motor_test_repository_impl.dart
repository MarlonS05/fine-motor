import 'package:finemotor/db/daos/motor_test_dao.dart';
import 'package:finemotor/domain/entities/level_enum.dart';
import 'package:finemotor/domain/models/motor_test.dart';
import 'package:finemotor/domain/repositories/motor_test_repository.dart';

class MotorTestRepositoryImpl implements MotorTestRepository {
  MotorTestRepositoryImpl(this._dao);

  final MotorTestDao _dao;

  @override
  Future<List<MotorTest>> getAll() => _dao.findAll();
  @override
  Future<MotorTest?> getTest(LevelEnum testName) => _dao.getTest(testName);
}
