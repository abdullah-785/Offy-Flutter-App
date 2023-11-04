import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_practise/Components/post_review.dart';
import 'package:flutter_practise/Models/restaurants.dart';
import 'package:flutter_practise/Models/reviews.dart';
import 'package:flutter_practise/Screens/table_booking.dart';
import 'package:flutter_practise/Testing/google_map.dart';
import 'package:flutter_practise/Widgets/customer_review_widget.dart';
import 'package:flutter_practise/Widgets/simple_google_map.dart';
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
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(widget.selectedRestaurants.uid);
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              centerTitle: true,
              foregroundColor: Colors.black,
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                "Restaurant Detials",
                style: TextStyle(color: Colors.black),
              ),
              bottom: const TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.grey,
                  tabs: [
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
                    SizedBox(
                      height: 0,
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 200,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.selectedRestaurants.image.toString(),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
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
                                  Text(
                                    // widget.selectedRestaurants.rating
                                    //     .toString(),
                                    "4.5",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // Text("Reviews "),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Review ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "2",
                                            // text: widget
                                            //     .selectedRestaurants.noOfReviews
                                            //     .toString(),
                                            style: TextStyle()),
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
                                text: TextSpan(
                                  text: 'Open: ',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: widget
                                            .selectedRestaurants.openingTime
                                            .toString(),
                                        style: TextStyle()),
                                    // TextSpan(text: ' world!'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Close: ',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: widget
                                            .selectedRestaurants.closingTime
                                            .toString(),
                                        style: TextStyle()),
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
                            text: TextSpan(
                              text: widget.selectedRestaurants.avgPrice
                                  .toString(),
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: '.0', style: TextStyle()),
                                TextSpan(text: ' SAR ', style: TextStyle()),
                                TextSpan(
                                    text: "Average Price", style: TextStyle()),
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
                              Expanded(
                                  child: Text(
                                widget.selectedRestaurants.address.toString(),
                              ))
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
                              height: 180,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/map_pic.png")))
                          // SimpleGoogleMap()
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TableBooking()));
                            },
                            child: Text(
                              "Book a table",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width * 1,
                    height: 125,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(5, 5),
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 20)
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/great-for-sharing.jpg?alt=media&token=293f7b33-ee27-4f90-a7fc-e04e33d785c5&_gl=1*1330j4f*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5ODI5ODkyMS4xMS4xLjE2OTgyOTg5OTEuNTEuMC4w",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    // colorFilter: ColorFilter.mode(
                                    //     Colors.red, BlendMode.)
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => spinkit,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),

                            // Image(
                            //     fit: BoxFit.cover,
                            //     image: NetworkImage(
                            //         "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/great-for-sharing.jpg?alt=media&token=293f7b33-ee27-4f90-a7fc-e04e33d785c5&_gl=1*1330j4f*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5ODI5ODkyMS4xMS4xLjE2OTgyOTg5OTEuNTEuMC4w")),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .68,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Classic Margarita",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Text(
                                      "Tequila, lime juice, and triple sec, served on the rocks with a salt rim."),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '10',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 90,
                                      height: 28,
                                      decoration: BoxDecoration(
                                          color: InternalYellow,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "4.4",
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
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
                                        image: CachedNetworkImageProvider(
                                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg")),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Abdullah",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: PostReview(resturantsRef: docRef),
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: 110,
                                height: 35,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 240, 163, 35),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Post Review",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              // CustomerReviewsWidget(
                              //   selectedRest: widget.selectedRestaurants,
                              // ),
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Review')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }

                                  if (!snapshot.hasData) {
                                    return const Text('No data found');
                                  }

                                  final List<Review> reviews = snapshot
                                      .data!.docs
                                      .map((DocumentSnapshot document) {
                                    return Review.fromMap(document.data()
                                        as Map<String, dynamic>);
                                  }).toList();

                                  return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.width * 1,
                                    child: ListView.builder(
                                      // scrollDirection: Axis.horizontal,
                                      itemCount: reviews.length,
                                      itemBuilder: (context, index) {
                                        return CustomerReviewsWidget(
                                            reviews: reviews[index]);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
