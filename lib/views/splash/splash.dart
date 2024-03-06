import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:patient_manager/main.dart';
import 'package:patient_manager/views/auth/login.dart';
import 'package:patient_manager/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // goToHome();
    goToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/images/splash.jpeg',
              
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
                
              ),
            ),
          )
        ],
      ),
    );
  }

  Future goToHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      },
    );
  }
   Future goToLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      },
    );
  }

  Future checkUSerLoggedIn() async{
    final userSharedPref = await SharedPreferences.getInstance();
    final userLoggedIn = userSharedPref.getBool(userLogged);

    if(userLoggedIn == null || userLoggedIn == false){
      
    } else{
      goToHome();
    }
  }
}
