import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: Countdown(),
  ));
}

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  var startingHour = 0;
  String sDuration = "loading";
  var christmas;
  Timer _timer;
  Duration difference;

  @override
  void initState() {
    super.initState();

    setTime();
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        var now = new DateTime.now();
        difference = christmas.difference(now);
        if (difference.isNegative) {
          sDuration = "It's christmas!";
        } else {
          sDuration =
              "${difference.inDays}:${difference.inHours.remainder(24)}:${difference.inMinutes.remainder(60)}:${(difference.inSeconds.remainder(60))}";
        }
      });
    });
  }

  void setTime() {
    var now = new DateTime.now();
    int year = now.year;
    if (DateTime.utc(year, 12, 26).difference(now).isNegative) {
      // check if the day is after christmas (25 of december)
      year += 1;
    }
    christmas = DateTime.utc(year, 12, 25, startingHour);
    difference = christmas.difference(now);
    sDuration =
        "${difference.inDays}:${difference.inHours.remainder(24)}:${difference.inMinutes.remainder(60)}:${(difference.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    print(_timer);
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var now = new DateTime.now();
    // int year = now.year;
    // var christmas = DateTime.utc(year, 12, 25, startingHour);
    // Duration difference = christmas.difference(now);
    // String sDuration =
    //     "${difference.inDays}:${difference.inHours.remainder(24)}:${difference.inMinutes.remainder(60)}:${(difference.inSeconds.remainder(60))}";

    // print(sDuration);
    Map data = {};
    data = ModalRoute.of(context).settings.arguments;
    // print(startingHour['startingHour']);
    print(data);

    startingHour = data['startingHour'];
    print(startingHour);

    setTime();

    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown until christmas'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/christmas.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                sDuration,
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            Container(
              child: Text(
                "Days:Hours:Minutes:Seconds",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
