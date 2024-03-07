import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_manager/views/Register/register.dart';
import 'package:patient_manager/views/home/widgets/patient_details_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  final List<String> sortValues = ['Date', 'Popularity'];

  String? sortBy;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Material(
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.all(size.width / 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: size.width * .65,
                          // height: 45,
                          child: CupertinoSearchTextField(
                            placeholder: 'Search for treatments',
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                          )),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Search'))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sort by:',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      SizedBox(
                        width: size.width * .4,
                        child: DropdownButtonFormField(
                          value: sortBy ?? "Date",
                          hint: const Text(
                            'Date',
                          ),
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  // gapPadding: 0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black)),
                              border: OutlineInputBorder(
                                  // gapPadding: 0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.black))),
                          items: sortValues
                              .map(
                                (String items) => DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            sortBy = value;
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 16),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        PatientDetailWidget(size: size),
                  ))),
          Padding(
            padding: EdgeInsets.only(
                right: size.width / 16,
                left: size.width / 16,
                bottom: size.width / 16),
            child: SizedBox(
              width: size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPateinetScreen(),
                    ));
                  },
                  child: const Text('Register Now')),
            ),
          )
        ],
      ),
    );
  }
}
