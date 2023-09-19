import 'package:DC_Robot/screans/patient_queue_screen.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import '../screans/header_screen.dart';

class DoctorScreen extends StatefulWidget {
  final int id;
  const DoctorScreen({super.key, required this.id});
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, 'الطبيب'),
        body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            const SizedBox(height: 100),
            Text(
              'أهلاً ومرحباً بك طبيبنا',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: globals.gb,
              ),
            ),
            Text(
              ' !كيف تريد أن تعمل اليوم',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: globals.gb,
              ),
            ),
            const SizedBox(height: 100),
            Container(
              width: 250,
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
                        builder: (context) => PatientQueueScreen(
                          api:
                              'https://drrobot-production.up.railway.app/api/doctors/${widget.id}/appointments',
                          scr: 'ds',
                          dcid: widget.id,
                        ),
                      ));
                },
                child: Text(
                  'متصل على الإنترنت',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.w,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Container(
              width: 250,
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
                        builder: (context) => PatientQueueScreen(
                          api:
                              'https://drrobot-production.up.railway.app/api/doctors/${widget.id}/appointments',
                          scr: 'ds',
                          dcid: widget.id,
                        ),
                      ));
                },
                child: Text(
                  "غير متصل على الإنترنت",
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
