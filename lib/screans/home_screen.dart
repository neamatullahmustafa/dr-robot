import 'package:flutter/material.dart';
import '../../box_class.dart';
import '../var.dart';
import 'header_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, "د/ ربيع"),
      endDrawer: Drawer(
        child: Container(
          color: globals.w,
          child: Column(
            children: [
              Container(
                height: 78,
                decoration: BoxDecoration(
                    color: globals.r,
                    boxShadow: const [BoxShadow(blurRadius: 5)],
                    borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(30))),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: globals.w,
                    ),
                    Text(
                      " الإعدادات",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: globals.w,
                      ),
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
                      color: globals.gb,
                    ),
                    Text(
                      "   اللغة",
                      style: TextStyle(color: globals.gb),
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
                        color: globals.gb,
                      ),
                      Text("   مظهر داكن                          ",
                          style: TextStyle(color: globals.gb)),
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
                                   globals.gb = globals.gb ==  Colors.grey[800]
                                  ? Colors.grey[300]
                                  :  Colors.grey[800];
                              globals.gw = globals.gw == Colors.grey[300]
                                  ?  Colors.grey[800]
                                  : Colors.grey[300];
                            });
                          })
                    ],
                  )),
            ],
          ),
        ),
      ),
      backgroundColor: globals.w,
      body: Container(
        color: globals.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            box(
              "images/fracture.png",
              'المريض',
              context,
              'p',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    box(
                      "images/doctor.png",
                      'طبيب',
                      context,
                      'd',
                    ),
                  ],
                ),
                Container(width: 50, color: globals.w),
                box(
                  "images/nurse.png",
                  'الممرضة',
                  context,
                  'n',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
