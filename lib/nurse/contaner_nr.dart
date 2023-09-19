import 'package:flutter/material.dart';
import '../var.dart';

Widget conNr(String title1) {
  return Container(
    decoration: BoxDecoration(
        color: globals.w,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 5,color:globals.b )]),
    height: 50,
    child: Center(
      child: Text(
        title1,
        style: TextStyle(
          fontSize: 20.0,
          color: globals.gb,
        ),
      ),
    ),
  );
}
