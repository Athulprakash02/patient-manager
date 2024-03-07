
import 'package:flutter/material.dart';

class TreatMentPresonCountWidget extends StatelessWidget {
  const TreatMentPresonCountWidget({
    super.key,
    required this.genderCount,
    required this.title,
  });

  final int genderCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Color(0xff006837)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          width: 30,
          height: 20,
          child: Center(
              child: Text(
            genderCount.toString(),
            style: const TextStyle(color: Color(0xff006837), fontSize: 16),
          )),
        )
      ],
    );
  }
}
