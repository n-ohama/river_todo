import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/freezed/todo.dart';
import 'package:river/models/providers.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            final id = DateTime.now().toString();
            final todo = Todo(id: id, title: titleCtrl.text);
            context.read(todoList.notifier).add(todo);
            Navigator.of(context).pop();
          },
        ),
        title: Text('追加'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: titleCtrl,
          autofocus: true,
          maxLines: 100,
          keyboardType: TextInputType.multiline,
          cursorHeight: 25,
        ),
      ),
    );
  }
}
