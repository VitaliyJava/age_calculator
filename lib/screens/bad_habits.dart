import 'dart:async';
import 'package:age_calculator_app/main.dart';
import 'package:age_calculator_app/screens/good_habits.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator_app/custom_icons.dart';

class BadHabits extends StatefulWidget {
  final double initialYearsLeft;

  const BadHabits({Key key, this.initialYearsLeft}) : super(key: key);
  
  @override
  _BadHabitsState createState() => _BadHabitsState();
}

class _BadHabitsState extends State<BadHabits> {
  var multiplier = 0;
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            'Bad Habits',
            style: TextStyle(
              color: Colors.white,
            ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             IconButton(
               color: Colors.white,
               tooltip:'Smoking',
                 icon: Icon(CustomIcons.cigar),
                 onPressed: () {
                   calculateYearsLeft(yearsLeft, 0.23);
                 }),
             IconButton(
                 color: Colors.white,
                 tooltip:'Drinking',
                 icon: Icon(CustomIcons.wine),
                 onPressed: () {
                   calculateYearsLeft(yearsLeft, 0.29);
                 }),
             IconButton(
                 color: Colors.white,
                 tooltip:'Drinking too much coffee',
                 icon: Icon(CustomIcons.coffee_breaks),
                 onPressed: () {
                   calculateYearsLeft(yearsLeft, 0.29);
                 }),
             IconButton(
               color: Colors.white,
                 icon :Icon(
                     CustomIcons.burger_1),
                 onPressed: () {
                   calculateYearsLeft(yearsLeft, 0.15);
                 },
             ),
             IconButton(
               color: Colors.white,
               icon :Icon(CustomIcons.no_sleeping),
               onPressed: () {
                 calculateYearsLeft(yearsLeft,0.15);
               },
             ),
           ],
         ),
           Text(
             'Years left: \n $yearsLeftNow',
             style: TextStyle(
               color: Colors.white,
             ),
           ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GoodHabits(
                initialYearsLeft: yearsLeft,
              ),));
            },
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.black,
          ),
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


