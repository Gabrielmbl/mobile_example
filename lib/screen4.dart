import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Demo"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text("Option 1"),
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text("Option 2"),
          ),
          ListTile(
            leading: Icon(Icons.accessibility_outlined),
            title: Text("Option 3"),
          ),
          ListTile(
            leading: Icon(Icons.numbers),
            title: Text("Option 4"),
          ),
          ListTile(
            leading: Icon(Icons.add_alert),
            title: Text("Option 5"),
          ),
        ],
      ),
    );
  }
}
