// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

@JsonSerializable()
final class Todo with EquatableMixin {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdDate;

  Todo({
    String? id,
    required this.title,
    this.description = '',
    required this.isCompleted,
    required this.createdDate,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  @override
  List<Object> get props => [id, title, description, isCompleted, createdDate];

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
