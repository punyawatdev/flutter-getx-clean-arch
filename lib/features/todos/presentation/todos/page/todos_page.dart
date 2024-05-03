// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/presentation/edit_todo/page/edit_todo_page.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/controllers/todos_controller.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/todos/widgets/widgets.dart';

class TodosPage extends GetView<TodosController> {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todosFilter = Obx(
      () => TodosFilterButton(
        key: const Key('TodosPage_TodosFilterButton'),
        initialValue: controller.filter.value,
        onSelected: (filter) {
          controller.onFilterChanged(filter);
        },
      ),
    );
    final todosOptions = Obx(
      () => TodosOptionsButton(
        key: const Key('TodosPage_TodosOptionsButton'),
        hasTodos: controller.hasTodos.value,
        hasCompletedTodos: controller.hasCompletedTodos.value,
        onSelected: (options) {
          switch (options) {
            case TodosViewOption.toggleAll:
              controller.toggleCompletedAll();
              break;
            case TodosViewOption.clearCompleted:
              controller.clearCompleted();
              break;
          }
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        title: const Text('Flutter Todos'),
        actions: [todosFilter, todosOptions],
      ),
      body: GetBuilder<TodosController>(
        builder: (todosController) => ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          itemCount: todosController.todos.length,
          itemBuilder: (context, index) {
            final todo = todosController.todos[index];
            return TodosTile(
              todo: todo,
              onToggleCompleted: (bool? value) {
                todosController.toggleTodoStatus(todo.id, value ?? false);
              },
              onDismissed: (_) {
                todosController.deleteTodo(todo);
              },
              onTap: () {
                Get.to(
                  () => EditTodoPage(initialTodo: todo),
                  transition: Transition.downToUp,
                  fullscreenDialog: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
