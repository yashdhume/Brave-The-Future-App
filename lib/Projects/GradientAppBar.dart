import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;

  GradientAppBar(this.title);

  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Container(
      height: 66,
      padding:  new EdgeInsets.only(top: statusBarHeight ),
      decoration: new BoxDecoration(color: Colors.blue),
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Franklin',
            fontWeight: FontWeight.w600,
            fontSize: 36.0
          ),
        ),
      ),
    );
  }
}
