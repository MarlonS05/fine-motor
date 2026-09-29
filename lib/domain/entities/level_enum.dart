enum LevelEnum {
  drawShapes,
}

LevelEnum? getLevelEnumForString(String? input) {
  for (final level in LevelEnum.values) {
    if (level.name == input || level.toString() == input) {
      return level;
    }
  }
  return null;
}

String? getStringForLevelEnum(LevelEnum? level) {
  if (level == null) return null;
  return level.name;
}
