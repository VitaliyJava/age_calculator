import 'dart:async';
import 'package:age_calculator_app/main.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator_app/custom_icons.dart';

class GoodHabits extends StatefulWidget {
  final double initialYearsLeft;

  const GoodHabits({Key key, this.initialYearsLeft}) : super(key: key);
  @override
  _GoodHabitsState createState() => _GoodHabitsState();
}

class _GoodHabitsState extends State<GoodHabits> {

  double yearsLeft;
  Timer timer;
  Duration timeLeft = Duration();
  double get yearsLeftNow{
    return  yearsLeft - timeLeft.inMilliseconds / 1000.0 / secondsInYear;
  }

  @override
  void initState() {
    yearsLeft = widget.initialYearsLeft;
    timer = new Timer.periodic(new Duration(milliseconds: 1), updateTime);
    super.initState();
  }

  void updateTime(Timer timer) {
    setState(() {
      timeLeft = timeLeft + Duration(milliseconds: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Good Habits'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              tooltip:'Sports',
              icon: Icon(Icons.fitness_center),
              onPressed: () {
                calculateYearsLeft(yearsLeft, 1.23);
              }),
          IconButton(
              tooltip:'Sleep',
              icon: Icon(Icons.do_not_disturb),
              onPressed: () {
                calculateYearsLeft(yearsLeft, 0.29);
              }),
          IconButton(
            icon :Icon(Icons.restaurant),
            onPressed: () {
              calculateYearsLeft(yearsLeft, 0.15);
            },
          ),
          IconButton(
            icon :Icon(Icons.work),
            onPressed: () {
              calculateYearsLeft(yearsLeft,0.15);
            },
          ),
        ],
      ),
      Text('Years left: \n $yearsLeftNow'),
    ],
    ),
    );
  }

  calculateYearsLeft(double yearsLeft, double multiplier) {
    setState(() {
      this.yearsLeft = yearsLeft * (1 - multiplier);
      print(this.yearsLeft);
    });
  }
}
