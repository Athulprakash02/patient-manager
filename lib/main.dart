import 'package:flutter/material.dart';
import 'package:patient_manager/views/splash/splash.dart';

void main(List<String> args) {
  runApp(MyApp());
}

const userLogged = 'userLogged';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}