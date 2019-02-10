import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/project_page.dart';
import 'package:brave_the_future/ui/donationUI/donations.dart';
import 'package:brave_the_future/ui/StoryBoard/StoryBoard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<ViewModel>( 
      builder: (context, child, model) => new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
        
          child:Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Project Page'), 
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectPage())),
            ),
          RaisedButton(
            child: Text('Donation Page'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DonationPage())),
          ),
          RaisedButton(
            child: Text('Story Board Page'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StoryBoard())),
          ),
          RaisedButton(
            child: Icon(Icons.exit_to_app),
            onPressed: () => model.onSignOut(),
          )
        ],
      )),
    )));
  }
}