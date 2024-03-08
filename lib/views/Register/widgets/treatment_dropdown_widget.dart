
import 'package:flutter/material.dart';
import 'package:patient_manager/controllers/core/constants.dart';

// ignore: must_be_immutable
class TreatmentDropDownWidget extends StatelessWidget {
   TreatmentDropDownWidget({
    super.key,
    required this.treatmentSelectedName,
  });

  String? treatmentSelectedName;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value:
          treatmentSelectedName ?? "treatment1",
      hint: const Text(
        'Choode prefered treatment',
      ),
      decoration: const InputDecoration(
          fillColor:
              Color.fromARGB(79, 217, 217, 217),
          filled: true,
          focusedBorder: OutlineInputBorder(
              // gapPadding: 0,
              borderRadius: BorderRadius.all(
                  Radius.circular(10)),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey)),
          border: OutlineInputBorder(
              // gapPadding: 0,

              borderRadius: BorderRadius.all(
                  Radius.circular(10)),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.grey))),
      items: treatments
          .map(
            (String items) => DropdownMenuItem(
              value: items,
              child: Text(items),
            ),
          )
          .toList(),
      onChanged: (value) {
        treatmentSelectedName = value;
      },
    );
  }
}
