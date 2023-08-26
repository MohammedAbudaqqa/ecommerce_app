import 'dart:convert';

import 'package:ecommerce_audio/constants.dart';
import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/fade_profile_text.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/featured_product_tile.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/shop_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List shopTile = [
    [
      'Headphone',
      true,
    ],
    [
      'Headband',
      false,
    ],
    [
      'Earpads',
      false,
    ],
    [
      'Cables',
      false,
    ],
  ];
  List categoriesList = [];

  Future getCategories() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products/categories");
    Response response = await get(url);
    var body = jsonDecode(response.body);
    setState(() {
      categoriesList.addAll(body);
    });
    print(categoriesList);
    return body;
  }

  void shopTileSelected(int index) {
    setState(() {
      for (int i = 0; i < shopTile.length; i++) {
        shopTile[i][1] = false;
      }

      shopTile[index][1] = true;
    });
  }

  @override
  void initState() {
    getCategories();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ImageIcon(
          size: 100,
          AssetImage("assets/icons/Frame 96.png"),
          color: Colors.green,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.push('/ProfileView');
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user?.photoURL ??
                    "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"),
                radius: 20.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Andrea",
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "What are you looking for today ?",
                    style: Styles.textStyle24.copyWith(letterSpacing: 2),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push("/SearchView");
                      //context.go("/SearchView");
                    },
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        hintText: "Search headphone",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ////////////////////////////
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              width: double.infinity,
              //////expanded deleted
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesList.length,
                        itemBuilder: (context, index) {
                          return ShopTile(
                            function: () {
                              shopTileSelected(index);
                            },
                            text: categoriesList[index],
                            // text: shopTile[index][0],
                            isSelected: shopTile[index][1],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/ProductDetailsView');
                      },
                      child: Container(
                        height: 201,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 24),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "TMA-2\nModular\nHeadphone",
                                    style: Styles.textStyle24,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "Shop now",
                                        style: Styles.textStyle14
                                            .copyWith(color: kPrimaryColor),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_outlined,
                                        color: kPrimaryColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 300,
                                child: Image.asset(
                                  "assets/images/headphone1.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Featured Products",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        FadeProfileText(
                          text: "See All",
                          onTap: () {
                            context.push('/ExploreProductView');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: FeaturedProductTile(
                              title: "TMA-2 HD Wireless",
                              price: "USD 350",
                              image: "assets/images/headphone1.png",
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
