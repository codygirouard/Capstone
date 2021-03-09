import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'bottom_bar.dart';
import 'package:table_calendar/table_calendar.dart';

const double kImagesSize = 40.0;
const Color kPrimaryColor = Colors.blue;
const Color kSecondaryColor = Colors.blueGrey;

void main() {
  initializeDateFormatting().then((_) => runApp(Calendar()));
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: CalendarUI(title: 'Calendar'),
    );
  }
}

class CalendarUI extends StatefulWidget {
  CalendarUI({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarUI createState() => _CalendarUI();
}

class _CalendarUI extends State<CalendarUI> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime.utc(2021, 3, 2): [
        'Vicodin 10:00 AM',
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM',
        'Levothyroxine 9:00 PM',
        'Azithromycin 9:00 PM'
      ],
      DateTime.utc(2021, 3, 9): [
        'Vicodin 10:00 AM',
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 3, 16): [
        'Vicodin 10:00 AM',
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 3, 23): [
        'Vicodin 10:00 AM',
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 3, 30): [
        'Vicodin 10:00 AM',
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 3, 4): ['Lisinopril 11:00 AM'],
      DateTime.utc(2021, 3, 11): ['Lisinopril 11:00 AM'],
      DateTime.utc(2021, 3, 18): ['Lisinopril 11:00 AM'],
      DateTime.utc(2021, 3, 25): ['Lisinopril 11:00 AM'],
      DateTime.utc(2021, 3, 6): ['Simvastatin 11:00 AM', 'Lisinopril 11:00 AM'],
      DateTime.utc(2021, 3, 13): [
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 3, 20): [
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 3, 27): [
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 2, 23): [
        'Vicodin 10:00 AM',
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 2, 25): ['Lisinopril 11:00 AM'],
      DateTime.utc(2021, 2, 27): [
        'Simvastatin 11:00 AM',
        'Lisinopril 11:00 AM'
      ],
      DateTime.utc(2021, 4, 1): ['Lisinopril 11:00 AM'],
      DateTime.utc(2021, 4, 3): ['Simvastatin 11:00 AM', 'Lisinopril 11:00 AM'],
    };

    _selectedEvents = _events[DateTime.utc(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)] ??
        [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
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
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Icon(Icons.calendar_today),
          SizedBox(
            width: 10.0,
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
                  trailing: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: kImagesSize,
                  ),
                  title: Text(event.toString()),
                  horizontalTitleGap: 30.0,
                ),
              ))
          .toList(),
    );
  }
}
