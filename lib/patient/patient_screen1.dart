import 'package:flutter/material.dart';
import '../screans/header_screen.dart';
import '../box_class.dart';
import '../var.dart';

class PatientScreen1 extends StatefulWidget {
  const PatientScreen1({super.key});
  @override
  State<PatientScreen1> createState() => _PatientScreen1State();
}

class _PatientScreen1State extends State<PatientScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "المريض"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                box(
                  "images/log in patient.jpg",
                  'تسجيل الدخول',
                  context,
                  'pl',
                ),
                Container(width: 50, color: globals.w),
                box(
                  "images/register.jpg",
                  'تسجيل',
                  context,
                  'pr',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
