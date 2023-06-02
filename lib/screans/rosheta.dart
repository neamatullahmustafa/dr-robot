import 'package:DC_Robot/screans/dwa_screen.dart';
import 'package:DC_Robot/screans/esha3a_screan.dart';
import 'package:DC_Robot/screans/ta7lel_screan.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';

class Rosheta extends StatefulWidget {
  const Rosheta({super.key});

  @override
  State<Rosheta> createState() => _RoshetaState();
}

class _RoshetaState extends State<Rosheta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "الروشته"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(children: [
            const SizedBox(height: 200),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: globals.r,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 5)]),
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dwa(),
                      ));
                },
                child: Text(
                  'اضافه دواء',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: globals.r,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 5)]),
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Esha3a(),
                      ));
                },
                child: Text(
                  'اضافه اشعه',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: globals.r,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 5)]),
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Ta7lel(),
                      ));
                },
                child: Text(
                  'اضافه تحليل',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
          ])),
        ));
  }
}
