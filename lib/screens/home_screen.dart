import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/models/providers.dart';
import 'package:river/screens/add_screen.dart';
import 'package:river/screens/edit_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = context.read(todoList.notifier);
    return Scaffold(
        appBar: AppBar(title: Text('予定リスト')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddScreen()));
          },
          child: Icon(Icons.add),
        ),
        // body
        body: Consumer(builder: (_, watch, __) {
          final myList = watch(todoList);
          return ListView.builder(
              itemCount: myList.length,
              itemBuilder: (_, i) {
                final todo = myList[i];
                return Card(
                  child: Dismissible(
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.favorite, color: todo.favorite ? Colors.pink : null),
                        onPressed: () {
                          notifier.toggle(todo.id);
                        },
                      ),
                      title: Text(todo.title, overflow: TextOverflow.ellipsis, maxLines: 1),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditScreen(todo: todo)));
                      },
                    ),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      padding: EdgeInsets.only(right: 8),
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    key: ValueKey<String>(todo.id),
                    confirmDismiss: (_) {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('削除しますか'),
                          actions: [
                            TextButton(
                              child: Text('キャンセル'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                            TextButton(
                              child: Text('削除'),
                              onPressed: () {
                                notifier.delete(todo.id);
                                Navigator.of(ctx).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              });
        }));
  }
}
