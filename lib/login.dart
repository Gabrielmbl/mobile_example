import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/screen5.dart';
import 'package:flutter_application_1/utils/dbProvider.dart';
import 'package:flutter_application_1/utils/person.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String output = "";

  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    dbProvider db = dbProvider();
    Future<Person?> loggedUser;
    db.open("mydb.db").then((value) => {
          loggedUser = db.getPerson(username, password),
          loggedUser.then((user) async {
            setState(() {});
            List<Person> peeps = await db.getPeople();
            for (Person element in peeps) {
              print(element.username);
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisteredUsers(usernames_list: peeps,)),
            );
          })
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username:"),
                    TextField(controller: usernameController),
                    Text("Password:"),
                    TextField(
                      controller: passwordController,
                      obscureText:
                          true, // Set obscureText to true for password field
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: login, child: Icon(Icons.login)),
                    Text('$output'),
                    SizedBox(height: 40),
                    Text("Register: "),
                    // ElevatedButton(onPressed: registerPage, child: Icon(Icons.app_registration),)
                  ],
                ),
                SizedBox(height: 20), // Spacer between buttons and output

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Go to Register Page"),
                ),
              ],
            ),
          ),
        ));
  }
}
