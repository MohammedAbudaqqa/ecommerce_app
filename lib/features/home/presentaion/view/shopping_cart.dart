import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_floating_button.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shopping Cart",
          style: Styles.textStyle16.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 35),
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child:
                        Image.asset("assets/images/headphone1.png", height: 70),
                  ),
                  //////added
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "TMA-2 Comfort Wireless ",
                            style: Styles.textStyle16,
                          ),
                          const Text(
                            "USD 270",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xffBABABA),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                child: Text("1"),
                              ),
                              GestureDetector(
                                child: Container(
                                  //  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xffBABABA),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                              ),
                              // Spacer(flex: 1),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      //Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline_rounded)),
                      )
                    ],
                  ),
                  // Spacer(),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.delete_outline_rounded))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 35),
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child:
                        Image.asset("assets/images/headphone1.png", height: 70),
                  ),
                  //////added
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "TMA-2 Comfort Wireless ",
                            style: Styles.textStyle16,
                          ),
                          const Text(
                            "USD 270",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xffBABABA),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                child: Text("1"),
                              ),
                              GestureDetector(
                                child: Container(
                                  //  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: const Color(0xffBABABA),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                              ),
                              // Spacer(flex: 1),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      //Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline_rounded)),
                      )
                    ],
                  ),
                  // Spacer(),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.delete_outline_rounded))
                ],
              ),
            ),
          ),
          Spacer(),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Row(
              children: [
                Text(
                  "Total 2 Items",
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  "USD 295",
                  style: Styles.textStyle16,
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
      floatingActionButton: const CustomFloatingButton(
        text: "Proceed to Checkout ",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
