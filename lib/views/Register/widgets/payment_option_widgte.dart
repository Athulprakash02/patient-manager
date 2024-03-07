
import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatefulWidget {
   PaymentOptionWidget({
    super.key,
    required this.paymentOption,
  });

   String? paymentOption;

  @override
  State<PaymentOptionWidget> createState() => _PaymentOptionWidgetState();
}

class _PaymentOptionWidgetState extends State<PaymentOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: 'Cash',
          groupValue: widget.paymentOption,
          onChanged: (value) {
            setState(() {
              widget.paymentOption = value!;
            });
          },
        ),
        const Text('Cash', style: TextStyle(fontSize: 16)),
        const SizedBox(
          width: 20,
        ),
        Radio(
          value: 'Card',
          groupValue: widget.paymentOption,
          onChanged: (value) {
            setState(() {
              widget.paymentOption = value!;
            });
          },
        ),
        const Text('Card', style: TextStyle(fontSize: 16)),
        const SizedBox(
          width: 20,
        ),
        Radio(
          value: 'UPI',
          groupValue: widget.paymentOption,
          onChanged: (value) {
            setState(() {
              widget.paymentOption = value!;
            });
          },
        ),
        const Text('UPI', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
