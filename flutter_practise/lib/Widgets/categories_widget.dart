import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.iconBtn,
      required this.textData,
      required this.boxColor});
  final IconData iconBtn;
  final String textData;
  final Color boxColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: boxColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)),
          child: Icon(
            iconBtn,
            size: 28,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          textData,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
