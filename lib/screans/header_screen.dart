import 'package:flutter/material.dart';
import '../var.dart';

AppBar header(context, String titletext) {
  return AppBar(
    toolbarHeight: 60,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(30), bottomEnd: Radius.circular(30))),
    title: Text(
      titletext,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: globals.w,
      ),
    ),
    backgroundColor: globals.r,
    foregroundColor: globals.w,
  );
}
