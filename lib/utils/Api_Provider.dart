import 'dart:convert';

import 'package:http/http.dart' as http;

class BibleVerse {
  final String text;
  final String reference;

  BibleVerse({required this.text, required this.reference});
}


Future<BibleVerse> getBibleVerse(String verse) async {
  var client = http.Client();

  try {
    String url = 'https://bible-api.com/$verse';
    print(url);
    var response = await client.get(
      Uri.parse(url),
    );

    print(response.body);

    var decodedResponse = jsonDecode((response.body)) as Map;
    if (decodedResponse.containsKey('error') &&
        decodedResponse['error'] == 'not found') {
      return BibleVerse(text: 'not found', reference: verse);
    }

    String text = decodedResponse['text'] as String;
    String reference = decodedResponse['reference'] as String;
    return BibleVerse(text: text, reference: reference);
  } finally {
    client.close();
  }
}


// Future<BibleVerse> getBibleVerse(String verse) async {
//   var client = http.Client();

//   try {
//     String url = 'https://bible-api.com/$verse';
//     print(url);
//     var response = await client.get(
//       Uri.parse(url),
//     );

//     print(response.body);

//     var decodedResponse = jsonDecode((response.body)) as Map;
//     String text = decodedResponse['text'] as String;
//     String reference = decodedResponse['reference'] as String;
//     return BibleVerse(text: text, reference: reference);
//   } finally {
//     client.close();
//   }
// }

// Future<String> getBibleVerse(String verse) async {
//   var client = http.Client();

//   try {
//     String url = 'https://bible-api.com/$verse';
//     print(url);
//     var response = await client.get(
//       Uri.parse(url),
//     );

//     print(response.body);

//     var decodedResponse = jsonDecode((response.body)) as Map;
//     String res = decodedResponse['text'] as String;
//     return res;
//   }
//   finally {
//     client.close();
//   }
  
// }