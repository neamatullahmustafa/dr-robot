import 'package:flutter/material.dart';
import '../var.dart';
import 'contaner_nr.dart';
import '../screans/header_screen.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.w,
      appBar: header(context, 'الأجهزة الطبية'),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              conNr( 'جهاز التنفس الصناعي ورسم القلب',), 
              const SizedBox(height: 20),  
               conNr( 'أنابيب التغذية والتصريف', ),
               const SizedBox(height: 20), 
              conNr( 'القسطرة الوريدية المركزية', ),
               const SizedBox(height: 20), 
              conNr('المراقبة السريرية للمؤشرات الحيوية', ),
                ],
              ),
            ),
          ),
    
      
    );
  }
}
