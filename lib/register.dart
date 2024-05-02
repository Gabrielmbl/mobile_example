import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/dbProvider.dart';
import 'package:flutter_application_1/utils/person.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String output = "";

  void register() {
    String username = usernameController.text;
    String password = passwordController.text;
    String email = emailController.text;
    Person person =
        Person(id: 0, username: username, email: email, password: password);
        print(person.toMap().toString());
    dbProvider db = dbProvider();
    Future<Person> createdUser;
    db.open("mydb.db").then((value) => {

    createdUser = db.insertPerson(person)
    
  // createdUser.then((value) => {
  //         // output = ('$username has registered with id $value.id');
  //         print('register success')
  //       });


    });


  
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Username:"),
              TextField(controller: usernameController),
              SizedBox(height: 20),
              Text("Password:"),
              TextField(
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              Text("Email:"),
              TextField(controller: emailController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: register,
                child: Text("Register"),
              ),
              SizedBox(height: 20),
              Text('$output'),
            ],
          ),
        ),
      ),
    );
  }
}

// Person person = Person(id: id, username: username, email: email, password: password);