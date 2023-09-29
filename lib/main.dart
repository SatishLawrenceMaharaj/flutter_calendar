import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(
      primaryColor: Colors.red, // Set the background color to green
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white, // Set text color to white
          fontSize: 15.0, // Set text size
          fontWeight: FontWeight.bold, // Set text weight to bold
        ),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Calendar",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Set text weight to bold
              letterSpacing: 1.2, // Set letter spacing
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(
              255, 0, 81, 148), // Set the app bar color to green
        ),
        body: Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Selected Day: " + today.toString().split(" ")[0]),
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 16),
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: _onDaySelected,
          ),
        ),
      ],
    );
  }
}
