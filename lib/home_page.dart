import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? dateTime = DateTime.now();

  void showDate(context) {
    showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2050),
      context: context,
    ).then((value) {
      setState(() {
        dateTime = value;
      });
    });
  }

  TimeOfDay time = TimeOfDay.now();

  void showTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: const Text('Time Picker'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Today is ${dateTime} and time is ${time.format(context)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                FilledButton(
                  onPressed: () {
                    showTime();
                  },
                  child: const Text('Time picker'),
                ),
                FilledButton(
                  onPressed: () {
                    showDate(context);
                  },
                  child: const Text('Date picker'),
                ),
              ],
            ),
          ),
        ));
  }
}
