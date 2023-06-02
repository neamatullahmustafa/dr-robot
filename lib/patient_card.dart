import 'package:DC_Robot/screans/statement.dart';
import 'package:flutter/material.dart';
import './var.dart';

Widget patientCard(
    String name, String stute, String pec, String freq, context) {
  return Container(
    decoration: BoxDecoration(
        color: globals.w,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(blurRadius: 5)]),
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 10,
    ),
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    child: Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: globals.b,
                ),
              ),
              Text(
                ' $freq',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: globals.r,
                ),
              ),
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: globals.r,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Statement(),
                        ));
                  },
                  child: Text(
                    'بدء',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: globals.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      pec,
                      fit: BoxFit.fill,
                      width: 60,
                      height: 60,
                    )),
              ),
              Text(
                'الجنس : $stute',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: globals.b,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
