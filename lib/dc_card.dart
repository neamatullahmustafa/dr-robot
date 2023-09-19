import 'package:DC_Robot/screans/dc_queue_screen.dart';
import 'package:DC_Robot/screans/patient_screen2.dart';
import 'package:flutter/material.dart';
import './var.dart';

Widget dcCard(String name, String gender, String pec, String price, String time,
    String rate, String api2, context) {
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
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        'السعر : $price',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: globals.b,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        ' تقييم : $rate',
                        style: TextStyle(
                          fontSize: 15,
                          color: globals.b,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("حجز"),
                                      content:
                                          const Text("هل تريد تأكيد الحجز؟"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()),
                                              );
                                            },
                                            child: const Text("تأكيد")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DcQueueScreen(
                                                          api: api2,
                                                        )),
                                              );
                                            },
                                            child: const Text("غلق"))
                                      ],
                                    ));
                          },
                          child: Text(
                            'حجز',
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
            )),
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
                    child: Image(
                      image: NetworkImage(pec),
                      fit: BoxFit.fill,
                      width: 60,
                      height: 60,
                    )),
              ),
              Text(
                "متاح من الساعه $time",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: globals.r,
                ),
              ),
              Text(
                'الجنس : $gender',
                style: TextStyle(
                  fontSize: 10,
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
