import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/nomal/nomal_page.dart';


class NomalScreen extends StatefulWidget {
  @override
  _NomalScreenState createState() => _NomalScreenState();
}


class _NomalScreenState extends State<NomalScreen> {
  List<String> _todoList = [];

  void _incrementCounter() async {
    setState(() {
      _setStringList2();  // Shared Preferenceに値を保存する。
    });
  }

  void _setStringList2() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('word', _todoList);
  }


  void _getStringList2() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _todoList = pref.getStringList('word') ?? [];
    });
  }
  // Shared Preferenceのデータを削除する
  _remove2() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove('word');
      _setStringList2();
    });
  }


  @override
  void initState() {
    super.initState();
    _getStringList2();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          final todo = _todoList[index];
          ///削除
          return Dismissible(
              key: Key(todo),
              onDismissed: (direction) {
                setState(() {
                  _remove2();
                  _todoList.removeAt(index);
                });
              },
              background: Container(
                color: Colors.redAccent,
              ),
              child: Card(
                child: ListTile(
                  title: Text(_todoList[index]),
                ),
              ),
          );
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
                return NomalPage();
              }),
            );
            if (newListText != null) {
              setState(() {
                // リスト追加
                _todoList.add(newListText);
                _incrementCounter();
              });
            }
          },
          child: Icon(Icons.whatshot),
        ),
      ),
    );
  }
}

