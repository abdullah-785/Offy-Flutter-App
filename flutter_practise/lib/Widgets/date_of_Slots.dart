import 'package:flutter/material.dart';

class DateOfSlotsCard extends StatefulWidget {
  const DateOfSlotsCard({
    super.key,
  });

  @override
  State<DateOfSlotsCard> createState() => _DateOfSlotsCardState();
}

class _DateOfSlotsCardState extends State<DateOfSlotsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 60,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sep",
              style: dateStyle(),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "14",
              style: dateStyle(),
            )
          ],
        ),
      ),
    );
  }

  TextStyle dateStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16);
  }
}
