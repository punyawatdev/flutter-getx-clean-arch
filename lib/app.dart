// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/config/constants/constants.dart';
import 'package:flutter_getx_clean_arch/config/themes/themes.dart';
import 'package:flutter_getx_clean_arch/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todos',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.getPages,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor =
            min(smallestSize / AppConstants.designScreenSize.width, 1.0);
        final textScale = TextScaler.linear(textScaleFactor);

        return MediaQuery(
          data: data.copyWith(textScaler: textScale),
          child: child,
        );
      },
    );
  }
}
