// Project imports:
import 'package:flutter_getx_clean_arch/features/todos/data/models/todo.dart';
import 'package:flutter_getx_clean_arch/features/todos/domain/entities/todo.dart';

extension TodoHiveModelX on TodoHiveModel {
  Todo toEntity() => Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        createdDate: createdDate,
      );
}
