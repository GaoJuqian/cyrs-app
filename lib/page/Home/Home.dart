import 'package:cyrs_app/components/TodoList/TodoList.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}): super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final GlobalKey<TodoListState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return TodoList(key: homeKey);
  }
}

