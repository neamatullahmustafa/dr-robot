import 'package:flutter/material.dart';
import './var.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: globals.w,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(50, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: 40,
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: globals.b,
                  ),
                  Text(
                    "   Settings",
                    style: TextStyle(color: globals.b),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    color: globals.b,
                  ),
                  Text(
                    "   Language",
                    style: TextStyle(color: globals.b),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.color_lens,
                      color: globals.b,
                    ),
                    Text("   Dark Mode                          ",
                        style: TextStyle(color: globals.b)),
                    Switch(
                        value: s,
                        onChanged: (val) {
                          setState(() {
                            s = val;
                            globals.b = globals.b == Colors.black
                                ? Colors.white
                                : Colors.black;
                            globals.w = globals.w == Colors.white
                                ? Colors.black
                                : Colors.white;
                            globals.gw = globals.gw == Colors.grey[500]
                                ? Colors.grey[800]
                                : Colors.grey[500];
                            globals.gb = globals.gb == Colors.grey[800]
                                ? Colors.grey[500]
                                : Colors.grey[800];
                            notifyListeners();
                          });
                        })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
