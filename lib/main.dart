import 'package:flutter/material.dart';
import 'package:brave_the_future/Projects/list_of_projects.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.cyan[600],
      ),
      home: ListofProjects(),
    );
  }
}
