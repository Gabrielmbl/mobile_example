import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculator.dart';
import 'package:flutter_application_1/screen2.dart';
import 'package:flutter_application_1/screen3.dart';
import 'package:flutter_application_1/screen4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSCI 480 App',
      home: Screen3(),
    );
  }
}

