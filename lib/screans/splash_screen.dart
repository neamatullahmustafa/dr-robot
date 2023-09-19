import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../var.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      loaderColor: globals.r,
      logo: const Image(
        image: AssetImage("images/DC Ro.png"),
        height: 500,
        width: 500,
      ),
      title: const Text(
        "د/ ربيع",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      showLoader: true,
      loadingText: const Text("تحميل..."),
      navigator: const HomePage(),
      durationInSeconds: 3,
    );
  }
}
