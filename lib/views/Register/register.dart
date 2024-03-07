import 'package:flutter/material.dart';
import 'package:patient_manager/views/Register/widgets/details_textfeild_widget.dart';

class RegisterPateinetScreen extends StatelessWidget {
  RegisterPateinetScreen({super.key});
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController totalAmountyTextController =
      TextEditingController();
  final TextEditingController discountAmountTextController =
      TextEditingController();
  final TextEditingController advanceAmountTextController =
      TextEditingController();
  final TextEditingController balanceAmountTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [Icon(Icons.notifications_none_outlined)],
        bottom: PreferredSize(
            preferredSize: Size(size.width, 40),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 16),
              child: Row(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          DetailsTextFeildWidget(
              size: size,
              title: 'Name',
              hintText: 'Enter your full name',
              controller: nameTextController,
              keyBoardType: TextInputType.name)
        ],
      )),
    );
  }
}
