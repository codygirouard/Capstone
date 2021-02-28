import 'package:flutter/material.dart';
import 'package:flutter_app1/SigninPage.dart';
import 'home.dart';
import 'buttom_bar.dart';

void main() {
  runApp(calendar());
}

// ignore: camel_case_types
class calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _calendar();
}

// ignore: camel_case_types
class _calendar extends State<calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: const Text('Calendar'),
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
