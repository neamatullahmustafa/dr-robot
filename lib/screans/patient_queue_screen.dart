import 'package:flutter/material.dart';
import '../patient_card.dart';
import 'header_screen.dart';
import '../var.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientQueueScreen extends StatefulWidget {
  final String api;
  const PatientQueueScreen({super.key, required this.api});

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
    
       print(patients);
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
      appBar: header(context, 'قائمه المرضى'),
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
                  return patientCard('$patientName', '$patientGender',
                      'images/pat.png', '$patientGender', context);
                },

                //  patientCard( 'نعمه الله', 'متصل', 'images/pat.png', 'استشاره', context),
              ),
            ),
    );
  }
}
