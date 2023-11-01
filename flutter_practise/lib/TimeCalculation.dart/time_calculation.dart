import 'package:flutter/material.dart';

class WorkingHoursCalculator extends StatefulWidget {
  @override
  _WorkingHoursCalculatorState createState() => _WorkingHoursCalculatorState();
}

class _WorkingHoursCalculatorState extends State<WorkingHoursCalculator> {
  TextEditingController timeInController = TextEditingController();
  TextEditingController timeOutController = TextEditingController();
  String workingHours = "";

  void calculateWorkingHours() {
    DateTime timeIn = DateTime.parse(timeInController.text);
    DateTime timeOut = DateTime.parse(timeOutController.text);

    Duration workDuration = timeOut.difference(timeIn);
    int hours = workDuration.inHours;
    int minutes = workDuration.inMinutes.remainder(60);

    setState(() {
      workingHours = "$hours hours $minutes minutes";
    });
  }

  // DateTime timeIn = DateTime.parse(checkIn as String);
  // DateTime timeOut = DateTime.parse(checkout as String);

  // Duration workDuration = timeOut.difference(timeIn);
  // int hours = workDuration.inHours;
  // int minutes = workDuration.inMinutes.remainder(60);

  // String workingHours = "$hours hours $minutes minutes";
  // return workingHours;

  // final duration1 = checkout?.difference(checkIn!);
  // // final duration1 = duration?.difference(breakTime);
  // final hours = duration1?.inHours;
  // final minutes = duration1?.inMinutes.remainder(60);

  // return '$hours hours and $minutes minutes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PMS Working Hours Counting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: timeInController,
              decoration:
                  InputDecoration(labelText: 'Time In (yyyy-MM-dd HH:mm:ss)'),
            ),
            TextField(
              controller: timeOutController,
              decoration:
                  InputDecoration(labelText: 'Time Out (yyyy-MM-dd HH:mm:ss)'),
            ),
            ElevatedButton(
              onPressed: calculateWorkingHours,
              child: Text('Calculate Working Hours'),
            ),
            Text(
              'Working Hours: $workingHours',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
