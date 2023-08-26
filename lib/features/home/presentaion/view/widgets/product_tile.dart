import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.8 / 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/images/headphone1.png"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .65,
                    child: Text(
                      "TMA-2 Comfort Wireless",
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "USD 270",
                    style: Styles.textStyle14.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xffFFDD4F),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        "4.8",
                        style: Styles.textStyle12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "86 Reviews",
                        style: Styles.textStyle12,
                      ),
                      const Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
