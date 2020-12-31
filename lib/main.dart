import 'package:flutter/material.dart';
import 'package:days_until_christmas/pages/christmas.dart';
import 'package:days_until_christmas/pages/options.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/countdown': (context) => Countdown(),
        '/': (context) => options(),
      },
    ));
