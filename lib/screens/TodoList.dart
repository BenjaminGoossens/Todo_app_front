import 'package:flutter/material.dart';

import 'Home.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    List<int> maListe = [1, 2, 3, 4, 5];

    return SafeArea(
        child: Scaffold(
        body: Center(

        child:
        ElevatedButton(
        onPressed: ()
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    },
    child: Text('Aller à la première page'),
    ),
    ),
    ),
    );
  }
}