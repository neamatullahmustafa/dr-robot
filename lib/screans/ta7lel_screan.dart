import 'package:DC_Robot/screans/rosheta.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';

const List<String> type = <String>[
      'اختر نوع التحليل',
      'دم',
      'بول',
      'براز',
      'اخرى',
    ],
    state = <String>[
      'اختر الحاله ',
      'صايم',
      'فاطر',
    ];

class Ta7lel extends StatefulWidget {
  const Ta7lel({super.key});

  @override
  State<Ta7lel> createState() => _Ta7lelState();
}

class _Ta7lelState extends State<Ta7lel> {
  String selectedtype = type.first, selectedstate = state.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, 'مريض'),
        body: Padding(
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
                        color: globals.b,
                      ),
                      decoration: InputDecoration(
                        labelText: 'ادخل اسم التحليل',
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
                    DropdownButton<String>(
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
                        // This is called when the user selects an item.
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
                        // This is called when the user selects an item.
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Ta7lel(),
                              ));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Rosheta(),
                              ));
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
            )));
  }
}
