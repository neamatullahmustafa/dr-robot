import 'package:flutter/material.dart';
import '../var.dart';
import 'contaner_nr.dart';
import '../screans/header_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class E4a3aNr extends StatefulWidget {
    final String api;
  const E4a3aNr({super.key, required this.api});

  @override
  State<E4a3aNr> createState() => _E4a3aNrState();
}

class _E4a3aNrState extends State<E4a3aNr> { List e4a3a = [];
  Future getE4a3a() async {
    var url = Uri.parse(widget.api);
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      e4a3a.addAll(responsebody);
      
    });
  }

  @override
  void initState() {
    super.initState();
    getE4a3a();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, 'طلب الأشعة'),
      body:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
        child: e4a3a.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: e4a3a.length,
                  itemBuilder: (BuildContext context, int index) {
                    final e4a3at = e4a3a[index]['X_Ray'];
                    return conNr(e4a3at);
                  },
                ),
              ),
      ),
    );
  }
}