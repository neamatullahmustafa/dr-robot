import 'package:flutter/material.dart';
import '../screans/header_screen.dart';
import '../box_class.dart';
import '../var.dart';

class PatientScreen2 extends StatefulWidget {
  const PatientScreen2({super.key});
  @override
  State<PatientScreen2> createState() => _PatientScreen2State();
}

class _PatientScreen2State extends State<PatientScreen2> {
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
                  'images/sp.jpeg',
                  'التخصصات الطبية',
                  context,
                  'sp',
                ),
                Container(width: 50, color: globals.w),
                box(
                  'images/sy.jpeg',
                  'الأعراض المرضية',
                  context,
                  'sy',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
