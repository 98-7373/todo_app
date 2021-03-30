import 'package:flutter/material.dart';
import 'package:todo_app/nomal/nomal_page.dart';


class NomalScreen extends StatefulWidget {
  @override
  _NomalScreenState createState() => _NomalScreenState();
}

class _NomalScreenState extends State<NomalScreen> {
  List<String> todoList = [];
  List<String> _wordList = [
    "やめときな！正義だ悪だと口にするには！この世のどこを探しても答えはねぇだろ！くだらねぇ！",
    "笑われていこうじゃねぇか。高みを目指せば出す拳の見つからねぇケンカもあるもんだ！",
    "",
  ];
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
                todoList.add(newListText);
              });
            }
          },
          child: Icon(Icons.whatshot),
        ),
      ),
    );
  }
}

