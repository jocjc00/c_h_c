import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Application Layer/profileInfo/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //root of the application
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Center(child: Text('Covid HealthCare')),
            ),
            body: const LoginPage()));
  }
}
