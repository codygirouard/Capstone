import 'package:flutter/material.dart';
import 'SigninPage.dart';
import 'SignupPage.dart';


class HomePage extends StatelessWidget {
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
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SigninPage(),
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
                                fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold))),
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
                        left: 50.0, right: 50.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ));
                      },
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            color: Color(0xFF18D191),
                            borderRadius: new BorderRadius.circular(9.0)),
                        child: new Text("Sign Up",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
