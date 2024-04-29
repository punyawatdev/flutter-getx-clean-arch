// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';

extension TodoX on Todo {
  TodoHiveModel toHiveModel() => TodoHiveModel(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        createdDate: createdDate,
      );
}
