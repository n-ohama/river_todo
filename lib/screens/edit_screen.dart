import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/freezed/todo.dart';
import 'package:river/models/providers.dart';

class EditScreen extends StatefulWidget {
  final Todo todo;
  EditScreen({required this.todo});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    final _titleCtrl = TextEditingController(text: widget.todo.title);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.read(todoList.notifier).update(widget.todo.id, _titleCtrl.text);
            Navigator.of(context).pop();
          },
        ),
        title: Text('編集'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: _titleCtrl,
          // autofocus: true,
          maxLines: 100,
          keyboardType: TextInputType.multiline,
          cursorHeight: 25,
        ),
      ),
    );
  }
}
