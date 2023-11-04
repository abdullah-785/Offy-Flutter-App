import 'package:flutter/material.dart';

class OccassionTypeCard extends StatefulWidget {
  const OccassionTypeCard({super.key});

  @override
  State<OccassionTypeCard> createState() => _OccassionTypeCardState();
}

class _OccassionTypeCardState extends State<OccassionTypeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Brithday",
            style: dateStyle(),
          ),
        ),
      ),
    );
  }

  TextStyle dateStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 12);
  }
}
