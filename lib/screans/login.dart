// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, unused_local_variable, prefer_final_fields, unused_element

import 'dart:convert';
import 'package:DC_Robot/screans/doctor_screen.dart';
import 'package:DC_Robot/screans/patient_queue_screen.dart';
import 'patient_screen2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'header_screen.dart';
import '../var.dart';

void select2Screan(BuildContext screan, String scr) {
  Widget sscr = const Login(
    thetitle: 'login',
    sccr: 'ns',
    api: '',
  );
  if (scr == 'ds') {
    sscr = const DoctorScreen();
  } else if (scr == 'ns') {
    sscr = const PatientQueueScreen(
      api: 'https://drrobot-production.up.railway.app/api/doctors/1/appointments',
    );
  } else if (scr == 'ps') {
    sscr = const PatientScreen2();
  }
  Navigator.of(screan).push(
    MaterialPageRoute(
      builder: (scr) => sscr,
    ),
  );
}

class Login extends StatefulWidget {
  final String thetitle, sccr, api;
  const Login(
      {super.key,
      required this.thetitle,
      required this.sccr,
      required this.api});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameControl = TextEditingController();
  TextEditingController _passwordControl = TextEditingController();

  String _responseText = '';
  @override
  void dispose() {
    _usernameControl.dispose();
    _passwordControl.dispose();

    super.dispose();
  }

  Future<void> _sendPostRequest(
      BuildContext screan, String scr, String api) async {
    var url = Uri.parse(api);
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "email": _usernameControl.text,
      "password": _passwordControl.text,
      'access_token': 'my_access_token',
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      select2Screan(context, widget.sccr);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.body),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, widget.thetitle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            'تسجيل الدخول',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: globals.b,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          TextField(
            controller: _usernameControl,
            cursorColor: globals.b,
            style: TextStyle(
              color: globals.b,
            ),
            decoration: InputDecoration(
              labelText: 'من فضلك ادخل بريدك الالكترني',
              labelStyle: TextStyle(
                color: globals.b,
              ),
              focusColor: globals.b,
              fillColor: globals.b,
              iconColor: globals.b,
              prefixIconColor: globals.b,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
              prefixIcon: Icon(
                Icons.email,
                color: globals.gb,
              ),
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: _passwordControl,
            cursorColor: globals.b,
            style: TextStyle(
              color: globals.b,
            ),
            decoration: InputDecoration(
              labelText: 'من فضلك ادخل الرقم السري',
              labelStyle: TextStyle(
                color: globals.b,
              ), //
              focusColor: globals.b,
              fillColor: globals.b,
              iconColor: globals.b,
              prefixIconColor: globals.b,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
              prefixIcon: Icon(
                Icons.password,
                color: globals.b,
              ),
              border:
                  OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: globals.r,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(blurRadius: 5)]),
            height: 40.0,
            child: InkWell(
              onTap: () => _sendPostRequest(context, widget.sccr, widget.api),
              child: Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: globals.w,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(_responseText),
        ]),
      ),
    );
  }
}
