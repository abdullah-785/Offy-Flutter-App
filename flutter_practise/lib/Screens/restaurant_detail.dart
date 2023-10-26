import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practise/Models/restaurants.dart';
import 'package:flutter_practise/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({super.key, required this.selectedRestaurants});
  final Restaurants selectedRestaurants;

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: const Text(
                "Restaurant Detials",
              ),
              bottom: const TabBar(tabs: [
                Tab(
                  text: "Detail",
                  // icon: Icon(Icons.menu_book_rounded),
                ),
                Tab(
                  text: "Menu",
                  // icon: Icon(Icons.menu_book_rounded),
                ),
                Tab(
                  text: "Reviews",
                  // icon: Icon(Icons.menu_book_rounded),
                ),
              ])),
          body: TabBarView(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(children: [
                Column(
                  children: [
                    Stack(alignment: Alignment.bottomLeft, children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 200,
                        child: const Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/great-for-sharing.jpg?alt=media&token=293f7b33-ee27-4f90-a7fc-e04e33d785c5&_gl=1*1330j4f*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5ODI5ODkyMS4xMS4xLjE2OTgyOTg5OTEuNTEuMC4w')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 215, 172, 92)
                                .withOpacity(.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '6',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Photos  ',
                                        style: TextStyle(fontSize: 12)),
                                    // TextSpan(text: ' world!'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                                height: 13,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/imgVector.png")),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  // "The View Tab & Grill",
                                  widget.selectedRestaurants.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                              Column(
                                children: [
                                  const Text(
                                    "4.4",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // Text("Reviews "),
                                  RichText(
                                    text: const TextSpan(
                                      text: 'Review ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: '1', style: TextStyle()),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'Open: ',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '6:00 PM', style: TextStyle()),
                                    // TextSpan(text: ' world!'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Close: ',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '9:30 AM', style: TextStyle()),
                                    // TextSpan(text: ' world!'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: '15.0',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: ' SAR ', style: TextStyle()),
                                TextSpan(
                                    text: 'Average Price', style: TextStyle()),
                                // TextSpan(text: ' world!'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled_outlined,
                                size: 22,
                                color: InternalYellow,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '4',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' hours ', style: TextStyle()),
                                    TextSpan(text: '0', style: TextStyle()),
                                    TextSpan(
                                        text: ' mins away', style: TextStyle()),
                                    // TextSpan(text: ' world!'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 25,
                                color: InternalYellow,
                              ),
                              const Expanded(child: Text("Address"))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                              "Click on the marker bellow to get direction"),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              child: const Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/map_pic.png")))
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Book a table",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Order & Pickup",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            const Column(
              children: [Text("Second Tab View")],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "4.4",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                  ),
                  RatingBarIndicator(
                      rating: 4.4,
                      itemCount: 5,
                      itemSize: 24.0,
                      itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 240, 163, 35),
                          )),
                  RichText(
                    text: const TextSpan(
                      text: 'Based on ',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(text: '1', style: TextStyle(fontSize: 10)),
                        TextSpan(
                            text: ' Reviews', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 2,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rate and review",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Text("Share your experience to help others",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg")),
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Abdullah",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 35,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 240, 163, 35),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Post Review",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                height: 35,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 240, 163, 35),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  "Post Review",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const Column(
                                children: [Text("Williams Ebenezer")],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ])),
    );
  }
}
