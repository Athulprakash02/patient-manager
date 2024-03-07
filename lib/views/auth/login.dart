import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:patient_manager/views/auth/widgets/base_text_widget.dart';
import 'package:patient_manager/views/auth/widgets/login_textfeild_widget.dart';
import 'package:patient_manager/views/home/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  // height: size.height,
                  child: Image.asset(
                    'assets/images/splash.jpeg',
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/logo.png'))),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(size.width / 16),
              child: const SizedBox(
                child: Text(
                  'Login Or Register To Book Your Appointments',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            LoginTextFeildWidget(
                size: size,
                title: 'Email',
                hintText: 'Enter you email',
                obscureText: false,
                keyBoardType: TextInputType.emailAddress,
                controller: emailController),
            const SizedBox(
              height: 20,
            ),
            LoginTextFeildWidget(
                keyBoardType: TextInputType.visiblePassword,
                size: size,
                title: 'Password',
                hintText: 'Enter password',
                obscureText: true,
                controller: passwordController),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(size.width / 16),
              child: Container(
                width: double.maxFinite,
                height: 48,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 17),
                    )),
              ),
            ),
            LoginScreenBaseTextWidget(size: size)
          ],
        ),
      )),
    );
  }
}
