import 'package:flutter/material.dart';

class options extends StatefulWidget {
  @override
  _optionsState createState() => _optionsState();
}

class _optionsState extends State<options> {
  TextEditingController hourController = new TextEditingController();

  var startingHour = 0;

  String sDuration = "loading";

  var christmas;

  void initState() {
    hourController.addListener(setHour);
    print('set something');
  }

  void setHour() {
    setState(() {
      print(hourController.text);
      var number = int.tryParse(hourController.text) ?? 0;
      if (number >= 0 && number <= 24) {
        startingHour = number;
        var now = new DateTime.now();
        int year = now.year;
        christmas = DateTime.utc(year, 12, 25, startingHour);
        print(startingHour);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/tree.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: hourController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter starting hour of christmas 0-24',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Christmas starts at ${startingHour} o'clock",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Start'),
        onPressed: () {
          Navigator.pushNamed(context, '/countdown', arguments: {
            'startingHour': startingHour,
          });
        },
      ),
    );
  }
}
