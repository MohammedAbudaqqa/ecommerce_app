import 'dart:convert';

import 'package:ecommerce_audio/constants.dart';
import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:ecommerce_audio/core/widgets/custom_button.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/product_tile_withreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

import '../view_models/cubit/fetch_product_cubit.dart';
import 'widgets/price_range_text_field.dart';
import 'widgets/shop_tile.dart';

class ExploreProductView extends StatefulWidget {
  ExploreProductView({super.key});

  @override
  State<ExploreProductView> createState() => _ExploreProductViewState();
}

class _ExploreProductViewState extends State<ExploreProductView> {
  final List<String> expolerTile = ["Popularity", "Newest", "Most Expensive"];
  final List categoryTile = [
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
  final List sortByTile = [
    [
      'Popularity',
      true,
    ],
    [
      'Newest',
      false,
    ],
    [
      'Oldest',
      false,
    ],
    [
      'High Price',
      false,
    ],
    [
      'Low Price',
      false,
    ],
    [
      'Review',
      false,
    ],
  ];

  void shopTileSelected(int index) {
    setState(() {
      for (int i = 0; i < categoryTile.length; i++) {
        categoryTile[i][1] = false;
      }

      categoryTile[index][1] = true;
    });
  }

  void sortByTileSelected(int index) {
    setState(() {
      for (int i = 0; i < sortByTile.length; i++) {
        sortByTile[i][1] = false;
      }

      sortByTile[index][1] = true;
    });
  }

  List products = [];

  Future getAllProduct() async {
    String url = "https://fakestoreapi.com/products";
    Response response = await get(Uri.parse(url));
    var body = jsonDecode(response.body);
    setState(() {
      products.addAll(body);
    });
    // print(products);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getAllProduct();
    BlocProvider.of<FetchProductCubit>(context).fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Headphone",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "TMA Wireless",
                          style: Styles.textStyle24,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 12),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.7,
                                      child: Container(
                                        padding: const EdgeInsets.all(24),
                                        //  height: 600,
                                        //color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Filter",
                                                  style: Styles.textStyle24,
                                                ),
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    context.pop();
                                                  },
                                                  icon: Icon(Icons.close),
                                                ),
                                                const SizedBox(
                                                  height: 35,
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Category",
                                              style: Styles.textStyle16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: categoryTile.length,
                                                itemBuilder: (context, index) {
                                                  return ShopTile(
                                                      function: () {
                                                        shopTileSelected(index);
                                                      },
                                                      text: categoryTile[index]
                                                          [0],
                                                      isSelected:
                                                          categoryTile[index]
                                                              [1]);
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Sort By",
                                              style: Styles.textStyle16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 100,
                                              child: GridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        mainAxisSpacing: 12,
                                                        crossAxisSpacing: 12,
                                                        childAspectRatio:
                                                            4 / 1.54,
                                                        crossAxisCount: 3),
                                                scrollDirection: Axis.vertical,
                                                itemCount: sortByTile.length,
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      sortByTileSelected(index);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    child: Center(
                                                      child: Text(
                                                        sortByTile[index][0],
                                                        style: TextStyle(
                                                          color:
                                                              sortByTile[index]
                                                                      [1]
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          style:
                                                              sortByTile[index]
                                                                      [1]
                                                                  ? BorderStyle
                                                                      .none
                                                                  : BorderStyle
                                                                      .solid,
                                                          color: Colors.grey,
                                                          width: 1,
                                                        ),
                                                        color: sortByTile[index]
                                                                [1]
                                                            ? kPrimaryColor
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 15,
                                                      vertical: 10,
                                                    ),
                                                    //TODO
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Price Range",
                                              style: Styles.textStyle16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Row(
                                              children: [
                                                PriceRangeFormField(
                                                    hintText: "Min Price"),
                                                Spacer(),
                                                PriceRangeFormField(
                                                    hintText: "Max Price"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            CustomButton(
                                                function: () {},
                                                buttonText: "Apply Filter")
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FontAwesomeIcons.sliders,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: expolerTile.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  child: Center(
                                    child: Text(
                                      expolerTile[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  ////container to test cubit
                  // Container(
                  //   child: BlocBuilder<FetchProductCubit, FetchProductState>(
                  //     builder: (BuildContext context, state) {
                  //       if (state is FetchProductSuccess) {
                  //         return Container(
                  //           height: 50,
                  //           width: 50,
                  //           color: Colors.amber,
                  //         );
                  //       } else {
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       }
                  //     },
                  //   ),
                  // )
                  ////////////////////////////////////
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF3F3F),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: BlocBuilder<FetchProductCubit, FetchProductState>(
                      builder: (context, state) {
                        print(state);
                        if (state is FetchProductSuccess) {
                          print(state);
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 24),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.7, //.6
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return ProductTileReview(
                                  image: state.products[index].image!,
                                  price: state.products[index].price!,
                                  title: state.products[index].title!,
                                  rate: state.products[index].rating!.rate!,
                                  rateCount:
                                      state.products[index].rating!.count!,
                                  // rate: "${products[index]["rating"]["rate"]}",
                                  // rateCount:
                                  //     "${products[index]["rating"]["count"]} Review",
                                  // image: "${products[index]["image"]}",
                                  // title: products[index]["title"],
                                  // price: "USD ${products[index]["price"]}",
                                );
                              },
                            ),
                          );
                        } else if (state is FetchProductFauiler) {
                          print(state);
                          return Center(
                            child: Text(
                              state.errMessage,
                              style: const TextStyle(fontSize: 28),
                            ),
                          );
                        } else {
                          print(state);
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
/*

products.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Headphone",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "TMA Wireless",
                          style: Styles.textStyle24,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 12),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.7,
                                      child: Container(
                                        padding: const EdgeInsets.all(24),
                                        //  height: 600,
                                        //color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Filter",
                                                  style: Styles.textStyle24,
                                                ),
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    context.pop();
                                                  },
                                                  icon: Icon(Icons.close),
                                                ),
                                                const SizedBox(
                                                  height: 35,
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Category",
                                              style: Styles.textStyle16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: categoryTile.length,
                                                itemBuilder: (context, index) {
                                                  return ShopTile(
                                                      function: () {
                                                        shopTileSelected(index);
                                                      },
                                                      text: categoryTile[index]
                                                          [0],
                                                      isSelected:
                                                          categoryTile[index]
                                                              [1]);
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Sort By",
                                              style: Styles.textStyle16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 100,
                                              child: GridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        mainAxisSpacing: 12,
                                                        crossAxisSpacing: 12,
                                                        childAspectRatio:
                                                            4 / 1.54,
                                                        crossAxisCount: 3),
                                                scrollDirection: Axis.vertical,
                                                itemCount: sortByTile.length,
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      sortByTileSelected(index);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    child: Center(
                                                      child: Text(
                                                        sortByTile[index][0],
                                                        style: TextStyle(
                                                          color:
                                                              sortByTile[index]
                                                                      [1]
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          style:
                                                              sortByTile[index]
                                                                      [1]
                                                                  ? BorderStyle
                                                                      .none
                                                                  : BorderStyle
                                                                      .solid,
                                                          color: Colors.grey,
                                                          width: 1,
                                                        ),
                                                        color: sortByTile[index]
                                                                [1]
                                                            ? kPrimaryColor
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 15,
                                                      vertical: 10,
                                                    ),
                                                    //TODO
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "Price Range",
                                              style: Styles.textStyle16
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Row(
                                              children: [
                                                PriceRangeFormField(
                                                    hintText: "Min Price"),
                                                Spacer(),
                                                PriceRangeFormField(
                                                    hintText: "Max Price"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 35,
                                            ),
                                            CustomButton(
                                                function: () {},
                                                buttonText: "Apply Filter")
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FontAwesomeIcons.sliders,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: expolerTile.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  child: Center(
                                    child: Text(
                                      expolerTile[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffF3F3F),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: GridView.builder(
                        shrinkWrap: true,

                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        // clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.7, //.6
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                        ),
                        ///////////////////////////////////////////////////////////////
                        itemBuilder: (context, index) {
                          return ProductTileReview(
                            rate: "${products[index]["rating"]["rate"]}",
                            rateCount:
                                "${products[index]["rating"]["count"]} Review",
                            image: "${products[index]["image"]}",
                            title: products[index]["title"],
                            price: "USD ${products[index]["price"]}",
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
 */
