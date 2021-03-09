import 'package:flutter/material.dart';
import 'bottom_bar.dart';

void main() {
  runApp(Notifications());
}

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
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
      bottomNavigationBar: BottomBar(),
    );
  }
}
