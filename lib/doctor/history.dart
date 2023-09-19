import 'dart:convert';
import 'package:DC_Robot/screans/header_screen.dart';
import 'package:DC_Robot/doctor/sensor.dart';
import 'package:DC_Robot/doctor/statement.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'package:http/http.dart' as http;

class History extends StatefulWidget {
  final int apihp;
  final int apihd;
  final String apihi;
  const History({super.key, required this.apihp, required this.apihd, required this.apihi});
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String tandf(bool chose) {
    if (chose == true) {
      return 'يوجد';
    } else {
      return 'لا يوجد';
    }
  }

  List patients = [];
  Map patient = {};
  Future getpatients() async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/doctors/${widget.apihp}/appointments');
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    setState(() {
      patients.addAll(responsebody);
      patient = patients[0]['patient'];
    });
  }

  @override
  void initState() {
    super.initState();
    getpatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "السجل المرضى"),
      body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: patient.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'فصيلة الدم / ${patient['bloodType']} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'ضغط الدم / ${tandf(patient['BloodPressure'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        ' مرض السكري/ ${tandf(patient['Diabetes'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'الحساسية / ${tandf(patient['Allergic'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'الجراحة / ${tandf(patient['Surgery'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'السرطان / ${tandf(patient['Cancer'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'الحمل / ${tandf(patient['Pregnant'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'التدخين / ${tandf(patient['Smoker'])} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
                      Text(
                        'درجة الحرارة / ${patient['temperature']} ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: globals.gb,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: Divider(
                          color: globals.r,
                        ),
                      ),
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
                                  builder: (context) => const EcgSensorScreen(
                                    url:
                                        'https://stem.ubidots.com/app/dashboards/public/widget/KInJmmmX6UGM1D0B-ce4YYHJhG_RfhD8UexpjsePaI0?embed=true',
                                  ),
                                ));
                          },
                          child: Text(
                            ' المؤشر الحيوي',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: globals.w,
                            ),
                          ),
                        ),
                      ), const SizedBox(
                        height: 20,
                        
                      ),
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
                                  builder: (context) =>  Statement(apip: widget.apihd, apid: widget.apihp, api1: widget.apihi)
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
