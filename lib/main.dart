import 'package:DC_Robot/screans/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DC_Robot());
}

// ignore: camel_case_typessss
class DC_Robot extends StatelessWidget {
  const DC_Robot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const MySplashScreen(),
      },
    );
  }
}
