import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practise/Models/users.dart';

class Review {
  String? review;
  DateTime? date;
  DocumentReference? relatedGivingReviewUser;
  DocumentReference? relatedGettingReviewUser;

  Review(
      {this.review,
      this.date,
      this.relatedGettingReviewUser,
      this.relatedGivingReviewUser});

  factory Review.fromMap(map) {
    return Review(
      review: map['review'],
      // date: map['date'],
      // relatedGettingReviewUser: map['relatedGettingReviewUser'],
      // relatedGivingReviewUser: map['relatedGivingReviewUser'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'review': review,
      'date': date,
      'relatedGettingReviewUser': relatedGettingReviewUser,
      'relatedGivingReviewUser': relatedGivingReviewUser,
    };
  }
}
