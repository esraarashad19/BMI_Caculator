import 'package:bmi_calculator/screens/bottom_column.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/top_column.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constraints.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 23;
  int weight = 60;
  int height = 140;
  Color maleColor = kInActiveColumnColor;
  Color femaleColor = kInActiveColumnColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF11163A),
      appBar: AppBar(
        backgroundColor: Color(0xFF11163A),
        leading: IconButton(
          icon: Icon(
            Icons.subject,
            color: Colors.white,
          ),
        ),
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        elevation: 6,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: TopColoumn(
                        colour: maleColor,
                        text: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                      onTap: () {
                        setState(() {
                          maleColor = maleColor == kInActiveColumnColor
                              ? kActiveColumnColor
                              : kInActiveColumnColor;
                          femaleColor = kInActiveColumnColor;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleColor = femaleColor == kInActiveColumnColor
                              ? kActiveColumnColor
                              : kInActiveColumnColor;
                          maleColor = kInActiveColumnColor;
                        });
                      },
                      child: TopColoumn(
                        text: 'FEMALE',
                        colour: femaleColor,
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF272A4D),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kMainTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kMainNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kMainTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      inactiveColor: Colors.grey[500],
                      activeColor: Color(0xFFFF0067),
                      min: 120,
                      max: 230,
                      value: height.toDouble(),
                      onChanged: (vlaue) {
                        setState(() {
                          height = vlaue.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: BottomColumn(
                      text: 'WEIGHT',
                      number: weight.toString(),
                      minusOnPress: () {
                        setState(() {
                          weight--;
                        });
                      },
                      plusOnPress: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BottomColumn(
                      text: 'AGE',
                      number: age.toString(),
                      minusOnPress: () {
                        setState(() {
                          age--;
                        });
                      },
                      plusOnPress: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            height: 60,
            color: Color(0xFFFF0067),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ResultScreen(
                      age: this.age, weight: this.weight, height: this.height),
                ),
              );
            },
            child: Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
