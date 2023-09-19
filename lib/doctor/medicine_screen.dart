// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:DC_Robot/doctor/prescription_doc.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import '../screans/header_screen.dart';
import 'package:http/http.dart' as http;

const List<String> dosage = <String>[
      'اختر الجرعة',
      '0.25',
      '0.5',
      '1',
      '2',
    ],
    rebeted = <String>[
      'مرات التكرار',
      'كل ثمان ساعات',
      'كل اثنا عشر ساعة',
      'كل ست ساعات',
      'عند الحاجة',
      'يومياً',
      'أسبوعياً',
      'شهرياً'
    ],
    tobetaken = <String>[
      'اختر التوقيت',
      'قبل الطعام',
      'بعد الطعام',
      'قبل الاكل بساعه',
      'بعد الاكل بساعه'
    ],
    course = <String>[
      'اختر المدة',
      'لمدة أسبوع',
      'لمدة شهر',
      'عند الشعور بتحسن',
      'مدى الحياة'
    ],
    type = <String>['اختر نوع العقار', 'حبوب', 'شراب', 'حقن', 'لبوس', 'محلول'];

class Dwa extends StatefulWidget {
  final int apid;
  final int apip;
  const Dwa({super.key, required this.apip, required this.apid});

  @override
  State<Dwa> createState() => _DwaState();
}

class _DwaState extends State<Dwa> {
  void _showErrorSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String _selecteddosage = dosage.first,
      _selectedrebeted = rebeted.first,
      _selectedtobetaken = tobetaken.first,
      _selectedcourse = course.first,
      _selectedtype = type.first;

  final TextEditingController _medicinecontroller = TextEditingController();

  String _responseText = '';
  @override
  void dispose() {
    _medicinecontroller.dispose();
    super.dispose();
  }

  Future<void> _sendPostRequest(int ro7) async {
    var url = Uri.parse(
        'https://drrobot-production.up.railway.app/api/prescriptions');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "Medicine": _medicinecontroller.text,
      "Repeat": _selectedrebeted,
      "Taken": _selectedtobetaken,
      "Type": _selectedtype,
      "Duration": _selectedcourse,
      "Dosage": _selecteddosage,
      "patientId": widget.apip,
      "doctorId": widget.apid,
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
                builder: (context) => Dwa(
                      apid: widget.apid,
                      apip: widget.apip,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoshetaWrite(
                      apirp: widget.apip,
                      apird: widget.apid,
                    )),
          );
        }
      } else {
        _showErrorSnackbar(
            'لم يتم الإضافة يرجى مراجعة البيانات والمحاولة مرة أخرى');
      }
    } else {
      _showErrorSnackbar('خطأ رقم ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "وصف العقارات الطبية"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _medicinecontroller,
                    cursorColor: globals.r,
                    style: TextStyle(
                      color: globals.gb,
                    ),
                    decoration: InputDecoration(
                      labelText: ' أدخل اسم العقار',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        DropdownButton<String>(
                          dropdownColor: globals.w,
                          value: _selectedtype,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: globals.r,
                          ),
                          elevation: 16,
                          style: TextStyle(color: globals.gb),
                          underline: Container(
                            height: 2,
                            color: globals.r,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedtype = value!;
                            });
                          },
                          items: type
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        DropdownButton<String>(
                          dropdownColor: globals.w,
                          value: _selecteddosage,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: globals.r,
                          ),
                          elevation: 16,
                          style: TextStyle(color: globals.gb),
                          underline: Container(
                            height: 2,
                            color: globals.r,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _selecteddosage = value!;
                            });
                          },
                          items: dosage
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  DropdownButton<String>(
                    dropdownColor: globals.w,
                    value: _selectedrebeted,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: globals.r,
                    ),
                    elevation: 16,
                    style: TextStyle(color: globals.gb),
                    underline: Container(
                      height: 2,
                      color: globals.r,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedrebeted = value!;
                      });
                    },
                    items:
                        rebeted.map<DropdownMenuItem<String>>((String value) {
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
                    value: _selectedtobetaken,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: globals.r,
                    ),
                    elevation: 16,
                    style: TextStyle(color: globals.gb),
                    underline: Container(
                      height: 2,
                      color: globals.r,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedtobetaken = value!;
                      });
                    },
                    items:
                        tobetaken.map<DropdownMenuItem<String>>((String value) {
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
                    value: _selectedcourse,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: globals.r,
                    ),
                    elevation: 16,
                    style: TextStyle(color: globals.gb),
                    underline: Container(
                      height: 2,
                      color: globals.r,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedcourse = value!;
                      });
                    },
                    items: course.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
        ));
  }
}
