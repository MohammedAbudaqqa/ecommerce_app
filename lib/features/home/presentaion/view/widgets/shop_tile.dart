import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    super.key,
    required this.function,
    required this.text,
    required this.isSelected,
  });
  final Function() function;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : Colors.white,
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Center(
              child: Text(
                text,
                style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.normal,
                    color: isSelected ? Colors.white : Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
