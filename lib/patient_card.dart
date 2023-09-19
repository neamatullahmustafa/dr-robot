
import 'package:DC_Robot/nurse/prescription_nr.dart';
import 'package:DC_Robot/doctor/statement.dart';
import 'package:flutter/material.dart';
import 'var.dart';

void select3Screan(BuildContext screan, String scr, int id1, int id2 ,String api2) {
  Widget sscr =   Statement(
      apip: id1, apid: id2, api1: api2,
    
  );
  if (scr == 'ds') {
    sscr = Statement(
      apip: id1, apid: id2, api1: api2,
    );
  } else if (scr == 'ns') {
    sscr = RoshetaRead(
      varapi: id1,
    );
  }
  Navigator.of(screan).push(
    MaterialPageRoute(
      builder: (scr) => sscr,
    ),
  );
}

Widget patientCard(String lname, String fname, String gen, String pec, String age,
    context, String scr, int paid, String medhes, int dcid ,String apii) {
  return Container(
    decoration: BoxDecoration(
        color: globals.w,
        borderRadius: BorderRadius.circular(10),
        boxShadow:  [BoxShadow(blurRadius: 5,color:globals.b )]),
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
                ' الإسم / $fname $lname',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: globals.r,
                ),
              ),
              Text(
                medhes,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: globals.gb,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: globals.r,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 30,
                      child: MaterialButton(
                        onPressed: () =>
                            select3Screan(context, scr, paid, dcid,apii),
                        child: Text(
                          'بدء',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: globals.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                ' السن: $age',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: globals.gb,
                ),
              ),
              Text(
                'الجنس : $gen',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: globals.gb,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
