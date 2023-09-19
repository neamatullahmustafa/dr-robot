import 'package:DC_Robot/doctor/call_screan.dart';
import 'package:DC_Robot/doctor/history.dart';
import 'package:DC_Robot/doctor/prescription_doc.dart';
import 'package:DC_Robot/screans/patient_queue_screen.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import '../screans/header_screen.dart';

class Statement extends StatefulWidget {
  final int apip;
  final int apid;
   final String api1;
  const Statement({super.key, required this.apip, required this.apid, required this.api1});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "كشف"),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 100,),
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
                        builder: (context) => CallScrean(apic: widget.apip),
                      ));
                },
                child: Text(
                  'بدء المكالمة',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: globals.b,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 5)]),
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoshetaWrite(apirp: widget.apip, apird: widget.apid)
                      ));
                },
                child: Text(
                  "كتابة التقرير الطبي",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: globals.b,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 5)]),
              height: 60,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => History(
                           apihp:  widget.apip, apihd: widget.apid, apihi: widget.api1,
                        ),
                      ));
                },
                child: Text(
                  'السجل المرضى',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
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
                        builder: (context) => PatientQueueScreen(api: widget.api1, scr: 'ds', dcid:  widget.apid)
                      ));
                },
                child: Text(
                  'تم',
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
