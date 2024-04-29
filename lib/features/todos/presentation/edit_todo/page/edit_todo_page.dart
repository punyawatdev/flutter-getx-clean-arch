// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/presentation/edit_todo/controllers/edit_todo_controller.dart';

class EditTodoPage extends StatelessWidget {
  final Todo? initialTodo;

  const EditTodoPage({
    super.key,
    this.initialTodo,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditTodoController(initialTodo: initialTodo));
    return Form(
      key: controller.editTodoForm,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text(
            controller.isNewTodo.isTrue ? 'Add Todo' : 'Edit Todo',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('EditTodoPage_AddEditTodo_FloatingActionButton'),
          onPressed: () => controller.onSubmitted(),
          child: const Icon(Icons.check_rounded),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  key: const Key('EditTodoPage_Title_TextFormField'),
                  decoration: const InputDecoration(
                    enabled: true,
                    labelText: 'Title',
                  ),
                  maxLength: 50,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
                  ],
                  validator: controller.validator,
                  controller: controller.titleEditingController,
                ),
                TextFormField(
                  key: const Key('EditTodoPage_Description_TextFormField'),
                  decoration: const InputDecoration(
                    enabled: true,
                    labelText: 'Description',
                  ),
                  maxLength: 300,
                  maxLines: 6,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(300),
                  ],
                  controller: controller.descEditingController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
