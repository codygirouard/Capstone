import 'package:flutter/material.dart';
import 'package:flutter_app1/SigninPage.dart';
import 'home.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultra Medz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: HomePage(),
    );
  }
}


