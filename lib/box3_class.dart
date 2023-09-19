import 'package:flutter/material.dart';
import 'var.dart';

TextFormField moraba3(
    String name, var icona, String hint, var number, String please) {
  return TextFormField(
    controller: TextEditingController(),
    autovalidateMode: AutovalidateMode.always,
    cursorColor: globals.b,
    style: TextStyle(
      color: globals.gb,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return please;
      }
      return null;
    },
    maxLength: number,
    decoration: InputDecoration(
      labelText: name,
      labelStyle: TextStyle(
        color: globals.gb,
      ), //
      focusColor: globals.b,
      fillColor: globals.b,
      iconColor: globals.b,
      prefixIconColor: globals.gb,
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
      prefixIcon: Icon(
        icona,
        color: globals.gb,
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: globals.b)),
    ),
  );
}
