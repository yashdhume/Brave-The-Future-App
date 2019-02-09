import 'package:flutter/material.dart';
import 'package:brave_the_future/data/auth.dart';
class LoginPage extends StatefulWidget{
  final Auth auth;
  final VoidCallback onSignedIn;
  LoginPage({this.auth, this.onSignedIn});
  @override
  _LoginPage createState() => new _LoginPage();
}
enum FormMode { SIGNIN, SIGNUP}
class _LoginPage extends State<LoginPage>{
  final formKey = new GlobalKey<FormState>();
  FormMode _formMode = FormMode.SIGNIN;
  String _email, _password;
  void _signUp() {
    formKey.currentState.reset();
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _signIn() {
    formKey.currentState.reset();
    setState(() {
      _formMode = FormMode.SIGNIN;
    });
  }
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formMode == FormMode.SIGNIN) {
          String userId =
          await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          String userId = await widget.auth
              .signUp(_email, _password);
          print('Signed up user: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }
  Widget _logo(){
    return Text('Progress Bar',
      textAlign: TextAlign.start,
      textScaleFactor: 2.0,
      style: new TextStyle(color: Colors.grey),
    );
  }
  Widget _emailInput() {
    return new Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value,
    ));
  }

  Widget _passwordInput() {
    return new Container(
      padding: EdgeInsets.all(10),
      child:TextFormField(
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) =>
      value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value,
    ));
  }
  Widget _label() {
    if (_formMode == FormMode.SIGNIN) {
      return
        new FlatButton(
          child: new Text('Create an account',
              style:
              new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
          onPressed: _signUp,
        );
    } else {
      return
        new FlatButton(
          child: new Text('Have an account? Sign in',
              style:
              new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
          onPressed: _signIn,
        );
    }
  }
  Widget _submitButton() {
    if (_formMode == FormMode.SIGNIN) {
      return
        new Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: new Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.blueAccent.shade100,
                elevation: 5.0,
                child: new MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  color: Colors.blue,
                  child: new Text('Login',
                      style:
                      new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: validateAndSubmit,
                )));
    } else {
      return
        new Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: new Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.lightBlueAccent.shade100,
                elevation: 5.0,
                child: new MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  color: Colors.blue,
                  child: new Text('Create account',
                      style:
                      new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: validateAndSubmit,
                )));
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Form(
        key: formKey,
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_logo(), _emailInput(), _passwordInput(), _label(), _submitButton()],
      ),
      ),
    );
  }
}