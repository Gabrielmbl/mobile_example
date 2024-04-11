import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key, required String this.name, required int this.year});

  final String name;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Screen 2"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Text(
            "This is screen 2 - $name, year: $year",
            style: TextStyle(fontSize: 25, letterSpacing: 3),
          ),
        ));
  }
}
