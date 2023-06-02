import 'package:DC_Robot/screans/patient_queue_screen.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "غياب"),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 100),
          Text(
            ' اهلا و مرحبا بك دكتورنا',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: globals.b,
            ),
          ),
          Text(
            ' !كيف تريد ان تعمل اليوم',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: globals.b,
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
                      builder: (context) => const PatientQueueScreen(
                        api: 'https://drrobot-production.up.railway.app/api/doctors/1/appointments',
                      ),
                    ));
              },
              child: Text(
                'متصل ع الانترنت',
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
                      builder: (context) => const PatientQueueScreen(
                        api: 'https://drrobot-production.up.railway.app/api/doctors/1/appointments',
                      ),
                    ));
              },
              child: Text(
                "غير متصل ع الانترنت",
                style: TextStyle(
                  fontSize: 20.0,
                  color: globals.w,
                ),
              ),
            ),
          ),
        ])));
  }
}
