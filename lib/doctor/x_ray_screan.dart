// ignore_for_file: use_build_context_synchronously

import 'package:DC_Robot/doctor/prescription_doc.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import '../screans/header_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Esha3a extends StatefulWidget {
  final int apiep;
  final int apied;
  const Esha3a({super.key, required this.apiep, required this.apied});
  @override
  State<Esha3a> createState() => _Esha3aState();
}

class _Esha3aState extends State<Esha3a> {
  void _showErrorSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final TextEditingController _esha3acontroller = TextEditingController();

  String _responseText = '';
  @override
  void dispose() {
    _esha3acontroller.dispose();
    super.dispose();
  }

  Future<void> _sendPostRequest(int ro7) async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/prescriptions');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "X_Ray": _esha3acontroller.text,
      "patientId": widget.apiep,
      "doctorId": widget.apied,
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
                builder: (context) => Esha3a(
                      apiep: widget.apiep,
                      apied: widget.apied,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoshetaWrite(
                      apirp: widget.apiep,
                      apird: widget.apied,
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
        appBar: header(context, 'طلب الأشعة'),
        body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                            labelText: 'أدخل اسم الأشعة',
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
                               ' إضافة',
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
                ),
              )),
        ));
  }
}
