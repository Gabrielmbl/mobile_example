import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/person.dart';

class RegisteredUsers extends StatelessWidget {
  const RegisteredUsers({super.key, required List<Person> this.usernames_list});

  final List<Person> usernames_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registered Users"),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: usernames_list.length,
            itemBuilder: (context, index) {
              final person = usernames_list[index];

              return ListTile(
                title: Text(person.username),
              );
            })

        // Center(
        //     child: Padding(
        //         padding: EdgeInsets.all(20),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [

        //             for (Person element in usernames_list) {
        //               Text(element.username);
        //             }
        //           ],
        //         )))
        );
  }
}
