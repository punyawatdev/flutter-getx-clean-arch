class EnumUtils {
  static String getEnumValue(Enum e) => e.toString().split('.').last;
}
