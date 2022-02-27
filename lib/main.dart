import 'package:flutter/material.dart';
import 'package:quizapp2/screens/home_screen.dart';
import 'package:quizapp2/screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.red))),
      home: HomeScreen(),
      routes: {Screen2.routename: (context) => Screen2()},
    );
  }
}
