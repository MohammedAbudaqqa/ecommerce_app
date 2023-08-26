import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class FeaturedProductTile extends StatelessWidget {
  const FeaturedProductTile({
    required this.image,
    super.key,
    required this.title,
    required this.price,
  });
  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                  Text(
                    title,
                    style: Styles.textStyle14.copyWith(
                        letterSpacing: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
