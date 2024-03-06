
import 'package:flutter/material.dart';

class LoginScreenBaseTextWidget extends StatelessWidget {
  const LoginScreenBaseTextWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width / 16),
      child: SizedBox(
        width: double.maxFinite,
        child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  text:
                      'By creating or logging into an account you are agreeing with our '),
              TextSpan(
                  style: TextStyle(
                      color: Color(0xFF0028FC),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  text: 'Terms and Conditions '),
              TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  text: 'and '),
              TextSpan(
                  style: TextStyle(
                      color: Color(0xFF0028FC),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  text: 'Privacy Policy.'),
            ])),
      ),
    );
  }
}