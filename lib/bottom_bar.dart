import 'package:flutter/material.dart';

import 'calendar.dart';
import 'notifications.dart';
import 'profile.dart';
import 'user_home.dart';

void main() => runApp(BottomBar());

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //child: BottomAppBar(
      color: Colors.blue,
      child: Row(
        children: [
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Calendar(),
                    ));
              }),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications(),
                    ));
              }),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeContainerProfile(),
                    ));
              }),
          Spacer(),
        ],
      ),
      //),
    );
  }
}
