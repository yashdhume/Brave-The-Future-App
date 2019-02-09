import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/home_page.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:scoped_model/scoped_model.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ViewModel>( 
      model: ViewModel(),
      child: MaterialApp(
      title: 'Brave The Future',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.cyan[600],
      ),
      home: HomePage(),
    ));
  }
}
