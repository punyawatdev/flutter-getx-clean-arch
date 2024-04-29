// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/app.dart';
import 'package:flutter_getx_clean_arch/core/services/db/hive_database_manager.dart';
import 'package:flutter_getx_clean_arch/core/services/services.dart';

final class _AppInitialize {
  _AppInitialize._();
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// if you want use for your environment you should uncomment this line
    await HiveDatabaseManager().start();
    ServiceLocator().dependencies();
  }
}

void main() async {
  await _AppInitialize.initialize();
  runApp(const MyApp());
}
