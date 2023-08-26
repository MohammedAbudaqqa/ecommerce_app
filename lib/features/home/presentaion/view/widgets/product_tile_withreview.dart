import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class ProductTileReview extends StatelessWidget {
  const ProductTileReview({
    required this.image,
    super.key,
    required this.title,
    required this.price,
    required this.rate,
    required this.rateCount,
  });
  final String image;
  final String title;
  final double price;
  final double rate;
  final int rateCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.fill,
                  height: 200,
                ),
                Text(
                  title,
                  maxLines: 1,
                  style: Styles.textStyle14.copyWith(
                      letterSpacing: 2,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "$price",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xffFFDD4F),
                ),
                Text(
                  "$rate",
                  style: Styles.textStyle12,
                ),
                const Spacer(),
                // const SizedBox(
                //   width: 3,
                // ),
                Text(
                  "$rateCount",
                  style: Styles.textStyle12,
                ),
                // const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
