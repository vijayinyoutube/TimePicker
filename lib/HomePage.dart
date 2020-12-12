import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedTime = "Pick Time";
  TimeOfDay time;
  @override
  void initState() {
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            _pickTime();
          },
          child: Text(selectedTime),
        ),
      ),
    );
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
        selectedTime =
            "Selected Time : ${t.hour.toString()}:${t.minute.toString()}";
      });
  }
}
