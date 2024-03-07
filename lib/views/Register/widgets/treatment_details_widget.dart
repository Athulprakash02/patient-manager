
import 'package:flutter/material.dart';
import 'package:patient_manager/views/Register/widgets/treatment_person_count_widget.dart';

class TreatmentDetailsWidget extends StatelessWidget {
  const TreatmentDetailsWidget({
    super.key,
    required this.size,
    required this.treatmentName,
    required this.male,
    required this.female, required this.index,
  });

  final Size size;
  final List<String> treatmentName;
  final List<int> male;
  final List<int> female;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(79, 217, 217, 217),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * .7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          treatmentName[index],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            TreatMentPresonCountWidget(
                              genderCount: male[index],
                              title: 'Male',
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TreatMentPresonCountWidget(
                              genderCount: female[index],
                              title: 'Female',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                        },
                        child: const CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Color(0xff006837),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
