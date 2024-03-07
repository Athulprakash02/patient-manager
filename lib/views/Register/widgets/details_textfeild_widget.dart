
import 'package:flutter/material.dart';

class DetailsTextFeildWidget extends StatelessWidget {
  const DetailsTextFeildWidget({
    super.key,
    required this.size, required this.title, required this.hintText, required this.controller, required this.keyBoardType,
  });
 final Size size;
  final String title;
  final String hintText;
 
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
    
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
          fillColor: Color.fromARGB(79, 217, 217, 217),
          filled: true,
          border: OutlineInputBorder(
            
              borderRadius: BorderRadius.circular(10))),
    )
        ],
      ),
    );
  }
}
