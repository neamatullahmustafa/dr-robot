import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';
import '../box2_class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Specialest extends StatefulWidget {
  const Specialest({super.key});
  @override
  State<Specialest> createState() => _SpecialestState();
}

class _SpecialestState extends State<Specialest> {
  List departments = [];
  Future getdepartments() async {
    var url =
        Uri.parse('https://drrobot-production.up.railway.app/api/departments');
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    setState(() {
      departments.addAll(responsebody);
    });
  }

  @override
  void initState() {
    super.initState();
    getdepartments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "التخصصات"),
      body: departments.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: departments.length,
                itemBuilder: (BuildContext context, int index) {
                  int i = index + 1;
                  return box2("${departments[index]['Aname']}", context, 'qu',
                      'https://drrobot-production.up.railway.app/api/departments/$i');
                },
              ),
            ),
    );
  }
}
