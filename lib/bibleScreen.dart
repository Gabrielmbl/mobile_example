import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_application_1/utils/Api_Provider.dart';


class bibleScreen extends StatefulWidget {
  const bibleScreen({Key? key}) : super(key: key);

  @override
  State<bibleScreen> createState() => _bibleScreenState();
}

class _bibleScreenState extends State<bibleScreen> {
  late TextEditingController controllerVerse = TextEditingController();
  String verse = "";
  String reference = "";
  late String currentTime;


  @override
  void initState() {
    super.initState();
    currentTime = Jiffy.now().yMMMMEEEEdjm;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Bible App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Initialized: $currentTime'),
              TextField(
                controller: controllerVerse,
                decoration: InputDecoration(
                  hintText: 'Enter verse reference',
                ),
              ),
              ElevatedButton(onPressed: getVerse, child: Text('Fetch')),
              Text('Bible verse for $reference:\n$verse'),
            ],
          ),
        ),
      ),
    );
  }

  void getVerse() {
    String v = controllerVerse.text;

    setState(() {
      getBibleVerse(v).then((value) {
        setState(() {
          verse = value.text;
          reference = value.reference;
        });
      });
    });
  }
}
