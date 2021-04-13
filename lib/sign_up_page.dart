import 'package:flutter/material.dart';
import 'package:flutter_app1/home.dart';
import 'sign_in_page.dart';
import 'user_home.dart';
import 'backend/user_controller.dart';

void main() {
  runApp(SignupPage());
}

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String f_Name = "";
  String l_Name = "";
  String email = "";
  String phone_no = "";
  String height = "";
  String weight = "";
  String age = "";
  String pharmacy = "";
  String insurance = "";
  String gender = "";
  String password = "";
  String maiden_name = "";
  List<String> _genders = [
    'Male',
    'Female',
  ];
  String _gender;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffff9fafc),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
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
                    height: 400,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                f_Name = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'First Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                l_Name = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Last Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 200),
                          child: new Text('Personal Information',
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF18D191),
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                email = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(labelText: 'Email'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                phone_no = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Phone Number'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                height = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Height (cm)'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                weight = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Weight (lbs)'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                age = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(labelText: 'Age'),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                pharmacy = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Pharmacy'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                insurance = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Insurance'),
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
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                password = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration:
                                new InputDecoration(labelText: 'Password'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0.0),
                          child: new TextFormField(
                            onChanged: (String text) {
                              setState(() {
                                maiden_name = text;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
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
                              if (_formKey.currentState.validate()) {
                                // Process data.
                                var usrHeight = int.parse(height);
                                var usrWeight = int.parse(weight);
                                var usrAge = int.parse(age);
                                createUser(
                                    f_Name,
                                    l_Name,
                                    email,
                                    usrHeight,
                                    usrWeight,
                                    usrAge,
                                    password,
                                    0,
                                    phone_no,
                                    pharmacy,
                                    insurance,
                                    _gender,
                                    maiden_name).then((failed) {
                                      print("failed == $failed");
                                      if (failed) {
                                        Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => SignupPage(),
                                              ));
                                      } else {
                                        Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => UserHome(),
                                              ));
                                      }
                                  }
                                );
                              }
                            },
                            child: new Container(
                                alignment: Alignment.center,
                                height: 60.0,
                                decoration: new BoxDecoration(
                                    color: Color(0xFF18D191),
                                    borderRadius:
                                        new BorderRadius.circular(9.0)),
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
                            left: 37,
                            top: 20,
                            bottom: 10,
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
                            bottom: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninPage(),
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
          ),
        ),
      ),
    );
  }
}
