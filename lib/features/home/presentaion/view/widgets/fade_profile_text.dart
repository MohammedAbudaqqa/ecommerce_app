import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class FadeProfileText extends StatelessWidget {
  const FadeProfileText({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          text,
          style: Styles.textStyle14
              .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
