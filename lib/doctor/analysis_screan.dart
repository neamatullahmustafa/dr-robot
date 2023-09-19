// ignore_for_file: use_build_context_synchronously

import 'package:DC_Robot/doctor/prescription_doc.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import '../screans/header_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> type = <String>[
      'اختر نوع التحليل',
      'دم',
      'بول',
      'براز',
     'أخري',
    ],
    state = <String>[
      'اختر الحالة ',
      'صائم',
      'فاطر',
    ];

class Ta7lel extends StatefulWidget {
  final int apitp;
  final int apitd;
  const Ta7lel({super.key, required this.apitp, required this.apitd});
  @override
  State<Ta7lel> createState() => _Ta7lelState();
}

class _Ta7lelState extends State<Ta7lel> {
  void _showErrorSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String selectedtype = type.first, selectedstate = state.first;
  final TextEditingController _ta7lelcontroller = TextEditingController();
  String _responseText = '';
  @override
  void dispose() {
    _ta7lelcontroller.dispose();
    super.dispose();
  }

  Future<void> _sendPostRequest(int ro7) async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/prescriptions');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "Analysis": _ta7lelcontroller.text,
      "Analysistype": selectedtype,
      "PatientCondition": selectedstate,
      "patientId": widget.apitp,
      "doctorId": widget.apitd,
    });
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      setState(() {
        _responseText = responseData.toString();
      });
      if (_responseText.contains('add medicine successful')) {
        if (ro7 == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Ta7lel(
                      apitp: widget.apitp,
                      apitd: widget.apitd,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoshetaWrite(
                      apirp: widget.apitp,
                      apird: widget.apitd,
                    )),
          );
        }
      } else {
        _showErrorSnackbar(
            'لم يتم الإضافة يرجى مراجعة البيانات والمحاولة مرة أخرى');
      }
    } else {
      _showErrorSnackbar('خطأ رقم  ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, 'طلب تحليل'),
        body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        cursorColor: globals.r,
                        style: TextStyle(
                          color: globals.gb,
                        ),
                        decoration: InputDecoration(
                          labelText: "أدخل اسم التحليل",
                          labelStyle: TextStyle(
                            color: globals.gb,
                          ), //
                          focusColor: globals.r,
                          fillColor: globals.r,
                          prefixIconColor: globals.r,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: globals.r)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: globals.r)),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      DropdownButton<String>(
                        dropdownColor: globals.w,
                        value: selectedtype,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: globals.r,
                        ),
                        elevation: 16,
                        style: TextStyle(color: globals.b),
                        underline: Container(
                          height: 2,
                          color: globals.r,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            selectedtype = value!;
                          });
                        },
                        items: type.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      DropdownButton<String>(
                        dropdownColor: globals.w,
                        value: selectedstate,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: globals.r,
                        ),
                        elevation: 16,
                        style: TextStyle(color: globals.b),
                        underline: Container(
                          height: 2,
                          color: globals.r,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            selectedstate = value!;
                          });
                        },
                        items:
                            state.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: globals.r,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(blurRadius: 5)]),
                        height: 40.0,
                        child: MaterialButton(
                          onPressed: () {
                            _sendPostRequest(1);
                          },
                          child: Center(
                            child: Text(
                              "إضافة",
                              style: TextStyle(
                                color: globals.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                            color: globals.r,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(blurRadius: 5)]),
                        height: 40.0,
                        child: MaterialButton(
                          onPressed: () {
                            _sendPostRequest(2);
                          },
                          child: Center(
                            child: Text(
                              'تم',
                              style: TextStyle(
                                color: globals.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
