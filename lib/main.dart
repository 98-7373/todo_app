import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/todo/todo_page.dart';

void main() {
  runApp(MyApp());
}
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  var titleText = 'flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

