
import 'package:flutter/material.dart';

class LoginTextFeildWidget extends StatelessWidget {
  const LoginTextFeildWidget({
    super.key,
    required this.size, required this.title, required this.hintText, required this.obscureText, required this.controller,
  });

  final Size size;
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:size.width/16, right: size.width/16,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           title ,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
                fillColor: const Color.fromARGB(255, 239, 237, 237),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          )
        ],
      ),
    );
  }
}
