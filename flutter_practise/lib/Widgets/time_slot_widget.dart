import 'package:flutter/material.dart';

class TimeSlotsCard extends StatefulWidget {
  const TimeSlotsCard({super.key});

  @override
  State<TimeSlotsCard> createState() => _TimeSlotsCardState();
}

class _TimeSlotsCardState extends State<TimeSlotsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
        child: Text(
          "10:00 AM",
          style: dateStyle(),
        ),
      ),
    );
  }

  TextStyle dateStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 12);
  }
}
