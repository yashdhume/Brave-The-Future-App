import 'package:flutter/material.dart';
import 'package:brave_the_future/data/auth.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  final AuthImpl auth;
  final VoidCallback onSignedIn;

  LoginPage({this.auth, this.onSignedIn});

  @override
  _LoginPage createState() => new _LoginPage();
}

enum FormMode { SIGNIN, SIGNUP }

class _LoginPage extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  FormMode _formMode = FormMode.SIGNIN;
  String _email, _password;

  void _signUp() {
    formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _signIn() {
    formKey.currentState.reset();
    _errorMessage = "";
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

  bool _isIos;

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      try {
        if (_formMode == FormMode.SIGNIN) {
          String userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          String userId = await widget.auth.signUp(_email, _password);
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _logo() {
    return new Container(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          //heightFactor: 0.5,
          //widthFactor: 0.5,
          child: Image.asset("assets/BraveTheFuture_TwoLines.jpg")
        ),

      ),

    );
  }

  Widget _emailInput() {
    return new Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 30.0,
            width: 1.0,
            color: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.only(left: 00.0, right: 10.0),
          ),
          new Expanded(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) =>
                  value.isEmpty ? 'Email can\'t be empty' : null,
              onSaved: (value) => _email = value,
            ),
          )
        ],
      ),
    );
  }

  bool _toggleObscureText = true;

  Widget _passwordInput() {
    return new Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Icon(
              Icons.lock_open,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 30.0,
            width: 1.0,
            color: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.only(left: 00.0, right: 10.0),
          ),
          new Expanded(
            child: TextFormField(
              obscureText: _toggleObscureText,
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_toggleObscureText == true)
                        _toggleObscureText = false;
                      else
                        _toggleObscureText = true;
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.eye,
                    size: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              validator: (value) =>
                  value.isEmpty ? 'Password can\'t be empty' : null,
              onSaved: (value) => _password = value,
            ),
          )
        ],
      ),
    );
  }

  Widget _newAccount(String option, var sign) {
    return new Container(
      //width: MediaQuery.of(context).size.width,
      //margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.transparent,
              child: Container(
                //padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.center,
                child: Text(
                  option,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: sign,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newAccountCheck() {
    if (_formMode == FormMode.SIGNIN)
      return _newAccount('Create an account', _signUp);
    else
      return _newAccount('Have an account? Sign in', _signIn);
  }

  Widget _submitButton(String string) {
    return new Container(
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.white,
              child: Container(
                //padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.center,
                child: Text(
                  string,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onPressed: validateAndSubmit,
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButtonCheck() {
    if (_formMode == FormMode.SIGNIN)
      return _submitButton("Login");
    else
      return _submitButton("Create Account");
  }

  String _errorMessage;
  bool _isLoading;

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: new Container(
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                  begin: Alignment.topLeft,
                  end: new Alignment(3, 0),
                  colors: [
                    const Color(0xffb003C71),
                    const Color(0xffb0077CA),
                  ],
                )),
                child: new Form(
                  key: formKey,
                  child: new Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        _logo(),
                        SizedBox(height: 50),
                        _emailInput(),
                        _passwordInput(),
                        _newAccountCheck(),
                        _submitButtonCheck(),
                        //_showErrorMessage(),
                      ]),
                ))));
  }
}
