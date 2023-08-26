import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/product_tile.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text("Search"),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchField(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Lastest Search",
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_sharp,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "TMA2 Wireless",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_sharp,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cable",
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        const Icon(Icons.close),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Popular product",
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return const ProductTile();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
