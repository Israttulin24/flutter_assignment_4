import 'package:flutter/material.dart';
import 'package:task_manage/ToDoPage.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "To Do",
      home: ToDoPage(),
    );
  }
}
