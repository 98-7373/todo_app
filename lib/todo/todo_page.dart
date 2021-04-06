import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/todo/todo_detail.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  void _increment() async {
    setState(() {
      _setStringList(); // Shared Preferenceに値を保存する。
    });
  }

  void _setStringList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('todo', todoList);
  }

  void _getStringList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      todoList = pref.getStringList('todo') ?? [];
    });
  }

  // Shared Preferenceのデータを削除する
   _remove() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove('todo');
      _setStringList();
    });
  }
  @override
  void initState() {
    super.initState();
    _getStringList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];
          ///削除
          return Dismissible(
              key: Key(todo),
              onDismissed: (direction) {
                setState(() {
                  _remove();
                  todoList.removeAt(index);
                });
              },
              background: Container(
                color: Colors.redAccent,
              ),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                ),
              ));
        },
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () async {
            // "push"で新規画面に遷移
            // リスト追加画面から渡される値を受け取る
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                // 遷移先の画面としてリスト追加画面を指定
                return TodoDetail();
              }),
            );
            if (newListText != null) {
              setState(() {
                todoList.add(newListText);
                _increment();
              });
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
