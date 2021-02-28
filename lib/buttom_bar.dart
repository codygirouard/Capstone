import 'package:flutter/material.dart';
import 'package:flutter_app1/SigninPage.dart';
import 'home.dart';
import 'calendar.dart';
import 'UserHome.dart';
import 'notifications.dart';
import 'profile.dart';

void main() => runApp(buttom_bar());

class buttom_bar extends StatelessWidget {
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
                          builder: (context) => UserHome(),
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
                          builder: (context) => calendar(),
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
                          builder: (context) => notifications(),
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
                          builder: (context) => profile(),
                        ));
                  }),
              Spacer(),
            ],
          ),
        //),
    );
  }
}
