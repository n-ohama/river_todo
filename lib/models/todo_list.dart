import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/freezed/todo.dart';

class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([]);

  void add(Todo todo) {
    state = [todo, ...state];
  }

  void delete(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }

  void update(String id, String title) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(title: title) else todo
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(favorite: !todo.favorite) else todo
    ];
  }
}
