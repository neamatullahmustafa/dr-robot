import 'package:DC_Robot/screans/rosheta.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';

class Esha3a extends StatefulWidget {
  const Esha3a({super.key});

  @override
  State<Esha3a> createState() => _Esha3aState();
}

class _Esha3aState extends State<Esha3a> {
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
                          labelText: 'ادخل اسم الاشعه',
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
                                  builder: (context) => const Esha3a(),
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
              ),
            )));
  }
}
