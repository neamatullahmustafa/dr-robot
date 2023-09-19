
import 'package:DC_Robot/doctor/analysis_screan.dart';
import 'package:DC_Robot/doctor/medicine_screen.dart';
import 'package:DC_Robot/screans/patient_queue_screen.dart';
import 'package:DC_Robot/doctor/x_ray_screan.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import '../screans/header_screen.dart';

class RoshetaWrite extends StatefulWidget {
  final int apirp;
  final int apird;
  const RoshetaWrite({super.key, required this.apirp, required this.apird});
  @override
  State<RoshetaWrite> createState() => _RoshetaWriteState();
}

class _RoshetaWriteState extends State<RoshetaWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "التقرير الطبي"),
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
                        builder: (context) => Dwa(
                          apid: widget.apirp,
                          apip: widget.apird,
                        ),
                      ));
                },
                child: Text(
                 "إضافة عقار طبي",
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
                        builder: (context) => Esha3a(
                          apiep: widget.apirp,
                          apied: widget.apird,
                        ),
                      ));
                },
                child: Text(
                  "إضافة أشعة",
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
                        builder: (context) => Ta7lel(
                          apitp: widget.apirp,
                          apitd: widget.apird,
                        ),
                      ));
                },
                child: Text(
                 "إضافة تحليل",
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
                              'https://drrobot-production.up.railway.app/api/doctors/${widget.apird}/appointments',
                          scr: 'dc',
                          dcid: widget.apird,
                        ),
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
