import 'package:flutter/material.dart';
import 'container_home_profile.dart';
import 'container_home_user.dart';

import 'calendar.dart';
import 'notifications.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserHome();
}

class _UserHome extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> widgetOptions = [
    HomeContainerUser(),
    HomeContainerProfile(), //ANOTHER WIDGETS
    CalendarUI(),
    Notifications(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.redAccent[300],
        elevation: 10,
        iconSize: 25,
        selectedFontSize: 18,
        onTap: _onItemTapped,
      ),
    );
  }
}
