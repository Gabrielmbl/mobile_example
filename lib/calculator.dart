import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String output = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> value;

  Future<void> saveOutput(String output) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('output', output);
  }

  void sum() {
    int n1 = int.parse(num1Controller.text);
    int n2 = int.parse(num2Controller.text);
    int sum = (n1) + (n2);
    output = ('The sum is $sum');
    setState(() {});
    saveOutput(output);
    print(output);
  }

  void subtraction() {
    int n1 = int.parse(num1Controller.text);
    int n2 = int.parse(num2Controller.text);
    int subtraction = (n1) - (n2);
    output = ('The subtraction is $subtraction');
    setState(() {});
    saveOutput(output);
    print(output);
  }

  void division() {
    int n1 = int.parse(num1Controller.text);
    int n2 = int.parse(num2Controller.text);
    double division = (n1) / (n2);
    output = ('The division is $division');
    print(output);
    saveOutput(output);
    setState(() {});
  }

  void multiplication() {
    int n1 = int.parse(num1Controller.text);
    int n2 = int.parse(num2Controller.text);
    int multiplication = (n1) * (n2);
    output = ('The multiplication is $multiplication');
    print(output);
    saveOutput(output);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Homepage"),
          backgroundColor: Color.fromARGB(255, 66, 217, 255),
          leading: Icon(Icons.home)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Spacer between title and text fields
            Column(
              children: [
                Text("Enter First Number:"),
                TextField(controller: num1Controller),
                Text("Enter Second Number:"),
                TextField(controller: num2Controller),
              ],
            ),
            SizedBox(height: 20), // Spacer between text fields and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: sum, child: Icon(Icons.add)),
                    ElevatedButton(
                        onPressed: division, child: Icon(Icons.arrow_forward)),
                  ],
                ),
                SizedBox(width: 20), // Spacer between button columns
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: subtraction, child: Icon(Icons.remove)),
                    ElevatedButton(
                        onPressed: multiplication, child: Icon(Icons.close)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20), // Spacer between buttons and output
            Text('$output'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Screen2(name: "Houghton", year: 2017)),
                );
              },
              child: Text("Go to Screen 2"),
            ),

            Text("Something"),
          ],
        ),
      ),
    );
  }
}

