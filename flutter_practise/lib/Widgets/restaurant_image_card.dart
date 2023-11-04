import 'package:flutter/material.dart';

class RestaurantItemsImageCard extends StatelessWidget {
  const RestaurantItemsImageCard({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        width: 70,
        height: 75,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(fit: BoxFit.cover, image: NetworkImage(image)),
        ),
      ),
    );
  }
}
