import 'package:flutter/material.dart';
import 'package:patient_manager/views/Register/widgets/branch_drop_down_widget.dart';
import 'package:patient_manager/views/Register/widgets/details_textfeild_widget.dart';
import 'package:patient_manager/views/Register/widgets/location_drop_down_widget.dart';
import 'package:patient_manager/views/Register/widgets/treatment_details_widget.dart';

// ignore: must_be_immutable
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
  String? location;
  String? branch;
  List<String> treatmentName = ['trategget', 'hsgdvh'];
  List<int> male = [2, 3];
  List<int> female = [1, 4];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: const [Icon(Icons.notifications_none_outlined)],
        bottom: PreferredSize(
            preferredSize: Size(size.width, 40),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 16),
              child: const Row(
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
          child: Padding(
        padding: EdgeInsets.all(size.width / 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Name',
                  hintText: 'Enter your full name',
                  controller: nameTextController,
                  keyBoardType: TextInputType.name),
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Whatsapp Number',
                  hintText: 'Enter your Whatsapp number',
                  controller: whatsappNumberController,
                  keyBoardType: TextInputType.phone),
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Address',
                  hintText: 'Enter your full address',
                  controller: addressTextController,
                  keyBoardType: TextInputType.text),
              const Text(
                'Location',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              LocationDropDownWidget(location: location),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Branch',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              BranchdropDownWidget(branch: branch),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Treatments',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: treatmentName.length,
                  itemBuilder: (context, index) => TreatmentDetailsWidget(size: size, treatmentName: treatmentName, male: male, female: female,index: index,),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
