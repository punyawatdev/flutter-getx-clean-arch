// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:flutter_getx_clean_arch/core/services/db/hive_types.dart';

part 'todo.g.dart';

@HiveType(typeId: HiveTypes.todosHiveModelId)
@immutable
final class TodoHiveModel with EquatableMixin {
  static const String boxKey = 'TodoHiveModel';

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2, defaultValue: '')
  final String description;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final DateTime createdDate;

  TodoHiveModel({
    required this.id,
    required this.title,
    this.description = '',
    required this.isCompleted,
    required this.createdDate,
  });

  TodoHiveModel withUpdatedId(String newId) {
    return TodoHiveModel(
      id: newId,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdDate: createdDate,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted, createdDate];
}
