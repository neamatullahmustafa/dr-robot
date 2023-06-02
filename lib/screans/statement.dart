import 'package:DC_Robot/screans/call_screan.dart';
import 'package:DC_Robot/screans/rosheta.dart';
import 'package:flutter/material.dart';
import '../var.dart';
import 'header_screen.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: globals.w,
        appBar: header(context, "كشف"),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 300),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: globals.r,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(blurRadius: 5)]),
            height: 60,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CallScrean(),
                    ));
              },
              child: Text(
                'بدء مكالمه',
                style: TextStyle(
                  fontSize: 20.0,
                  color: globals.w,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: globals.b,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(blurRadius: 5)]),
            height: 60,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Rosheta(),
                    ));
              },
              child: Text(
                'كتابه روشته',
                style: TextStyle(
                  fontSize: 20.0,
                  color: globals.w,
                ),
              ),
            ),
          ),
        ])));
  }
}
