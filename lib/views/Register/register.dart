import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_manager/views/Register/widgets/branch_drop_down_widget.dart';
import 'package:patient_manager/views/Register/widgets/details_textfeild_widget.dart';
import 'package:patient_manager/views/Register/widgets/location_drop_down_widget.dart';
import 'package:patient_manager/views/Register/widgets/payment_option_widgte.dart';
import 'package:patient_manager/views/Register/widgets/treatment_dropdown_widget.dart';
import 'package:patient_manager/views/Register/widgets/treatment_details_widget.dart';
import 'package:patient_manager/views/Register/widgets/treatment_time_widget.dart';

// ignore: must_be_immutable
class RegisterPateinetScreen extends StatefulWidget {
  const RegisterPateinetScreen({super.key});

  @override
  State<RegisterPateinetScreen> createState() => _RegisterPateinetScreenState();
}

class _RegisterPateinetScreenState extends State<RegisterPateinetScreen> {
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
  final TextEditingController treatmentDateController = TextEditingController();

  String? location;
  String? treatmentSelectedName;
  int maleCount = 0;
  int femaleCount = 0;

  String? branch;
  String? paymentOption;
  String? treatmentHour;
  String? treatmentMinute;

  List<String> treatmentName = ['trategget', 'hsgdvh'];

  List<int> male = [2, 3];

  List<int> female = [1, 4];
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
        treatmentDateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
          )
        ],
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
                  itemBuilder: (context, index) => TreatmentDetailsWidget(
                    size: size,
                    treatmentName: treatmentName,
                    male: male,
                    female: female,
                    index: index,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            width: size.width * .7,
                            height: size.width*.85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 16,
                                  vertical: size.width / 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Choose Treatment',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  TreatmentDropDownWidget(
                                      treatmentSelectedName:
                                          treatmentSelectedName),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    'Add Patients',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  AddPatientsWidget(
                                    size: size,
                                    maleCount: maleCount,
                                    gender: 'Male',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  AddPatientsWidget(
                                    size: size,
                                    maleCount: femaleCount,
                                    gender: 'Female',
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: ElevatedButton(
                                        onPressed: () {}, child: const Text('Save')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('+ Add Treatments'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Total Amount',
                  hintText: '',
                  controller: totalAmountyTextController,
                  keyBoardType: TextInputType.number),
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Discount Amount',
                  hintText: '',
                  controller: discountAmountTextController,
                  keyBoardType: TextInputType.number),
              const Text(
                'Payment Option',
                style: TextStyle(fontSize: 16),
              ),
              PaymentOptionWidget(paymentOption: paymentOption),
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Advance Amount',
                  hintText: '',
                  controller: advanceAmountTextController,
                  keyBoardType: TextInputType.number),
              DetailsTextFeildWidget(
                  size: size,
                  title: 'Balance Amount',
                  hintText: '',
                  controller: balanceAmountTextController,
                  keyBoardType: TextInputType.number),
              const Text(
                'Treatment Date',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: treatmentDateController,
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: const Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xff006837),
                        )),
                    fillColor: const Color.fromARGB(79, 217, 217, 217),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Treatment Time',
                style: TextStyle(fontSize: 16),
              ),
              TreatMentTimeWidget(
                  size: size,
                  treatmentHour: treatmentHour,
                  treatmentMinute: treatmentMinute),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text('Save')),
              )
            ],
          ),
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class AddPatientsWidget extends StatelessWidget {
  AddPatientsWidget({
    super.key,
    required this.size,
    required this.maleCount,
    required this.gender,
  });

  final Size size;
  int maleCount;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * .25,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            gender,
            textAlign: TextAlign.left,
          )),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: const Color(0xff006837),
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 40,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                maleCount.toString(),
                style: const TextStyle(fontSize: 16),
              )),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 13,
                backgroundColor: Color(0xff006837),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
