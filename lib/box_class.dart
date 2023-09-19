import 'package:DC_Robot/patient/specialest_screen.dart';
import 'package:DC_Robot/patient/sympotom_screen.dart';
import 'package:flutter/material.dart';
import './screans/login.dart';
import 'patient/register_screen.dart';
import './var.dart';
import 'patient/patient_screen1.dart';

void selectScrean(BuildContext screan, String scr) {
  Widget sscr = const Login(
    thetitle: '',
    sccr: "",
    api: '',
  );
  if (scr == 'p') {
    sscr = const PatientScreen1();
  } else if (scr == 'd') {
    sscr = const Login(
      thetitle: 'الطبيب',
      sccr: 'ds',
      api: 'https://drrobot-production.up.railway.app/api/doctors/login',
    );
  } else if (scr == 'n') {
    sscr = const Login(
      thetitle: 'الممرضة',
      sccr: 'ns',
      api: 'https://drrobot-production.up.railway.app/api/nurses/login',
    );
  } else if (scr == 'pl') {
    sscr = const Login(
      thetitle: 'المريض',
      sccr: 'ps',
      api: 'https://drrobot-production.up.railway.app/api/patients/login',
    );
  } else if (scr == 'pr') {
    sscr = const RegisterScreen();
  } else if (scr == 'sp') {
    sscr = const Specialest();
  } else if (scr == 'sy') {
    sscr = const SympotomScreen();
  }
  Navigator.of(screan).push(
    MaterialPageRoute(
      builder: (scr) => sscr,
    ),
  );
}

Widget box(String photo, String address, context, String scr) {
  return Column(
    children: [
      InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => selectScrean(context, scr),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [BoxShadow(blurRadius: 5)]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                photo,
                fit: BoxFit.fill,
                width: 150,
                height: 150,
              )),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Center(
        child: Container(
          height: 50,
          color: globals.w,
          child: Text(
            address,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: globals.gb,
            ),
          ),
        ),
      ),
    ],
  );
}
