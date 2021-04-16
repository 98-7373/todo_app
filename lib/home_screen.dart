import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/nomal/nomal_screen.dart';
import 'package:todo_app/todo/todo_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          ],
        ),
        // ignore: missing_return
        tabBuilder: (context, index) {
          switch (index) {
            case 0: // 1番左のタブが選ばれた時の画面
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(),
                  child: TodoPage(), // 表示したい画面のWidget
                );
              });
            case 1: // ほぼ同じなので割愛
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(),
                  child: NomalScreen(), // 表示したい画面のWidget
                );
              });
          }
        });
  }
}
