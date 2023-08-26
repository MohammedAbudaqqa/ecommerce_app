import 'package:ecommerce_audio/constants.dart';
import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/features_body.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/overview_body.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/specifi_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_floating_button.dart';
import 'widgets/details_bar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int productSwitch = 0;
  final List productDetailsBar = [
    ["Overview", true],
    ["Features", false],
    ["Specification", false],
  ];
  List<Widget> productBody = [
    const OverviewBody(),
    const FeaturesBody(),
    const SpecifiBody(),
  ];

  void selectedDetailsBar(int index) {
    setState(() {
      for (var i = 0; i < productDetailsBar.length; i++) {
        productDetailsBar[i][1] = false;
      }
      productDetailsBar[index][1] = true;
      // if (index == 1) {
      //   context.push("/ProductFeatures");
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.push("/ShoppingCart");
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /////////////////title
                  Text(
                    "USD 350 ",
                    style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                  ),
                  const Text(
                    "TMA-2\nHD WIRELESS",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            /////////////////////////////deatails bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productDetailsBar.length,
                  itemBuilder: (context, index) {
                    return DetailsBar(
                      text: productDetailsBar[index][0],
                      isSelected: productDetailsBar[index][1],
                      function: () {
                        selectedDetailsBar(index);
                        productSwitch = index;
                      },
                    );
                  },
                ),
              ),
            ),
            productBody[productSwitch],
            /////////////////////////////Slides images

            // SizedBox(
            //   height: 400,
            //   child: ListView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding:
            //             const EdgeInsets.only(left: 20, right: 20, top: 29),
            //         child: Container(
            //           height: 400,
            //           width: 300,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Color(0xffF3F3F3),
            //             image: const DecorationImage(
            //               fit: BoxFit.cover,
            //               image: AssetImage(
            //                 "assets/images/headphone1.png",
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(24.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Review (102)",
            //             style: Styles.textStyle16
            //                 .copyWith(fontWeight: FontWeight.w400),
            //           ),
            //           const SizedBox(
            //             height: 24,
            //           ),
            //           /////////////////////////////Slides reviews

            //           SizedBox(
            //             child: ListView.builder(
            //               physics: const NeverScrollableScrollPhysics(),
            //               shrinkWrap: true,
            //               scrollDirection: Axis.vertical,
            //               itemCount: 3,
            //               itemBuilder: (context, index) {
            //                 return CustomerReview();
            //               },
            //             ),
            //           ),
            //           Center(
            //             child: FadeProfileText(
            //               text: "See all review",
            //               onTap: () {},
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 30,
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       height: 400,
            //       color: Color(0xffF6F6F6),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(
            //                 vertical: 12, horizontal: 24),
            //             child: Row(
            //               children: [
            //                 ProfileText(
            //                   text: "Another product",
            //                   onTap: () {/**Coming Soon */},
            //                 ),
            //                 const Spacer(),
            //                 FadeProfileText(
            //                   text: "See all",
            //                   onTap: () {/**Coming Soon */},
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 24),
            //             child: SizedBox(
            //               height: 300,
            //               child: ListView.builder(
            //                 physics: BouncingScrollPhysics(),
            //                 scrollDirection: Axis.horizontal,
            //                 itemCount: 3,
            //                 itemBuilder: (context, index) {
            //                   return const Padding(
            //                     padding: EdgeInsets.only(right: 16),
            //                     child: FeaturedProductTile(
            //                       title: "TMA-2 HD Wireless",
            //                       price: "USD 350",
            //                       image: "assets/images/headphone1.png",
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 100,
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      /////floating action button
      floatingActionButton: const CustomFloatingButton(
        text: "Add to Cart ",
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
