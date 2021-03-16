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
  List<String> notifs = [
    'Medicine 1',
    'Medicine 2',
    'Medicine 3',
    'Medicine 4',
    'Medicine 5',
    'Medicine 6',
    'Medicine 7',
    'Medicine 8',
    'Medicine 9',
    'Medicine 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text('Notifications'),
          centerTitle: true,
          toolbarHeight: 40.0,
          actions: [
            Icon(Icons.notifications),
            SizedBox(
              width: 20.0,
            ),
          ]),
      body: Center(
        child: _buildNotifications(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildNotifications() {
    return ListView(
      children: notifs
          .map(
            (notif) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: EdgeInsets.all(8.0),
              child: _notificationCard(notif),
            ),
          )
          .toList(),
    );
  }

  Widget _notificationCard(String notification) {
    List<String> _options = [
      'Dismiss',
      'Snooze',
    ];

    return ListTile(
      leading: Image.asset(
        'images/Main_logo.jpg',
        height: 40.0,
        width: 40.0,
      ),
      trailing: PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40.0,
        ),
        onSelected: _subMenu,
        itemBuilder: (BuildContext context) {
          return _options.map((String choice) {
            return PopupMenuItem(
              child: Text(choice),
              value: choice + '+' + notification,
            );
          }).toList();
        },
      ),
      title: Text(notification.toString()),
      horizontalTitleGap: 20.0,
      subtitle: Text('Take right now!'),
    );
  }

  void _subMenu(String choice) {
    setState(() {
      List info = choice.split("+");
      if (info[0] == 'Dismiss') {
        notifs.removeWhere((notif) => info[1] == notif);
      } else {
        notifs.removeWhere((notif) => info[1] == notif);
      }
    });
  }
}
