import 'package:flutter/material.dart';
import 'package:flutter_app1/sign_up_page.dart';
import 'package:flutter_app1/user_home.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffff9fafc),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 100.0),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                obscureText: true,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: new Text("Forgot Password?",
                            style: new TextStyle(
                                fontSize: 17.0, color: Color(0xFF18D191)))),
                  ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserHome(),
                            ));
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
                              borderRadius: new BorderRadius.circular(9.0)),
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
                    padding: const EdgeInsets.only(left: 30, top: 100.0),
                    child: new Container(
                      child: new Text("Don't have an account?"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
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
    );
  }
}
