import 'package:DC_Robot/patient_card.dart';
import 'package:flutter/material.dart';
import 'header_screen.dart';
import '../var.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientQueueScreen extends StatefulWidget {
  final String api;
  final String scr;
  final int dcid;
  const PatientQueueScreen(
      {super.key, required this.api, required this.scr, required this.dcid});

  @override
  State<PatientQueueScreen> createState() => _PatientQueueScreenState();
}

class _PatientQueueScreenState extends State<PatientQueueScreen> {
  List patients = [];
  Future getpatients() async {
    var url = Uri.parse(widget.api);
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    setState(() {
      patients.addAll(responsebody);
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
      appBar: header(context, "قائمة إنتظار المرضى"),
      body: patients.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (BuildContext context, int index) {
                  final patient = patients[index]['patient'];
                  final patientName = patient['fname'];
                  final patientGender = patient['gender'];
                  final patientId = patient['id'];
                  final patientage = patient['age'];
                  final patientmedicalHistory = patient['medicalHistory'];
                  final patientlname = patient['lname'];
                  return patientCard(
                      patientlname,
                      patientName,
                      patientGender,
                      'images/pat.png',
                      patientage,
                      context,
                      widget.scr,
                      patientId,
                      patientmedicalHistory,
                      widget.dcid,
                      widget.api);
                },
              ),
            ),
    );
  }
}
