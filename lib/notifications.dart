import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'backend/med_controller.dart';
import 'globals.dart' as globals;

void main() {
  runApp(Notifications());
}

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  List<String> notifs = [];

  @override
  void initState() {
    super.initState();
    loadMedicine();
  }

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

  void loadMedicine() async {
    var meds = await getUserMedicine(globals.id);
    List<String> medsList = [];
    var i = 0;
    for (i = 0; i < meds.length; i++) {
      medsList.add(meds[i]['name'] +
          " " +
          getTime(meds[i]['time'].toString()).toString());
    }
    setState(() {
      notifs = medsList;
    });
  }

  // convert number time into a string time (e.g.: 1500 = 3:00 PM)
  String getTime(String time) {
    int timeNum = int.parse(time);
    time = (timeNum >= 1200) ? " PM" : " AM";
    String minutes = (timeNum % 100) < 10
        ? "0" + (timeNum % 100).toString()
        : (timeNum % 100).toString();
    timeNum = timeNum > 1200 ? timeNum - 1200 : timeNum;
    time = (timeNum ~/ 100).toString() + ":" + minutes + time;

    return time;
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
      'Took at...',
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
      title: Text(notification.split(" ")[0]),
      horizontalTitleGap: 20.0,
      subtitle: Text('Take at ' +
          notification.split(" ")[1] +
          notification.split(" ")[2] +
          '!'),
    );
  }

  void _subMenu(String choice) {
    setState(() {
      List info = choice.split("+");
      if (info[0] == 'Took at...') {
        notifs.removeWhere((notif) => info[1] == notif);
      } else {
        notifs.removeWhere((notif) => info[1] == notif);
      }
    });
  }
}
