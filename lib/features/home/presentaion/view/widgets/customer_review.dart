import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/profile10.jpeg"),
                ),
              ],
            ),
            const SizedBox(
              width: 13,
            ),
            Flexible(
              child: Column(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Madelina",
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
