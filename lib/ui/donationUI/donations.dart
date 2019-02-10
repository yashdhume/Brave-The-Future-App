import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/ui/root_page.dart';
import 'package:brave_the_future/data/auth.dart';
import 'package:brave_the_future/ui/account_page.dart';
class DonationPage extends StatefulWidget{
  @override
  _DonationPage createState() => new _DonationPage();
}
class _DonationPage extends State<DonationPage>{
  PageState state;
  double value;
  void initState(){
    value = 0;
    state = PageState.UND;
  }
  void getUser(ViewModel model){
    if (model.userDefined == PageState.UND){
      state = PageState.UND;
      return;
    }
    else if (model.userDefined == PageState.FAIL){
      Auth auth = Auth();
      auth.getCurrentUser().then((uid){
        if (uid == null) {
          state = PageState.FAIL;
          model.onSetUserDefined(PageState.FAIL);
          return;
        }else{
          model.onSetAuth(auth);
          model.checkNewUser();
          return;
        }
      });
    }
    else{
      state = PageState.VAL;
      return;
    }
  }
  Widget determineSignedIn(ViewModel model, BuildContext context){
    getUser(model);
    switch(state){
      case PageState.UND:
        return Center(child: CircularProgressIndicator(),);
      case PageState.FAIL:
        return Center(child:NotSignedIn(context));
      case PageState.VAL:
        return SignedIn(model);
    }
  }
  Widget NotSignedIn(BuildContext context){
    return RaisedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RootPage(auth: new Auth()))),
        child: Text('Sign In',
        style: TextStyle(
          color: Colors.white,
        ),),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      );
  }
  Widget SignedIn(ViewModel model){
    return Column(
    children: <Widget>[ 
        Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'decrement',
              child: Icon(Icons.remove),
              onPressed: () => setState(() =>value < 0 ? value = 0: value += 5.0),
            ),
            SizedBox(width: 50.0,),
            Text(value.toString(),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(width: 50.0,),
            FloatingActionButton(
              heroTag: 'increment',
              child: Icon(Icons.add),
              onPressed: () => setState(() => value+= 5.0),
            )
          ],
        ),
        SizedBox(height: 20,),
        RaisedButton(
          onPressed: () => model.onDonated(value),
          child: Text('Donate',
          style:TextStyle(
            color: Colors.white,
          ),
          ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
      rebuildOnChange: true,
      builder: (context, child, model) => Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ready to Donate? ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30,),
          determineSignedIn(model, context),
        ],
      ),
    ));
  }
}