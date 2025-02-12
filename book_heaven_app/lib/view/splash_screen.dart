import 'dart:developer';
import 'package:book_heaven_app/controller/SharedPrefernceData/session_data.dart';
import 'package:book_heaven_app/view/navbar_screen.dart';
import 'package:book_heaven_app/view/onboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      await SessionData.getSessiondata();

      log("${SessionData.isLogin}");

      ///CHECK USER IS ALREADY LOGGED IN
      ///IF YES NAVIGATE TO HOMESCREEN ELSE LOGINSCREEN
      if (SessionData.isLogin!) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NavbarScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardScreen()));
      }
    });

    return Scaffold(
      backgroundColor: const Color.fromRGBO(74, 138, 196, 1),
      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
