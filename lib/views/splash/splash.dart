import 'package:flutter/material.dart';
import 'package:patient_manager/main.dart';
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
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/images/splash.jpeg',
              
              fit: BoxFit.cover,
            ),
          ),
          // Align(
          //   child: Image.asset(name),
          // )
        ],
      ),
    );
  }

  Future goToHome() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
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
              builder: (context) => HomeScreen(),
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
