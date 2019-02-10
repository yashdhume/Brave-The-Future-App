import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/GradientAppBar.dart';
import 'package:brave_the_future/ui/ProjectPageUI/ListOfProjectsBody.dart';
class ProjectPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Buildings"),
          new ListOfProjectsBody(),
        ],
      ),
    );
  }
}