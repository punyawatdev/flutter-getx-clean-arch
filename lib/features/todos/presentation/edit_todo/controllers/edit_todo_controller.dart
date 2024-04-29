// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';

class EditTodoController extends GetxController {
  final Todo? initialTodo;

  EditTodoController({this.initialTodo});

  final todosController = Get.find<TodosController>();
  final editTodoForm = GlobalKey<FormState>();
  final titleEditingController = TextEditingController();
  final descEditingController = TextEditingController();

  RxBool get isNewTodo => (initialTodo == null).obs;

  @override
  void onInit() {
    final todo = initialTodo;
    titleEditingController.text = todo != null ? todo.title : '';
    descEditingController.text = todo != null ? todo.description : '';
    super.onInit();
  }

  @override
  void onClose() {
    titleEditingController.dispose();
    descEditingController.dispose();
    super.onClose();
  }

  Future<void> onSubmitted() async {
    final titleInput = titleEditingController.text.trim();
    final descriptionInput = descEditingController.text.trim();
    if (editTodoForm.currentState!.validate()) {
      final todo = initialTodo;
      if (todo == null) {
        todosController.addTodo(
          title: titleInput,
          description: descriptionInput,
        );
      } else {
        todosController.updateTodo(
          todo,
          title: titleInput,
          description: descriptionInput,
        );
      }
      Get.back();
    }
  }

  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }
}
