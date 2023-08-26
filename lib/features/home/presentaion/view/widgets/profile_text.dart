import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class ProfileText extends StatelessWidget {
  const ProfileText({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              text,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
