import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/style.dart';

class DetailsBar extends StatelessWidget {
  const DetailsBar({
    super.key,
    required this.text,
    this.function,
    required this.isSelected,
  });
  final String text;
  final void Function()? function;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
          padding: EdgeInsets.only(right: 34),
          child: Column(
            children: [
              Text(
                text,
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? kPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 5,
                  width: 24,
                ),
              )
            ],
          )),
    );
  }
}
