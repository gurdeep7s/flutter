import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  var text ="";
  var tabs = [
    const Center(child: Text("")),
    const Center(child: Text("Fav"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
           fixedColor: Colors.white,
          // unselectedItemColor: Colors.red,
          backgroundColor: Color(0xff275C2E),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.red),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Profile",
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            debugPrint("Index :: " + index.toString());
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
