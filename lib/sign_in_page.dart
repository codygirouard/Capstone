import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app1/backend/user_controller.dart';
import 'package:flutter_app1/home.dart';
import 'backend/auth.dart';
import 'sign_up_page.dart';
import 'user_home.dart';

void main() {
  runApp(SigninPage());
}

class SigninPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SigninPage();
}

class _SigninPage extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool throwError = false;
  String Email = "";
  String Password = "";
  String email = "";
  String maiden_name = "";
  String new_password = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffff9fafc),
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                    child: Image(
                      image: AssetImage('images/Main_logo.jpg'),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 40.0),
                        child: new Text(
                          "Ultra Medz",
                          style: new TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'optima',
                              color: Color(0xfff4682B5)),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextFormField(
                      controller: emailController,
                      onChanged: (String text) {
                        setState(() {
                          Email = text;
                        });
                      },
                      decoration: new InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  new SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextFormField(
                      controller: passwordController,
                      onChanged: (String text) {
                        setState(() {
                          Password = text;
                        });
                      },
                      obscureText: true,
                      decoration: new InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 20.0, top: 0.0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context),
                                );
                              },
                              child: new Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  child: new Text("Forgot Password?",
                                      style: new TextStyle(
                                          fontSize: 17.0,
                                          color: Color(0xFF18D191)))),
                            )),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 50.0, right: 50.0, top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                // Process data.
                                authenticateUser(Email, Password)
                                    .then((authenticated) {
                                  print("authenticated == $authenticated");
                                  if (authenticated) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => UserHome(),
                                    ));
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _errorPopup(context),
                                    );
                                  }
                                });
                              }
                            },
                            child: new Container(
                                alignment: Alignment.center,
                                height: 60.0,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xfff020202),
                                      width: 2,
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(9.0)),
                                child: new Text("Sign In",
                                    style: new TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 50, top: 140.0, bottom: 10),
                          child: new Container(
                            child: new Text("Don't have an account?"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 140.0, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ));
                            },
                            child: new Container(
                              child: new Text("Sign Up",
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: Color(0xFF18D191),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorPopup(BuildContext context) {
    return new AlertDialog(
        title: const Text('Incorrect information. Please try again!'),
      content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: GestureDetector(
                onTap: (){
                  // Process data.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      border: Border.all(
                        color: Color(0xfff020202),
                        width: 2,
                      ),
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: new Text("Try Again",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            ]
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Forgot Password'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextField(
            onChanged: (String text) {
              setState(() {
                email = text;
              });
            },
            decoration: new InputDecoration(labelText: 'Email'),
          ),
          new TextField(
            onChanged: (String text) {
              setState(() {
                maiden_name = text;
              });
            },
            decoration: new InputDecoration(labelText: "Mother's maiden name"),
          ),
          new TextField(
            onChanged: (String text) {
              setState(() {
                new_password = text;
              });
            },
            decoration: new InputDecoration(labelText: "New Password"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: GestureDetector(
              onTap: (){
                  // Process data.
                  forgot_passwordcheck(email, maiden_name)
                      .then((authenticated) {
                    print("authenticated == $authenticated");
                    if (authenticated) {
                      changeUserPwd(email, new_password);
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (context) => UserHome(),
                      ));
                    }else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _errorPopup(context),
                      );
                    }
                  });
              },
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                decoration: new BoxDecoration(
                    border: Border.all(
                      color: Color(0xfff020202),
                      width: 2,
                    ),
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(9.0)),
                child: new Text("Change Password",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: IconButton(
            icon: const Icon(Icons.clear),
          ),
        ),
      ],
    );
  }
}
