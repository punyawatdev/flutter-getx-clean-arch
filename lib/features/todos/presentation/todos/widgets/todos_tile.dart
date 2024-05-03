// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';

class TodosTile extends StatelessWidget {
  const TodosTile({
    super.key,
    required this.todo,
    required this.onToggleCompleted,
    required this.onDismissed,
    this.onTap,
  });

  final Todo todo;
  final ValueChanged<bool?> onToggleCompleted;
  final DismissDirectionCallback onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('TodosTile_Dismissible_${todo.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        key: Key(todo.id),
        leading: Checkbox(
          key: Key('TodosTile_Checkbox_${todo.id}'),
          value: todo.isCompleted,
          onChanged: onToggleCompleted,
        ),
        title: Text(
          todo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: todo.isCompleted
              ? TextStyle(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  decoration: TextDecoration.lineThrough,
                )
              : null,
        ),
        subtitle: Text(
          todo.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: onTap == null ? null : const Icon(Icons.navigate_next),
        onTap: onTap,
      ),
    );
  }
}
