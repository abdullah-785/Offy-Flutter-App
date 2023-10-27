import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/Models/restaurants.dart';
import 'package:flutter_practise/Screens/login.dart';
import 'package:flutter_practise/Screens/restaurant_detail.dart';
import 'package:flutter_practise/Widgets/categories_widget.dart';
import 'package:flutter_practise/Widgets/restaurants_card.dart';
import 'package:flutter_practise/Widgets/simple_google_map.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final unfocusNode = FocusNode();

  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    unfocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10.0),
                        labelStyle: const TextStyle(fontSize: 12),
                        label: const Text("Search"),
                        suffix: const Icon(
                          Icons.search_rounded,
                          size: 22,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    autofocus: false,
                  ),
                  // Text(),
                  const SizedBox(
                    height: 15,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Offers",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 220,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 40),
                                child: PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg?alt=media&token=e86757df-5cc1-4462-91e2-264d814e2e12&_gl=1*1dt0f0l*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5ODI5ODkyMS4xMS4xLjE2OTgyOTg5NDAuNDEuMC4w',
                                        width: 300,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/great-for-sharing.jpg?alt=media&token=293f7b33-ee27-4f90-a7fc-e04e33d785c5&_gl=1*1330j4f*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5ODI5ODkyMS4xMS4xLjE2OTgyOTg5OTEuNTEuMC4w',
                                        width: 300,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D',
                                        width: 300,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.00, 1.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 16),
                                  child: SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await pageViewController!.animateToPage(
                                        i,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: const ExpandingDotsEffect(
                                      expansionFactor: 3,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 8,
                                      dotColor: Colors.grey,
                                      activeDotColor: Colors.purple,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CategoriesWidget(
                              iconBtn: Icons.coffee_outlined,
                              textData: "Coffee",
                              boxColor: Color.fromARGB(255, 164, 89, 118),
                            ),
                            CategoriesWidget(
                              iconBtn: Icons.food_bank_outlined,
                              textData: "Food",
                              boxColor: Color.fromARGB(255, 111, 202, 213),
                            ),
                            CategoriesWidget(
                              iconBtn: Icons.cake,
                              textData: "Bakes",
                              boxColor: Color.fromARGB(255, 235, 122, 132),
                            ),
                            CategoriesWidget(
                              iconBtn: Icons.local_drink_outlined,
                              textData: "Drinks",
                              boxColor: Color.fromARGB(255, 63, 111, 125),
                            ),
                            CategoriesWidget(
                              iconBtn: Icons.outdoor_grill_outlined,
                              textData: "Outdoor",
                              boxColor: Color.fromARGB(255, 240, 163, 34),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Restaurants",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Restaurants')
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

                            final List<Restaurants> restaurants = snapshot
                                .data!.docs
                                .map((DocumentSnapshot document) {
                              return Restaurants.fromMap(
                                  document.data() as Map<String, dynamic>);
                            }).toList();

                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurants.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // When a document is tapped, navigate to the next page and pass the selected task as a parameter.
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RestaurantDetail(
                                                  selectedRestaurants:
                                                      restaurants[index]),
                                        ),
                                      );
                                    },
                                    // restaurants[index].name.toString()
                                    child: RestaurantCard(
                                      name: restaurants[index].name.toString(),
                                      level:
                                          restaurants[index].level.toString(),
                                      address:
                                          restaurants[index].address.toString(),
                                      // image: "https://firebasestorage.googleapis.com/v0/b/flutterpractise-6898a.appspot.com/o/great-for-sharing.jpg?alt=media&token=293f7b33-ee27-4f90-a7fc-e04e33d785c5&_gl=1*1if6bym*_ga*MTIxMjcyNzYwNy4xNjk4MTI2MzMz*_ga_CW55HF8NVT*MTY5ODIxMTkwNC43LjEuMTY5ODIxNDAxNy4zNS4wLjA.",
                                      image:
                                          restaurants[index].image.toString(),
                                      rating:
                                          restaurants[index].level.toString(),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Coffee Shops",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text("View All", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('CoffeeShop')
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

                            final List<Restaurants> restaurants = snapshot
                                .data!.docs
                                .map((DocumentSnapshot document) {
                              return Restaurants.fromMap(
                                  document.data() as Map<String, dynamic>);
                            }).toList();

                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurants.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // When a document is tapped, navigate to the next page and pass the selected task as a parameter.
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RestaurantDetail(
                                                  selectedRestaurants:
                                                      restaurants[index]),
                                        ),
                                      );
                                    },
                                    // restaurants[index].name.toString()
                                    child: RestaurantCard(
                                      name: restaurants[index].name.toString(),
                                      level:
                                          restaurants[index].level.toString(),
                                      address:
                                          restaurants[index].address.toString(),
                                      // image: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D",
                                      image:
                                          restaurants[index].image.toString(),
                                      rating:
                                          restaurants[index].level.toString(),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
