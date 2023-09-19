// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:DC_Robot/patient/patient_screen2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../var.dart';
import 'dc_queue_screen.dart';
import '../screans/header_screen.dart';

int spec(String name) {
  int number = 0;
  if (name.compareTo('Ophthalmology') == 1) {
    number = 1;
  } else if (name.compareTo('Ophthalmology') == 1) {
    number = 2;
  } else if (name.compareTo('Department_of_Psychiatry_and_Neurology') == 1) {
    number = 3;
  } else if (name.compareTo('Department_of_Urology') == 1) {
    number = 4;
  } else if (name.compareTo('Department_of_Brain_and_Nerves') == 1) {
    number = 5;
  } else if (name.compareTo('Orthopedic') == 1) {
    number = 6;
  } else if (name.compareTo('Respiratory_or_chest_diseases') == 1) {
    number = 7;
  } else if (name.compareTo('dermatology') == 1) {
    number = 8;
  } else if (name.compareTo('Internal_diseases_specialty') == 1) {
    number = 9;
  } else if (name.compareTo('Ear,nose_and_throat_specialty') == 1) {
    number = 10;
  } else if (name.compareTo('dental') == 1) {
    number = 11;
  } else if (name.compareTo('Gynecology_specialty') == 1) {
    number = 12;
  }
  return number;
}

class SympotomScreen extends StatefulWidget {
  const SympotomScreen({super.key});

  @override
  State<SympotomScreen> createState() => _SympotomScreenState();
}

class _SympotomScreenState extends State<SympotomScreen> {
  final TextEditingController _typeAheadController = TextEditingController();
  List<Map<String, dynamic>> _symptoms = [];
  List<Map<String, dynamic>> _filteredSymptoms = [];
  final List<String> _selectedSymptomsNames = [];

  @override
  void initState() {
    super.initState();
    _fetchSymptoms();
  }

  Future<void> _fetchSymptoms() async {
    final response = await http.get(
        Uri.parse('https://drrobot-production.up.railway.app/api/symptoms'));

    if (response.statusCode == 200) {
      setState(() {
        _symptoms = jsonDecode(response.body).cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to fetch symptoms');
    }
  }

  void _filterSymptoms(String query) {
    setState(() {
      _filteredSymptoms = _symptoms
          .where((symptom) => symptom['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, "الأعراض المرضية"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _typeAheadController,
              cursorColor: globals.gb,
              style: TextStyle(
                color: globals.gb,
              ),
              onChanged: _filterSymptoms,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: globals.b)),
                hintText: ' بحث',
                labelText: "أدخل أعراضك",
                labelStyle: TextStyle(
                  color: globals.gb,
                ),
                focusColor: globals.gb,
                fillColor: globals.gb,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredSymptoms.length,
                itemBuilder: (context, index) {
                  final symptom = _filteredSymptoms[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        final symptomName = symptom['name'];
                        if (_selectedSymptomsNames.contains(symptomName)) {
                          _selectedSymptomsNames.remove(symptomName);
                        } else {
                          _selectedSymptomsNames.add(symptomName);
                        }
                      });
                    },
                    child: ListTile(
                      title: Text(
                        symptom['name'],
                        style: TextStyle(color: globals.gb),
                      ),
                      trailing: _selectedSymptomsNames.contains(symptom['name'])
                          ? Icon(Icons.check, color: globals.gb)
                          : const SizedBox.shrink(),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: globals.r,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 5)]),
              height: 40.0,
              child: InkWell(
                onTap: () async {
                  const url = 'http://submitted-cfr.at.ply.gg:25472/result';
                  final headers = {'Content-Type': 'application/json'};
                  final queryString = _selectedSymptomsNames.join(',');
                  final data = jsonEncode({"symptoms": queryString});

                  final response = await http.post(Uri.parse(url),
                      headers: headers, body: data);

                  print(response.body);

                  if (response.statusCode == 200) {
                    // Success: do something with the response
                    print('Selected symptoms sent successfully!');
                  } else {
                    // Error: handle the error
                    print(
                        'Error sending selected symptoms: ${response.reasonPhrase}');
                  }
                  int urll = spec(response.body);
                  // ignore: use_build_context_synchronously
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: globals.w,
                            title: Text(
                              "المتوقع",
                              style: TextStyle(color: globals.gb),
                            ),
                            content: Text(response.body,   style: TextStyle(color: globals.gb),),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DcQueueScreen(
                                              api:
                                                  'https://drrobot-production.up.railway.app/api/departments/$urll'),
                                        ));
                                  },
                                  child: Text(
                                    "الذهاب إلى قائمة الأطباء",
                                    style: TextStyle(color: globals.gb),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PatientScreen2()),
                                    );
                                  },
                                  child: Text(
                                    "غلق",
                                    style: TextStyle(color: globals.gb),
                                  ))
                            ],
                          ));
                  // Clear the selected symptoms
                  setState(() {
                    _selectedSymptomsNames.clear();
                  });
                },
                child: Center(
                  child: Text(
                    'إرسال',
                    style: TextStyle(
                      color: globals.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
