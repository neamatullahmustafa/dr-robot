// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:DC_Robot/patient/patient_screen2.dart';
import 'package:flutter/material.dart';
import '../screans/header_screen.dart';
import '../var.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  bool? bloodpressure = false;
  bool? diabetes = false;
  bool? hss = false;
  bool? gss = false;
  bool? nss = false;
  bool? lss = false;
  bool? vss = false;
  bool? mss = false;

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _nationalnumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();

  String _responseText = '';

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneNoController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bloodTypeController.dispose();
     _nationalnumberController.dispose();
     _addressController.dispose();
    _specializationController.dispose();

    super.dispose();
  }

  Future<void> _sendPostRequest() async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/patients/signup');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "fname": _fnameController.text,
      "lname": _lnameController.text,
      "phoneNo": _phoneNoController.text,
      "age": _ageController.text,
      "gender": _genderController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
       "bloodType": _bloodTypeController.text,
       "nationalnumber": _nationalnumberController.text,
       "address": _addressController.text,
      "BloodPressure": bloodpressure.toString(),
      "Diabetes": diabetes.toString(),
      "Allergic": hss.toString(),
      "Surgery": gss.toString(),
      "Cancer": nss.toString(),
      "smoking": lss.toString(),
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      setState(() {
        _responseText = responseData.toString();
      });

      if (_responseText.contains('registration successful')) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PatientScreen2()),
        );
      } else {
        _showErrorSnackbar(
            'لم يتم التسجيل يرجى كتابة البايانات بشكل صحيح و المحاولة مرة اخرى');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("يرجى استكمال البيانات المطلوبة"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, 'التسجيل'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'التسجيل',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: globals.gb,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _fnameController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: "الإسم الأول",
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _lnameController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'الإسم الأخير',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _phoneNoController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _ageController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'العمر',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _genderController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'النوع',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),TextField(
                  controller: _bloodTypeController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'فصيلة الدم',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.bloodtype,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ), const SizedBox(
                  height: 20.0,
                ),TextField(
                  controller: _nationalnumberController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText:'الرقم القومى',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ), const SizedBox(
                  height: 20.0,
                ),TextField(
                  controller: _addressController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'العنوان',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.home,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _emailController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'البريد الإلكتروني',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.email,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _passwordController,
                  cursorColor: globals.gb,
                  style: TextStyle(
                    color: globals.gb,
                  ),
                  decoration: InputDecoration(
                    labelText: 'كلمة السر ',
                    labelStyle: TextStyle(
                      color: globals.gb,
                    ),
                    focusColor: globals.gb,
                    fillColor: globals.gb,
                    iconColor: globals.gb,
                    prefixIconColor: globals.gb,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(
                      Icons.password,
                      color: globals.gb,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  ' اختر المرض المزمن',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.gb,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CheckboxListTile(
                    value: bloodpressure,
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    onChanged: (bool? value) {
                      setState(() {
                        bloodpressure = value;
                      });
                    },
                    title: Text(
                      "ضغط الدم",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    )),
                CheckboxListTile(
                  value: diabetes,
                  checkColor: globals.r,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  onChanged: (bool? value) {
                    setState(() {
                      diabetes = value;
                    });
                  },
                  title: Text(
                    " مرض السكري ",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: globals.gb,
                    ),
                  ),
                ),
                CheckboxListTile(
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: lss,
                    onChanged: (bool? value) {
                      setState(() {
                        lss = value;
                      });
                    },
                    title: Text(
                      "هل تعاني من حساسية الصدر؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    )),
                CheckboxListTile(
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: gss,
                    onChanged: (bool? value) {
                      setState(() {
                        gss = value;
                      });
                    },
                    title: Text(
                      "هل خضعت لعمليات جراحية؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    )),
                CheckboxListTile(
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: nss,
                    onChanged: (bool? value) {
                      setState(() {
                        nss = value;
                      });
                    },
                    title: Text(
                      "هل لديك تاريخ مرضي مع السرطان؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    )),
                CheckboxListTile(
                    checkColor: globals.r,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: vss,
                    onChanged: (bool? value) {
                      setState(() {
                        vss = value;
                      });
                    },
                    title: Text(
                      "هل أنت مدخن؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.gb,
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: globals.r,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(blurRadius: 5)]),
                    height: 40.0,
                    child: InkWell(
                      onTap: () => _sendPostRequest(),
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
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ));
  }
}
