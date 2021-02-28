import 'package:flutter/material.dart';
import 'package:flutter_app1/SigninPage.dart';
import 'home.dart';
import 'buttom_bar.dart';

void main() {
  runApp(notifications());
}

// ignore: camel_case_types
class notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _notifications();
}

// ignore: camel_case_types
class _notifications extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: const Text('Notifications'),
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
