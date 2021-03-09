import 'package:flutter/material.dart';
import 'sign_in_page.dart';
import 'user_home.dart';

void main() {
  runApp(SignUpPage());
}

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  List<String> _genders = [
    'Male',
    'Female',
  ];
  String _gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffff9fafc),
      body: Center(
        child: Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: new Text(
                    "Profile",
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'optima',
                        color: Color(0xfff4682B5)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image(
                image: AssetImage('images/Main_logo.jpg'),
                height: 160,
                width: 160,
              ),
            ),
            SizedBox(
              height: 450,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'First Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Last Name'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 200),
                    child: new Text('Personal Information',
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF18D191),
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Height'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Age'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Pharmacy'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Insurance'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: new DropdownButton<String>(
                      hint: Text(
                        'Gender',
                        style: new TextStyle(fontSize: 16),
                      ),
                      value: _gender,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 270),
                        child: Icon(Icons.arrow_downward),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _gender = newValue;
                        });
                      },
                      items: _genders.map((gender) {
                        return DropdownMenuItem(
                          child: new Text(gender),
                          value: gender,
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 200),
                    child: new Text('Security Information',
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF18D191),
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(labelText: 'Password'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    child: new TextField(
                      decoration: new InputDecoration(
                          labelText: "Mother's maiden name"),
                    ),
                  ),
                ],
              ),
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
                              color: Color(0xFF18D191),
                              borderRadius: new BorderRadius.circular(9.0)),
                          child: new Text("Sign Up",
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
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
                      left: 25,
                      top: 20,
                    ),
                    child: new Container(
                      child: new Text("Already have an account?"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      top: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ));
                      },
                      child: new Container(
                        child: new Text("Sign In",
                            style: new TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF18D191),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
