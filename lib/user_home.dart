import 'package:flutter/material.dart';
import 'package:flutter_app1/profile.dart';
import 'bottom_bar.dart';
import 'sign_in_page.dart';
import 'package:flutter_app1/backend/med_controller.dart';
import 'package:flutter_app1/backend/user_controller.dart';
import 'globals.dart' as globals;

void main() {
  runApp(UserHome());
}

class UserHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHome();
}

class _UserHome extends State<UserHome> {
  String medName;
  String dosage;
  String time;
  String repeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: const Text('Home'),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _addMedicine(context),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _addMedicine(BuildContext context) {
    return new AlertDialog(
      title: const Text('Add medicine'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextField(
            onChanged: (String text) {
              setState(() {
                medName = text;
              });
            },
            decoration: new InputDecoration(labelText: 'Medicine Name'),
          ),
          new TextField(
            onChanged: (String text) {
              setState(() {
                dosage = text;
              });
            },
            decoration: new InputDecoration(labelText: "Dosage"),
          ),
          new TextField(
            onChanged: (String text) {
              setState(() {
                time = text;
              });
            },
            decoration: new InputDecoration(labelText: "Time"),
          ),
          new TextField(
            onChanged: (String text) {
              setState(() {
                repeat = text;
              });
            },
            decoration: new InputDecoration(labelText: "Repeat"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: GestureDetector(
              onTap: () {
                //String UserID;
                print(globals.email);
                print(globals.id);
                int Time = int.parse(time);
                int Repeat = int.parse(repeat);
                addMedicine(globals.id, medName, dosage, Time, Repeat);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserHome()),
                ).then((value) => setState(() {}));
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
                child: new Text("Add Medicine",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
