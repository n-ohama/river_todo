import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/freezed/todo.dart';
import 'package:river/models/todo_list.dart';

final todoList = StateNotifierProvider<TodoList, List<Todo>>(
  (ref) => TodoList(),
);
