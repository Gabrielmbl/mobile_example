import 'package:flutter/material.dart';
import 'package:flutter_application_1/bibleScreen.dart';
import 'package:flutter_application_1/calculator.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/ml_app.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/screen2.dart';
import 'package:flutter_application_1/screen3.dart';
import 'package:flutter_application_1/screen4.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CSCI 480 App',
//       home: bibleScreen(),
//     );
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSCI 480 App',
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSCI 480 App'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => bibleScreen()),
              );
            },
            child: Text('Go to Bible Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Go to Login Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text('Go to Register Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorPage()),
              );
            },
            child: Text('Go to Calculator Page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ML_App()),
              );
            },
            child: Text('Go to ML App'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen2(name: 'Something', year: 2024)),
              );
            },
            child: Text('Go to Screen 2'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen3()),
              );
            },
            child: Text('Go to Location Information page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen4()),
              );
            },
            child: Text('Go to options display screen'),
          ),
        ],
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CSCI 480 App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Main Screen'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CalculatorPage()),
//                   );
//                 },
//                 child: const Text('Go to Calculator'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Screen2(name: 'Something', year: 2024)),
//                   );
//                 },
//                 child: const Text('Go to Screen 2'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Screen3()),
//                   );
//                 },
//                 child: const Text('Go to Screen 3'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Screen4()),
//                   );
//                 },
//                 child: const Text('Go to Screen 4'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

