import 'package:ecommerce_audio/core/utils/style.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 50,
        width: double.maxFinite,
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
