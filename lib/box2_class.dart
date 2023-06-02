import 'package:DC_Robot/screans/dc_queue_screen.dart';
import 'package:flutter/material.dart';
import './var.dart';
import 'box_class.dart';

Widget box2(String address, context, String scr, String api1) {
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      InkWell(
        onTap: () => selectScrean(context, scr),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DcQueueScreen(api: api1),
              ),
            );
          },
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                color: globals.w,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [BoxShadow(blurRadius: 5)]),
            child: Center(
              child: Text(
                address,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: globals.b,
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
