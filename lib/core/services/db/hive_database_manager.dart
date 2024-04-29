// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';

abstract class IDatabaseManager {
  Future<void> start();
  Future<void> clear();
}

class HiveDatabaseManager implements IDatabaseManager {
  @override
  Future<void> start() async {
    await _open();
    await initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  /// Open your database connection
  Future<void> _open() async {
    await Hive.initFlutter();
  }

  /// Register your generic model or make yours operation before start
  Future<void> initialOperation() async {
    // NOTE: Adapters
    Hive.registerAdapter(TodoHiveModelAdapter());
    // NOTE: openBox
    await Hive.openBox<TodoHiveModel>(TodoHiveModel.boxKey);
  }
}
