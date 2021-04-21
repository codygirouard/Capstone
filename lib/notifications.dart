import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'backend/med_controller.dart';
import 'globals.dart' as globals;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(Notifications());
}

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  List<String> notifs = [];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Chicago'));
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings);
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
      int time = meds[i]['time'];
      int hour = time ~/ 100;
      int minute = time % 100;
      tz.TZDateTime now = tz.TZDateTime.now(tz.local);
      tz.TZDateTime scheduledDate =
          tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
      if (scheduledDate.isAfter(now.subtract(const Duration(minutes: 10)))) {
        medsList.add(meds[i]['name'] +
            " " +
            getTime(meds[i]['time'].toString()).toString());
        scheduleNotif(meds[i]['name'], meds[i]['time'], i);
      }
    }
    setState(() {
      notifs = medsList;
    });
  }

  void scheduleNotif(String name, int time, int id) async {
    int hour = time ~/ 100;
    int minute = time % 100;
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      return;
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        name,
        'Take now!',
        scheduledDate,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                '0', 'UltraMedz', 'Medicine Notification')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
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

  // convert string time to number time (e.g.: 12:00 PM = 1200)
  int strTimeToNum(String time) {
    int period = time.split(" ")[1] == "AM" ? 0 : 1200;
    if (time.split(":")[0] == "12") {
      period = period == 0 ? 1200 : 0;
    }
    period += int.parse(time.replaceAll(RegExp(r':'), '').split(" ")[0]);
    return period;
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
      'Took it!',
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
      if (info[0] == 'Took it!') {
        notifs.removeWhere((notif) => info[1] == notif);
      } else {
        String name = info[1].split(" ")[0];
        int time =
            strTimeToNum(info[1].split(" ")[1] + ' ' + info[1].split(" ")[2]);
        time = (time + 100) % 2400;
        scheduleNotif(name, time, 10);
        int index = notifs.indexWhere((notif) => info[1] == notif);
        notifs[index] = name + ' ' + getTime(time.toString());
      }
    });
  }
}
