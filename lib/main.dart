import 'package:age_calculator_app/user_preferences.dart';
import 'package:age_calculator_app/screens/bad_habits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';

DateTime dateOfBirth = DateTime.now();
int numberOfYears = 70;
int monthsLive = 0;
int weeksLive = 0;
int daysLive = 0;
int hoursLive = 0;
int minutesLive = 0;
int secondsLive = 0;

 const double secondsInYear = 31556926.08;
 const double secondsInMonth = 2628002.88;
 const int secondsInWeek = 604800;
 const int secondsInDay = 86400;
 const int secondsInHour = 3600;
 const int secondsInMinute = 60;
 const int secondsInSecond = 1;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Age Calculator',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  final TextEditingController numberOfYearsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Enter your date of birth',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: CupertinoDatePicker(
                initialDateTime: dateOfBirth,
                mode: CupertinoDatePickerMode.date,
                backgroundColor: Colors.white,
                onDateTimeChanged: (newValue) {
                  dateOfBirth = newValue;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top :15.0),
            child: Text('Enter the number of years of life',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              controller: numberOfYearsController,
              onChanged: (String value) {
                numberOfYears = int.parse(value);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:  15.0),
            child: RaisedButton(
              color: Colors.black,
              child: Text('OK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AgeStopwatch()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AgeStopwatch extends StatefulWidget {
  @override
  _AgeStopwatchState createState() => _AgeStopwatchState();
}

class _AgeStopwatchState extends State<AgeStopwatch> {
  Timer timer;
  double yearsLive;
  double yearsLeft;


  @override
  void initState() {
    timer = new Timer.periodic(new Duration(milliseconds: 1), updateTime);
    super.initState();
  }

  void updateTime(Timer timer) {
    DateTime dateOfDeath = dateOfBirth.add(Duration(days: 365*numberOfYears));
    DateTime now = DateTime.now();
    var durationLeft = dateOfDeath.difference(now);
    var durationLive = now.difference(dateOfBirth);
    if(mounted) {
      setState(() {
        yearsLive = durationLive.inSeconds / secondsInYear;
        yearsLeft = durationLeft.inSeconds / secondsInYear;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'You are now',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(yearsLeft.toString() + "\n" + yearsLive.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BadHabits(
                  initialYearsLeft: yearsLeft,
                )));
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}
bool startIsPressed = true;
String stopTimeToDisplay = '00.00';
var  swatch = Stopwatch();
final dur = const Duration(seconds: 1);

@override
Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 20.0, left: 20.0),
    child: Text(numberOfYears.toString()),
  );
}








