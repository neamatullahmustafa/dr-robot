
import 'package:flutter/material.dart';
import '../var.dart';
import 'contaner_nr.dart';
import '../screans/header_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Ta7lelNr extends StatefulWidget {
  final String api;
  const Ta7lelNr({super.key, required this.api});

  @override
  State<Ta7lelNr> createState() => _Ta7lelNrState();
}

class _Ta7lelNrState extends State<Ta7lelNr> {
   List ta7alel = [];
  Future getta7alel() async {
    var url = Uri.parse(widget.api);
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
  
    setState(() {
      
  ta7alel.addAll(responsebody);
   
     
    });
  }

  @override
  void initState() {
    super.initState();
    getta7alel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, 'التحاليل المطلوبة'),
      body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: ta7alel.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: ta7alel.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ta7lel = ta7alel[index]['Analysis'];
                    return conNr(ta7lel);
                  },
                ),
              ),
      ),
    );
  }
}
