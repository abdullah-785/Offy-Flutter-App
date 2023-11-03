import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/Models/restaurants.dart';
import 'package:flutter_practise/Models/reviews.dart';
import 'package:flutter_practise/Models/users.dart';
import 'package:flutter_practise/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Models/users.dart';
import 'package:intl/intl.dart';

class PostReview extends StatefulWidget {
  PostReview({super.key, required this.resturantsRef});
  DocumentReference resturantsRef;

  @override
  State<PostReview> createState() => _PostReviewState();
}

class _PostReviewState extends State<PostReview> {
  TextEditingController _reviewController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 250,
      child: Column(
        children: [
          Text(
            "Post Review",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          // RatingBar(ratingWidget: Icon(Icons.star), onRatingUpdate: onRatingUpdate)
          SizedBox(
            height: 30,
          ),
          RatingBarIndicator(
            rating: 4.5,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 24.0,
            direction: Axis.horizontal,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _reviewController,
            maxLines: 3,
            minLines: 3,
            decoration: InputDecoration(
                helperStyle: TextStyle(fontSize: 12),
                hintText: "Post Review Here",
                border: OutlineInputBorder()),
          ),
          Spacer(),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 240, 163, 35),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    String currentUserUID = _auth.currentUser!.uid;
                    DocumentReference userDocumentRef = FirebaseFirestore
                        .instance
                        .collection('users')
                        .doc(currentUserUID);

                    // DateFormat.yMMMEd().format(DateTime.now());

                    Review reviewDoc = Review();
                    // String currentDate =
                    //     DateFormat.yMMMEd().format(DateTime.now());
                    reviewDoc.review = _reviewController.text;
                    reviewDoc.relatedGivingReviewUser = userDocumentRef;
                    reviewDoc.relatedGettingReviewUser = widget.resturantsRef;
                    // reviewDoc.date = currentDate as DateTime?;

                    FirebaseFirestore.instance
                        .collection("Review")
                        .doc()
                        .set(reviewDoc.toMap());

                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pop(context);
                  },
                  child: isLoading ? spinkit : Text("POST")))
        ],
      ),
    );
  }
}
