import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_practise/Widgets/date_of_Slots.dart';
import 'package:flutter_practise/Widgets/occasion_type.dart';
import 'package:flutter_practise/Widgets/restaurant_image_card.dart';
import 'package:flutter_practise/Widgets/time_slot_widget.dart';

class TableBooking extends StatefulWidget {
  const TableBooking({super.key});

  @override
  State<TableBooking> createState() => _TableBookingState();
}

class _TableBookingState extends State<TableBooking> {
  int? _value = 1;
  int? indoorOutdoorColorController;
  int? dateColorcontroller;
  int? timeColorController;

  List<String> occasionItems = ["Brithday", "Party"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Book a Table"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          const Text(
            "06:00 AM - 09:00 PM",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RestaurantItemsImageCard(
                  image:
                      "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/i1.jpg?alt=media&token=a64ea004-4ca4-407d-8bc0-4d642b5a5dfe&_gl=1*7c14tw*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5OTA4MTMzOC4yOC4xLjE2OTkwODIwMDQuNjAuMC4w",
                ),
                // RestaurantItemsImageCard(
                //   image:
                //       "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/f1.jpg?alt=media&token=af14b5e1-1b4d-4caa-b4b2-08d0ba4df666&_gl=1*1g8zhf6*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5OTA4MTMzOC4yOC4xLjE2OTkwODE1MzUuNDUuMC4w",
                // ),
                RestaurantItemsImageCard(
                  image:
                      "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/i2.jpg?alt=media&token=04efcd2a-6282-426d-96b8-b45a7adfe3c2&_gl=1*7ll47n*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5OTA4MTMzOC4yOC4xLjE2OTkwODIwNDkuMTUuMC4w",
                ),
                RestaurantItemsImageCard(
                  image:
                      "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/i4.jpg?alt=media&token=182876f8-e6a7-4f75-8e4b-b04db5e9eb64&_gl=1*16qrhho*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5OTA4MTMzOC4yOC4xLjE2OTkwODI1MTYuNjAuMC4w",
                ),
                RestaurantItemsImageCard(
                  image:
                      "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/i2.jpg?alt=media&token=04efcd2a-6282-426d-96b8-b45a7adfe3c2&_gl=1*7ll47n*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5OTA4MTMzOC4yOC4xLjE2OTkwODIwNDkuMTUuMC4w",
                ),
                RestaurantItemsImageCard(
                  image:
                      "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/i5.jpg?alt=media&token=c71e680d-ab2d-45c0-844c-df35650d3a32&_gl=1*1v751aa*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5OTA4MTMzOC4yOC4xLjE2OTkwODI3NTAuNjAuMC4w",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    indoorOutdoorColorController = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: indoorOutdoorColorController == 0
                              ? Color.fromARGB(255, 240, 163, 35)
                              : Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_dining_rounded,
                        size: 20,
                        color: indoorOutdoorColorController == 0
                            ? Color.fromARGB(255, 240, 163, 35)
                            : Colors.grey,
                      ),
                      Text(
                        "Indoor",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: indoorOutdoorColorController == 0
                              ? Color.fromARGB(255, 240, 163, 35)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indoorOutdoorColorController = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: indoorOutdoorColorController == 1
                            ? Color.fromARGB(255, 240, 163, 35)
                            : Colors.grey,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.table_bar,
                        size: 20,
                        color: indoorOutdoorColorController == 1
                            ? Color.fromARGB(255, 240, 163, 35)
                            : Colors.grey,
                      ),
                      Text(
                        "Outdoor",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: indoorOutdoorColorController == 1
                              ? Color.fromARGB(255, 240, 163, 35)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Date",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DateOfSlotsCard(),
                DateOfSlotsCard(),
                DateOfSlotsCard(),
                DateOfSlotsCard(),
                DateOfSlotsCard(),
                DateOfSlotsCard(),
                DateOfSlotsCard(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Time",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TimeSlotsCard(),
                TimeSlotsCard(),
                TimeSlotsCard(),
                TimeSlotsCard(),
                TimeSlotsCard(),
                TimeSlotsCard(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Occasion type",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                OccassionTypeCard(),
                OccassionTypeCard(),
                OccassionTypeCard(),
                OccassionTypeCard()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "5.0 SAR",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Guest",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_up_outlined)),
                      const Text("1"),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_down_outlined)),
                    ],
                  ),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 35,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 240, 163, 35)),
                  ),
                  onPressed: () {},
                  child: Text("Book now")),
            ),
          )
        ]),
      ),
    );
  }
}
