import 'package:bmi_calculator/constraints.dart';
import 'package:flutter/material.dart';

class BottomColumn extends StatelessWidget {
  final text;
  final number;
  final plusOnPress;
  final minusOnPress;
  BottomColumn({this.text, this.number, this.plusOnPress, this.minusOnPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kInActiveColumnColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: kMainTextStyle,
          ),
          Text(
            number,
            style: kMainNumberStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF4C4F5E),
                  onPressed: plusOnPress,
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF4C4F5E),
                  onPressed: minusOnPress,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Icon(
                      Icons.minimize,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
