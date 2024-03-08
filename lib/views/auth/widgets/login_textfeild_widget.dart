
import 'package:flutter/material.dart';

class LoginTextFeildWidget extends StatelessWidget {
  const LoginTextFeildWidget({
    super.key,
    required this.size, required this.title, required this.hintText, required this.obscureText, required this.controller, required this.keyBoardType,
  });

  final Size size;
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  

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
          TextFormField(
            keyboardType: keyBoardType,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
                fillColor: const Color.fromARGB(79, 217, 217, 217),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
                    // ignore: body_might_complete_normally_nullable
                    validator: (value) {
                      if(controller.text.isEmpty){
                        return 'Please Enter valid Details';
                      }
                    },
          )
        ],
      ),
    );
  }
}
