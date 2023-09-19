import 'package:DC_Robot/doctor/audio_call.dart';
import 'package:DC_Robot/doctor/video_call.dart';
import "package:DC_Robot/var.dart";
import "package:flutter/material.dart";
import '../screans/header_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CallScrean extends StatefulWidget {
  final int apic;
  const CallScrean({super.key, required this.apic});

  @override
  CallScreanState createState() => CallScreanState();
}

class CallScreanState extends State<CallScrean> {
  Map patient = {};
  List patients = [];
  Future getpatients() async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/doctors/${widget.apic}/appointments');
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
      appBar: header(context, "بدء مكالمة"),
      body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: patients.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [SizedBox(height: 100,),
            ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Image.asset(
                'images/dc.jpg',
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
             ' ${patient['fname']} ${patient['lname']} ',
              style: 
               TextStyle(
                      color: globals.gb,
                      fontSize: 50
                    ),
            ),
            Text(
              '${patient['phoneNo']}',
              style: TextStyle(
                      color: globals.gb,
                      fontSize: 50
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideoCall()));
                    },
                    icon: const Icon(
                      Icons.video_call,
                      size: 44,
                    ),
                    color: globals.r,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AudioCall()));
                    },
                    icon: const Icon(
                      Icons.phone,
                      size: 35,
                    ),
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
