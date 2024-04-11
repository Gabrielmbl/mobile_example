import "package:flutter/material.dart";
import "package:flutter_application_1/screen4.dart";

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool favorite = false;
  int count = 41;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter layout demo"),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            const Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?cs=srgb&dl=pexels-pixabay-147411.jpg&fm=jpg"),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 15),
                Expanded(
                  // flex: 2,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Kandersteg, Switzerland',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )),
                    ],
                  ),
                ),

                // const SizedBox(width: 70), // Adjust the width as needed
                Expanded(
                  // flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onDoubleTap: toggleLike,
                            child: Icon(
                              Icons.star,
                              color: favorite ? Colors.red : Colors.black,
                            ),
                          ),
                          Text("$count"),
                          SizedBox(width: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.phone, color: Colors.purple),
                    Text('CALL'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.navigation, color: Colors.purple),
                    Text('ROUTE')
                  ],
                ),
                
                GestureDetector(
                  onTap: goToScreen4,
                  child: Column(
                  children: [
                    Icon(Icons.share, color: Colors.purple),
                    Text('SHARE')
                  ],
                ),
                )
                
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
                        ' reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla'
                        ' pariatur. Excepteur sint occaecat cupidatat non proident, sunt in'
                        ' culpa qui officia deserunt mollit anim id est laborum.',
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        )));
  }

  void toggleLike() {
    setState(() {
      if (favorite) {
        favorite = false;
        count--;
      } else {
        favorite = true;
        count++;
      }
    });
  }

  void goToScreen4() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const Screen4()),);
  }
}
