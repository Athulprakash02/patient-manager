import 'package:flutter/material.dart';
import 'package:patient_manager/views/auth/widgets/base_text_widget.dart';
import 'package:patient_manager/views/auth/widgets/login_textfeild_widget.dart';

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
            Image.asset('assets/images/splash.jpeg'),
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
                controller: emailController),
            const SizedBox(
              height: 20,
            ),
            LoginTextFeildWidget(
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
                    onPressed: () {},
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

