
import 'package:flutter/material.dart';
import 'package:patient_manager/controllers/core/constants.dart';

// ignore: must_be_immutable
class TreatMentTimeWidget extends StatelessWidget {
   TreatMentTimeWidget({
    super.key,
    required this.size,
    required this.treatmentHour,
    required this.treatmentMinute,
  });

  final Size size;
  String? treatmentHour;
  String? treatmentMinute;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * .43,
          child: DropdownButtonFormField(
            value: treatmentHour ?? "09",
            hint: const Text(
              'Hour',
            ),
            decoration: const InputDecoration(
                fillColor: Color.fromARGB(79, 217, 217, 217),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    // gapPadding: 0,
                    borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey)),
                border: OutlineInputBorder(
                    // gapPadding: 0,

                    borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey))),
            items: treatmentTimeHours
                .map(
                  (String items) => DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  ),
                )
                .toList(),
            onChanged: (value) {
              treatmentHour = value;
            },
          ),
        ),
        SizedBox(
          width: size.width * .43,
          child: DropdownButtonFormField(
            value: treatmentMinute ?? "00",
            hint: const Text(
              'Minutes',
            ),
            decoration: const InputDecoration(
                fillColor: Color.fromARGB(79, 217, 217, 217),
                filled: true,
                focusedBorder: OutlineInputBorder(
                    // gapPadding: 0,
                    borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey)),
                border: OutlineInputBorder(
                    // gapPadding: 0,

                    borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey))),
            items: treatmentTimeMinutes
                .map(
                  (String items) => DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  ),
                )
                .toList(),
            onChanged: (value) {
              treatmentMinute = value;
            },
          ),
        )
      ],
    );
  }
}
