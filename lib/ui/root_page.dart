import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:brave_the_future/data/auth.dart';
import 'package:brave_the_future/ui/home_page.dart';
import 'package:brave_the_future/view_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/ui/account_page.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth, this.Next});
  final AuthImpl auth;
  final Widget Next;
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_SIGNED_IN,
  SIGNED_IN,
}

class _RootPageState extends State<RootPage> {

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  initState() {
    super.initState();
    widget.auth.getCurrentUser().then((userId) {
      setState(() {
          authStatus = userId == null ? AuthStatus.NOT_SIGNED_IN : AuthStatus.SIGNED_IN;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.SIGNED_IN;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_SIGNED_IN;
    });
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
  Widget CheckAuth(ViewModel model){
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _buildWaitingScreen();
      case AuthStatus.NOT_SIGNED_IN:
        model.onSetUserDefined(PageState.UND);
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.SIGNED_IN:
        return AccountPage();
    }
  }

  @override
  Widget build(BuildContext context) {
        return ScopedModelDescendant<ViewModel>( 
          builder: (context, child, model){
            if (model.userDefined == PageState.FAIL){
             model.onSetAuth(widget.auth);
              model.checkNewUser();
            }
            return CheckAuth(model);
          }
      );
    }
  
}