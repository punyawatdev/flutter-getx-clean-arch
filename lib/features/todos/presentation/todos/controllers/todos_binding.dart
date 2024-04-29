// Package imports:
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/datasources/local/todos_local_data_source.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/data/repositories/todos_repository.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/usecases/todos_usecase.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/utils/snack_bar.dart';

class TodosBinding implements Bindings {
  @override
  void dependencies() {
    final todosDatabase = Hive.box<TodoHiveModel>(TodoHiveModel.boxKey);
    final snackBarMessenger = SnackBarMessenger();
    Get.lazyPut(() => TodosLocalDataSource(todosDatabase));
    Get.lazyPut(() => TodosRepositoryImpl(Get.find<TodosLocalDataSource>()));
    Get.lazyPut(() => TodosUseCase(Get.find<TodosRepositoryImpl>()));
    Get.lazyPut(
      () => TodosController(
        todosUseCase: Get.find<TodosUseCase>(),
        uuidGenerator: Get.find<Uuid>(),
        snackBarMessenger: snackBarMessenger,
      ),
    );
  }
}
