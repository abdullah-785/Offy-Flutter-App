import 'package:flutter/material.dart';
import 'package:flutter_practise/Models/reviews.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerReviewsWidget extends StatelessWidget {
  const CustomerReviewsWidget({super.key, required this.reviews});
  final Review reviews;
  // final String review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
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
                    width: 8,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Williams Ebenezer",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)),
                      RatingBarIndicator(
                          rating: 4.4,
                          itemCount: 5,
                          itemSize: 10.0,
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 240, 163, 35),
                              )),
                    ],
                  ),
                ],
              ),
              Text(
                "Sep 13, 2023",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              textAlign: TextAlign.justify,
              reviews.review.toString(),
              style: TextStyle(fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}
