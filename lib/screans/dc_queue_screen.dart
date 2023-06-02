import 'package:flutter/material.dart';
import 'package:DC_Robot/dc_card.dart';
import 'header_screen.dart';
import '../var.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DcQueueScreen extends StatefulWidget {
  final String api;
  const DcQueueScreen({super.key, required this.api});

  @override
  State<DcQueueScreen> createState() => _DcQueueScreenState();
}

class _DcQueueScreenState extends State<DcQueueScreen> {
  Map data = {};
  List doctors = [];
  Future getdoctors() async {
    var url = Uri.parse(widget.api);
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    setState(() {
      data.addAll(responsebody);
      doctors = data["doctors"];
    });
  }

  @override
  void initState() {
    super.initState();
    getdoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "قائمه الدكاتره"),
      body: doctors.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (BuildContext context, int index) {
                  final doctor = doctors[index]['doctor'];
                  final doctorName = doctor['name'];
                  final doctorGender = doctor['gender'];
                  final doctorImage = doctor['image'];
                  final doctorFees = doctor['fees'];
                  final doctorRate = doctor['rate'];
                  return dcCard(
                      "$doctorName",
                      "$doctorGender",
                      "$doctorImage",
                      "$doctorFees",
                      "$doctorFees",
                      "$doctorRate",
                      widget.api,
                      context);
                },
              ),
            ),
    );
  }
}
