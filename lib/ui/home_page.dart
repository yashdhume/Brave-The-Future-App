import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/project_page.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          RaisedButton(child: Text('Project Page'), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectPage())),),
        ],
      ),
    );
  }
}