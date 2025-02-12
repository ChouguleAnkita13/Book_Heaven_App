import 'package:book_heaven_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAKkwXw_ElnunWjGUuDgi1YR3sH3X6rNVw",
        appId: "1:595552014805:android:42b812787537a8b8cead5c",
        messagingSenderId: "595552014805",
        projectId: "book-heaven-e1bba"),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
