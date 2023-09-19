import 'dart:convert';
import 'package:DC_Robot/screans/dc_queue_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../var.dart';

import 'header_screen.dart';

class SympotomScreen extends StatefulWidget {
  const SympotomScreen({super.key});

  @override
  State<SympotomScreen> createState() => _SympotomScreenState();
}

class _SympotomScreenState extends State<SympotomScreen> {
  final TextEditingController _typeAheadController = TextEditingController();
  List<Map<String, dynamic>> _symptoms = [];
  List<Map<String, dynamic>> _filteredSymptoms = [];
  final List<Map<String, dynamic>> _selectedSymptoms = [];

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
      appBar: header(context, 'الأعراض'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _typeAheadController,
              onChanged: _filterSymptoms,
              decoration: InputDecoration(
                hintText: '........بحث ',
                labelText: 'ادخل أعراضك',
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
                        if (_selectedSymptoms.contains(symptom)) {
                          _selectedSymptoms.remove(symptom);
                        } else {
                          _selectedSymptoms.add(symptom);
                        }
                      });
                    },
                    child: ListTile(
                      title: Text(symptom['name']),
                      trailing: _selectedSymptoms.contains(symptom)
                          ? const Icon(Icons.check)
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
                // ignore: avoid_print
                onTap: () => {
                  print(_selectedSymptoms),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DcQueueScreen(
                          api:
                              'https://drrobot-production.up.railway.app/api/departments/1',
                        ),
                      ))
                },
                child: Center(
                  child: Text(
                    'ارسال',
                    style: TextStyle(
                      color: globals.w,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
