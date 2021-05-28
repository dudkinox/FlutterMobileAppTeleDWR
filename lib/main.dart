import 'package:dwr0001/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'mytitle',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Welcome());
  }
}
