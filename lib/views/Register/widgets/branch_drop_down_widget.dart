
import 'package:flutter/material.dart';
import 'package:patient_manager/controllers/core/constants.dart';

// ignore: must_be_immutable
class BranchdropDownWidget extends StatelessWidget {
   BranchdropDownWidget({
    super.key,
    required this.branch,
  });

   String? branch;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: branch ?? "palakkad",
      hint: const Text(
        'Select the branch',
      ),
      decoration: const InputDecoration(
          fillColor: Color.fromARGB(79, 217, 217, 217),
          filled: true,
          focusedBorder: OutlineInputBorder(
              // gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.grey)),
          border: OutlineInputBorder(
              // gapPadding: 0,

              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.grey))),
      items: branches
          .map(
            (String items) => DropdownMenuItem(
              value: items,
              child: Text(items),
            ),
          )
          .toList(),
      onChanged: (value) {
        branch = value;
      },
    );
  }
}
