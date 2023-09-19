// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:DC_Robot/nurse/medicine_nr.dart';
import 'package:DC_Robot/nurse/device_nr.dart';
import 'package:DC_Robot/nurse/x_ray_nr.dart';
import 'package:DC_Robot/nurse/analysis_nr.dart';
import 'package:flutter/material.dart';
import '../screans/header_screen.dart';

import 'package:http/http.dart' as http;
import '../var.dart';
import '../screans/patient_queue_screen.dart';

class RoshetaRead extends StatefulWidget {
  final int varapi;
  const RoshetaRead({super.key, required this.varapi});

  @override
  State<RoshetaRead> createState() => _RoshetaReadState();
}

class _RoshetaReadState extends State<RoshetaRead> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return globals.w;
    }
    return globals.b;
  }

  void _showErrorSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool? dwa = false;
  bool? ta7lel = false;
  bool? esha3a = false;
  bool? device = false;
  String _responseText = '';
  Future<void> _sendPostRequest() async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/patients/${widget.varapi}');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "Medicine_done": dwa.toString(),
      "Analysis_done": ta7lel.toString(),
      "X_Ray_done": esha3a.toString(),
      "Reviewed_devices": device.toString(),
    });
    var response = await http.put(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      setState(() {
        _responseText = responseData.toString();
      });
      print(_responseText);
      if (_responseText.contains('Update successful')) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientQueueScreen(
                api:
                    'https://drrobot-production.up.railway.app/api/nurses/appointments',
                scr: 'ns',
                dcid: widget.varapi,
              ),
            ));
      } else {
        // Registration failed, show error snackbar
        _showErrorSnackbar('add is failed. Please try again.');
      }
    } else {
      // Request failed, show error snackbar
      _showErrorSnackbar(
          'Request failed with status code ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "التقرير الطبي"),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CheckboxListTile(
                    value: dwa,
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    onChanged: (bool? value) {
                      setState(() {
                        dwa = value;
                      });
                    },
                    title: Text(
                     "أخذ العقار فى موعده",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 900),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: globals.r,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(blurRadius: 5)]),
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DwaNr(
                                          api:
                                              'https://drrobot-production.up.railway.app/api/patients/${widget.varapi}/prescriptions',
                                        )));
                          },
                          child: Text(
                           "عرض العقارات الطبية للمريض",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: globals.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    value: ta7lel,
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    onChanged: (bool? value) {
                      setState(() {
                        ta7lel = value;
                      });
                    },
                    title: Text(
                      "عمل التحاليل المطلوبة",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 900),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: globals.r,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(blurRadius: 5)]),
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ta7lelNr(
                                          api:
                                              'https://drrobot-production.up.railway.app/api/patients/${widget.varapi}/prescriptions',
                                        )));
                          },
                          child: Text(
                            'عرض التحاليل المطلوبة',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: globals.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    value: esha3a,
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    onChanged: (bool? value) {
                      setState(() {
                        esha3a = value;
                      });
                    },
                    title: Text(
                      "عمل الأشعة المطلوبة",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 900),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: globals.r,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(blurRadius: 5)]),
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => E4a3aNr(
                                          api:
                                              'https://drrobot-production.up.railway.app/api/patients/${widget.varapi}/prescriptions',
                                        )));
                          },
                          child: Text(
                            'عرض الأشعة المطلوبة',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: globals.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    value: device,
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    onChanged: (bool? value) {
                      setState(() {
                        device = value;
                      });
                    },
                    title: Text(
                     "مراجعة الأجهزة",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 900),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: globals.r,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(blurRadius: 5)]),
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Devices()));
                          },
                          child: Text(
                            "عرض الأجهزة المتصلة بالمريض",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: globals.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                        color: globals.r,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(blurRadius: 5)]),
                    height: 50,
                    child: MaterialButton(
                      onPressed: () => _sendPostRequest(),
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
            )));
  }
}
