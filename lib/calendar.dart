import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'backend/med_controller.dart';
import 'bottom_bar.dart';
import 'globals.dart' as globals;

// constants
const double kImagesSize = 40.0;
const Color kPrimaryColor = Colors.blue;
const Color kSecondaryColor = Colors.blueGrey;

void main() {
  initializeDateFormatting().then((_) => runApp(Calendar()));
}

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarUI createState() => _CalendarUI();
}

class _CalendarUI extends State<Calendar> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    loadMedicine();
    _events = Map<DateTime, List>();
    DateTime now = DateTime.now();

    _selectedEvents = _events[DateTime.utc(now.year, now.month, now.day)] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  void loadMedicine() async {
    var meds = await getUserMedicine(globals.id);
    List<List<String>> medsList = [];
    var i = 0;
    for (i = 0; i < meds.length; i++) {
      List<String> med = [];
      med.add(meds[i]['name']);
      med.add(meds[i]['repeat'].toString());
      med.add(meds[i]['time'].toString());
      medsList.add(med);
    }
    setState(() {
      _events = getMedicines(medsList);
      DateTime now = DateTime.now();
      _selectedEvents =
          _events[DateTime.utc(now.year, now.month, now.day)] ?? [];
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        leading: new Container(),
        title: Text('Calendar'),
        centerTitle: true,
        actions: [
          Icon(Icons.calendar_today),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'en_US',
      calendarController: _calendarController,
      events: _events,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
        weekendStyle: TextStyle().copyWith(color: Colors.black),
        markersColor: kPrimaryColor,
        outsideWeekendStyle: TextStyle().copyWith(color: Colors.grey[500]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.black),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: kPrimaryColor,
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style:
                    TextStyle().copyWith(color: Colors.white, fontSize: 20.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: kPrimaryColor.withOpacity(0.4),
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 20.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? kSecondaryColor
            : _calendarController.isToday(date)
                ? kSecondaryColor.withOpacity(0.65)
                : kSecondaryColor.withOpacity(0.80),
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Image.asset(
                    'images/Pill.jpg',
                    height: kImagesSize,
                    width: kImagesSize,
                  ),
                  title: Text(event.toString()),
                  horizontalTitleGap: 30.0,
                ),
              ))
          .toList(),
    );
  }

  // convert medicine data into format that can be inserted into the calendar
  Map<DateTime, List<String>> getMedicines(List<List<String>> meds) {
    Map<DateTime, List<String>> events = {};
    for (final v in meds) {
      String name = v[0];
      int repeat = int.parse(v[1]);
      String time = v[2];
      time = getTime(time);

      if (repeat != null) {
        // is days a number?
        DateTime now = DateTime.now();
        DateTime today = DateTime.utc(now.year, now.month, now.day);
        events = addEvent(events, today, name + " " + time);
        for (int i = 1; i < 60; i++) {
          var date = today.add(Duration(hours: i * repeat));
          events = addEvent(events, date, name + " " + time);
          date = today.subtract(Duration(hours: i * repeat));
          events = addEvent(events, date, name + " " + time);
        }
      }
    }

    // sort all entries in a day by time and then by name
    events.forEach((k, v) => v.sort((a, b) => compareTimes(a, b)));
    return events;
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

  // add an event to a specific day in events map
  Map<DateTime, List<String>> addEvent(
      Map<DateTime, List<String>> events, DateTime date, String event) {
    if (events.containsKey(date)) {
      events[date].add(event);
    } else {
      events[date] = [event];
    }
    return events;
  }

  // add an event to the events map based on weekdays
  Map<DateTime, List<String>> addEventByWeekday(
      Map<DateTime, List<String>> events, String days, String event) {
    if (days.length < 7) {
      days = days.substring(0, 2);
    }
    return events;
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

  // compare two events to sort (e.g.: MedicineA 9:00 AM < MedicineB 5:00 PM)
  int compareTimes(String time1, String time2) {
    var time1Arr = time1.split(" ");
    var time2Arr = time2.split(" ");
    String name1 = time1Arr[0];
    String name2 = time2Arr[0];
    int timeNum1 = strTimeToNum(time1Arr[1] + " " + time1Arr[2]);
    int timeNum2 = strTimeToNum(time2Arr[1] + " " + time2Arr[2]);

    int compare = timeNum1.compareTo(timeNum2);
    if (compare == 0) {
      compare = name1.compareTo(name2);
    }
    return compare;
  }
}
