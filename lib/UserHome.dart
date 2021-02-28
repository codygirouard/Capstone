import 'package:flutter/material.dart';
import 'package:flutter_app1/SigninPage.dart';
import 'home.dart';
import 'calendar.dart';
import 'buttom_bar.dart';

void main() {
  runApp(UserHome());
}

class UserHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHome();
}

class _UserHome extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: const Text('Home'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: buttom_bar(),
      );
  }
}
