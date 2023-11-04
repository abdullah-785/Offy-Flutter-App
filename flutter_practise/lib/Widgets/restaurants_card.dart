import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_practise/utils/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {super.key,
      required this.name,
      required this.level,
      required this.address,
      required this.rating,
      required this.image,
      required this.avgPrice});
  final String name;
  final String level;
  final String address;
  final String rating;
  final String image;
  final String avgPrice;

  @override
  Widget build(BuildContext context) {
    // print(level);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 135,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              offset: const Offset(3, 3),
              blurRadius: 5)
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 135,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     Colors.red, BlendMode.)
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      BlurHash(hash: "LYQ+AplVV=nj%%jDi]tR%KM}o#tl"),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),

            // Image(fit: BoxFit.cover, image: NetworkImage(image))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    level,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    address,
                    style: const TextStyle(fontSize: 11),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: avgPrice.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(text: '.0', style: TextStyle(fontSize: 10)),
                        TextSpan(text: ' SAR ', style: TextStyle(fontSize: 10)),
                        TextSpan(
                            text: "Average Price",
                            style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment:/,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border,
                              size: 14,
                              color: Colors.yellow,
                            ),
                            Text(
                              rating,
                              style: const TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.av_timer_rounded,
                              size: 14,
                              color: Colors.yellow,
                            ),
                            Text("3 hours 3 min away",
                                style: TextStyle(fontSize: 9)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
