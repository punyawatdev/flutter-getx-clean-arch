// Flutter imports:
import 'package:flutter/material.dart';

enum TodosViewOption { toggleAll, clearCompleted }

class TodosOptionsButton extends StatelessWidget {
  final bool hasTodos;
  final bool hasCompletedTodos;
  final ValueChanged<TodosViewOption> onSelected;

  const TodosOptionsButton({
    super.key,
    this.hasTodos = false,
    this.hasCompletedTodos = false,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodosViewOption>(
      onSelected: (options) => onSelected.call(options),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            key: const Key('TodosOptionsButton_ToggleAll'),
            value: TodosViewOption.toggleAll,
            enabled: hasTodos,
            child: const Text('Mark All as completed'),
          ),
          PopupMenuItem(
            key: const Key('TodosOptionsButton_ClearCompleted'),
            value: TodosViewOption.clearCompleted,
            enabled: hasTodos && hasCompletedTodos,
            child: const Text('Clear completed'),
          ),
        ];
      },
      icon: const Icon(Icons.more_vert_rounded),
    );
  }
}
