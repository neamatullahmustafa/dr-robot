import 'package:flutter/material.dart';
import '../var.dart';
import 'contaner_nr.dart';
import '../screans/header_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DwaNr extends StatefulWidget {
  final String api;
  const DwaNr({super.key, required this.api});

  @override
  State<DwaNr> createState() => _DwaNrState();
}

class _DwaNrState extends State<DwaNr> {
  List dwa = [];
  Future getdwa() async {
    var url = Uri.parse(widget.api);
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      dwa.addAll(responsebody);
      
    });
  }

  @override
  void initState() {
    super.initState();
    getdwa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "عقارات طبية"),
      body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: dwa.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: dwa.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dwa2 = dwa[index]['Medicine'];
                    return conNr(dwa2);
                  },
                ),
              ),
      ),
    );
    
  }
}
