import 'package:bmi_calculator/constraints.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopColoumn extends StatelessWidget {
  final text;
  final icon;
  //final isMale;
  final colour;
  TopColoumn({this.text, this.icon, this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 80,
          ),
          Text(
            text,
            style: kMainTextStyle,
          ),
        ],
      ),
    );
  }
}
