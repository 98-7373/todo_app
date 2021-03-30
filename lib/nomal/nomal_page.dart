import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' as math;

class NomalPage extends StatefulWidget {
  @override
  _NomalPageState createState() => _NomalPageState();
}

class _NomalPageState extends State<NomalPage> {
  String _text1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('格言追加'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text1,
              style: TextStyle(color: Colors.blue),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text1 = value;
                });
              },
            ),
            RaisedButton(
              child: const Text('追加'),
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop(_text1);
              },
            )
          ],
        ),
      ),
    );
  }
}
