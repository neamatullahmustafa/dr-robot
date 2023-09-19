
import 'dart:convert';
import 'package:DC_Robot/screans/Rosheta_doc.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';
import 'package:http/http.dart' as http;

const List<String> dosage = <String>[
      'اختر الجرعه',
      '0.25',
      '0.5',
      '1',
      '2',
    ],
    rebeted = <String>[
      'اختر التكرار',
      'كل ثمان ساعات',
      'كل اثنا عشر ساعه',
      'كل ست ساعات',
      'عند الحاجه',
      'يوميا',
      'اسبوعيا',
      'شهريا'
    ],
    tobetaken = <String>[
      ' اختر الوقت',
      'قبل الاكل',
      'بعد الاكل',
      'قبل الاكل بساعه',
      'بعد الاكل بساعه'
    ],
    course = <String>[
      'اختر المده',
      'لمده اسبوع',
      'لمده شهر',
      'عند الشعور بتحسن',
      'مدى الحياه'
    ],
    type = <String>['اختر نوع الدواء', 'حبوب', 'شراب', 'حقن', 'لبوس', 'محلول'];

class Dwa extends StatefulWidget {
  const Dwa({super.key});

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
    var url =
        Uri.parse('https://drrobot-production.up.railway.app/api/prescription');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "Medicine": _medicinecontroller.text,
      "Repeat": _selectedrebeted,
      "Taken": _selectedtobetaken,
      "Timeofday": _selectedtype,
      "Duration": _selectedcourse,
      "Dosage": _selecteddosage,
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      // Request successful
      var responseData = json.decode(response.body);
      setState(() {
        _responseText = responseData.toString();
      });

      // Check if the response text indicates a successful registration
      if (_responseText.contains('add medicine successful')) {
        if (ro7 == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dwa()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Rosheta()),
          );
        }
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
        appBar: header(context, 'مريض'),
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
                      color: globals.b,
                    ),
                    decoration: InputDecoration(
                      labelText: 'ادخل اسم العلاج',
                      labelStyle: TextStyle(
                        color: globals.b,
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
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        DropdownButton<String>(
                          value: _selectedtype,
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
                            // This is called when the user selects an item.
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
                          value: _selecteddosage,
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
                            // This is called when the user selects an item.
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
                    value: _selectedrebeted,
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
                      // This is called when the user selects an item.
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
                    value: _selectedtobetaken,
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
                      // This is called when the user selects an item.
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
                    value: _selectedcourse,
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
                      // This is called when the user selects an item.
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
                          'اضافه',
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
