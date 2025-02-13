import 'package:book_heaven_app/controller/FirebaseData/firebase_data.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/login_screen.dart';
import 'package:book_heaven_app/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: GestureDetector(
          onTap: () {
            FirebaseData.logoutFromFirebase();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: CustomButton(title: "Logout"),
            ),
          )),
    );
  }
}
