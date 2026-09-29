import 'package:finemotor/domain/entities/level_enum.dart';

class MotorTest {
  const MotorTest({
    required this.title,
    required this.level,
    required this.description,
  });

  final String title;
  final LevelEnum level;
  final String description;
}
