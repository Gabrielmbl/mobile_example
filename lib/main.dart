import 'package:flutter/material.dart';
import 'package:flutter_application_1/bibleScreen.dart';
import 'package:flutter_application_1/calculator.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/ml_app.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/screen2.dart';
import 'package:flutter_application_1/screen3.dart';
import 'package:flutter_application_1/screen4.dart';
import 'package:page_transition/page_transition.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());

  // Print device info
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Running on ${androidInfo.model}');
}



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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => bibleScreen()),
              // );
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight, child: bibleScreen()));
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
                MaterialPageRoute(
                    builder: (context) =>
                        Screen2(name: 'Something', year: 2024)),
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


void printDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  print('Running on ${androidInfo.model}');
}