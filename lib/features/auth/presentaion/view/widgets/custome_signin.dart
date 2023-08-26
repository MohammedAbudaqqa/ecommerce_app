import 'package:flutter/material.dart';

class CustomSignin extends StatelessWidget {
  const CustomSignin({
    super.key,
    required this.function,
    /* required this.icon*/
  });
  final Function()? function;
  // final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 52,
        width: 52,
        child: Image.asset("assets/icons/googleIcon.png"),
      ),
    );
  }
}
