
import 'package:DC_Robot/screans/patient_screen2.dart';
import 'package:flutter/material.dart';
import 'header_screen.dart';
import '../var.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    _specializationController.dispose();

    super.dispose();
  }

  Future<void> _sendPostRequest() async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/patients/signup');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "name": _fnameController.text,
      "name2": _lnameController.text,
      "phoneNo": _phoneNoController.text,
      "age": _ageController.text,
      "gender": _genderController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "BloodPressure": bloodpressure.toString(),
      "Diabetes": diabetes.toString(),
      "Allergic": hss.toString(),
      "Surgery": gss.toString(),
      "Cancer": nss.toString(),
      "smoking": lss.toString(),
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      // Request successful
      var responseData = json.decode(response.body);
      setState(() {
        _responseText = responseData.toString();
      });

      // Check if the response text indicates a successful registration
      if (_responseText.contains('registration successful')) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PatientScreen2()),
        );
      } else {
        // Registration failed, show error snackbar
        _showErrorSnackbar('Registration failed. Please try again.');
      }
    } else {
      // Request failed, show error snackbar
      _showErrorSnackbar(
          'لم يتم الحجز يرجى مراجعه البيانات و المحاوله مره اخرى');
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
                    color: globals.b,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _fnameController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'الاسم الاول',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _lnameController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'الاسم الاخير',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _phoneNoController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _ageController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'العمر',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _genderController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'النوع',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.person,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _emailController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'البريد الالكتروني',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.email,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _passwordController,
                  cursorColor: globals.b,
                  style: TextStyle(
                    color: globals.b,
                  ),
                  decoration: InputDecoration(
                    labelText: 'كلمة السر ',
                    labelStyle: TextStyle(
                      color: globals.b,
                    ),
                    focusColor: globals.b,
                    fillColor: globals.b,
                    iconColor: globals.b,
                    prefixIconColor: globals.b,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                    prefixIcon: Icon(
                      Icons.password,
                      color: globals.b,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.b)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  ' اختر المرض المزمن',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: globals.b,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CheckboxListTile(
                    value: bloodpressure,
                    checkColor: globals.w,
                    activeColor: globals.b,
                    onChanged: (bool? value) {
                      setState(() {
                        bloodpressure = value;
                      });
                    },
                    title: Text(
                      "ضغط الدم",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.b,
                      ),
                    )),
                CheckboxListTile(
                  value: diabetes,
                  checkColor: globals.w,
                  activeColor: globals.b,
                  onChanged: (bool? value) {
                    setState(() {
                      diabetes = value;
                    });
                  },
                  title: Text(
                    " السكري",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: globals.b,
                    ),
                  ),
                ),
                CheckboxListTile(
                    value: lss,
                    checkColor: globals.w,
                    activeColor: globals.b,
                    onChanged: (bool? value) {
                      setState(() {
                        lss = value;
                      });
                    },
                    title: Text(
                      "هل تعاني من حساسية الصدر؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.b,
                      ),
                    )),
                CheckboxListTile(
                    value: gss,
                    checkColor: globals.w,
                    activeColor: globals.b,
                    onChanged: (bool? value) {
                      setState(() {
                        gss = value;
                      });
                    },
                    title: Text(
                      "هل خضعت لعمليات جراحية؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.b,
                      ),
                    )),
                CheckboxListTile(
                    value: nss,
                    checkColor: globals.w,
                    activeColor: globals.b,
                    onChanged: (bool? value) {
                      setState(() {
                        nss = value;
                      });
                    },
                    title: Text(
                      "هل لديك تاريخ مرضي مع السرطان؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.b,
                      ),
                    )),
                CheckboxListTile(
                    value: vss,
                    checkColor: globals.w,
                    activeColor: globals.b,
                    onChanged: (bool? value) {
                      setState(() {
                        vss = value;
                      });
                    },
                    title: Text(
                      "هل أنت مدخن؟",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: globals.b,
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
