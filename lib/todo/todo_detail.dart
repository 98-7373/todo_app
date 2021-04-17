import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget {
  @override
  _TodoDetailState createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  ///入力したデータをテキストとしてもつ。
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO追加'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: TextStyle(color: Colors.blue),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "TODOを追加"
              ),
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
              autofocus: true,
            ),
            RaisedButton(
              child: const Text('追加'),
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop(_text);
              },
            )
          ],
        ),
      ),
    );
  }
}
