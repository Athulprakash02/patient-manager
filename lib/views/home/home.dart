import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      ElevatedButton(onPressed: () {}, child: const Text('Search'))
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
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Register Now')),
            ),
          )
        ],
      ),
    );
  }
}

class PatientDetailWidget extends StatelessWidget {
  const PatientDetailWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: const Color(0xFFf1f1f1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width / 16,
                  right: size.width / 16,
                  top: size.width / 16,
                  bottom: 5),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(
                        'couple combo pacja=kage',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff006837)),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 16,
                            color: Colors.red,
                          ),
                          Text('31/10/2023'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.group_outlined,
                            size: 16,
                            color: Colors.red,
                          ),
                          Text('jitheesh'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Booking details',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
