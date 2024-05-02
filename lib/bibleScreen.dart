import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/Api_Provider.dart';

// class bibleScreen extends StatefulWidget {
//   const bibleScreen({Key? key}) : super(key: key);

//   @override
//   State<bibleScreen> createState() => _bibleScreenState();
// }

// class _bibleScreenState extends State<bibleScreen> {
//   late TextEditingController controllerVerse = TextEditingController();
//   String verse = "";
//   String reference= "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bible App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // Add padding around the text field
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TextField(
//               controller: controllerVerse,
//               decoration: InputDecoration(
//                 hintText: 'Enter verse reference',
//               ),
//             ),
//             ElevatedButton(onPressed: getVerse, child: Text('Fetch')),
//             Text('Bible verse for $reference: $verse'),
//           ],
//         ),
//       ),
//     );
//   }


// void getVerse() {
//     String v = controllerVerse.text;

//     setState(() {
//       getBibleVerse(v).then((value) {
//         setState(() {
//           verse = value.text;
//           reference = value.reference;
//         });
//       });
//     });
//   }
// }

class bibleScreen extends StatefulWidget {
  const bibleScreen({Key? key}) : super(key: key);

  @override
  State<bibleScreen> createState() => _bibleScreenState();
}

class _bibleScreenState extends State<bibleScreen> {
  late TextEditingController controllerVerse = TextEditingController();
  String verse = "";
  String reference = "";

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
