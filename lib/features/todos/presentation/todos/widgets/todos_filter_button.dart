// Flutter imports:
import 'package:flutter/material.dart';

enum TodosViewFilter { all, activeOnly, completedOnly }

class TodosFilterButton extends StatelessWidget {
  final TodosViewFilter initialValue;
  final ValueChanged<TodosViewFilter> onSelected;

  const TodosFilterButton({
    super.key,
    this.initialValue = TodosViewFilter.all,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodosViewFilter>(
      initialValue: initialValue,
      onSelected: (filter) => onSelected.call(filter),
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: TodosViewFilter.all,
            child: Text('All'),
          ),
          PopupMenuItem(
            value: TodosViewFilter.activeOnly,
            child: Text('Active Only'),
          ),
          PopupMenuItem(
            value: TodosViewFilter.completedOnly,
            child: Text('Completed Only'),
          ),
        ];
      },
      icon: const Icon(Icons.filter_list),
    );
  }
}
