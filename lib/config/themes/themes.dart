// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/config/themes/colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
  );
}
