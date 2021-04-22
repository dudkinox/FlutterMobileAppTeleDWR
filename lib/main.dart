import 'package:flutter/material.dart';

import 'app/signup/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'mytitle',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: SignInPage());
  }
}
