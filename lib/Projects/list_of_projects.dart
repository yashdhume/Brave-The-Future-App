import 'package:flutter/material.dart';
import 'package:brave_the_future/Projects/GradientAppBar.dart';
class ListofProjects extends StatelessWidget{
  Widget build (BuildContext context){
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("List")
        ],
      ),
    );

  }
}