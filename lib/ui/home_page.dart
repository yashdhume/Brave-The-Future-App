import 'package:flutter/material.dart';
import 'package:brave_the_future/ui/ProjectPageUI/project_page.dart';
import 'package:brave_the_future/ui/donationUI/donations.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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
        ],
      )),
    ));
  }
}