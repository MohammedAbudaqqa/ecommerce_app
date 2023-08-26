import 'package:flutter/material.dart';

import '../utils/style.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() function;
  const CustomButton({
    required this.function,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: function,
        child: Text(
          buttonText,
          style: Styles.textStyle16,
        ),
      ),
    );
  }
}
