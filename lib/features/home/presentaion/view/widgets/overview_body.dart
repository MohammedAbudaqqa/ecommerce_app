import 'package:ecommerce_audio/features/home/presentaion/view/widgets/customer_review.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/fade_profile_text.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/featured_product_tile.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/profile_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class OverviewBody extends StatelessWidget {
  const OverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 29),
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF3F3F3),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/headphone1.png",
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Review (102)",
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  /////////////////////////////Slides reviews

                  SizedBox(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return CustomerReview();
                      },
                    ),
                  ),
                  Center(
                    child: FadeProfileText(
                      text: "See all review",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              color: Color(0xffF6F6F6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: Row(
                      children: [
                        ProfileText(
                          text: "Another product",
                          onTap: () {/**Coming Soon */},
                        ),
                        const Spacer(),
                        FadeProfileText(
                          text: "See all",
                          onTap: () {/**Coming Soon */},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: FeaturedProductTile(
                              title: "TMA-2 HD Wireless",
                              price: "USD 350",
                              image: "assets/images/headphone1.png",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ],
    );
  }
}
