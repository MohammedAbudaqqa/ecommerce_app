import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String hintText;

  final IconData prefixIcon;
  final bool isObscure;
  String? Function(String?)? validator;
  TextEditingController? controller;
  CustomTextFormField(
      {super.key,
      this.controller,
      this.validator,
      required this.hintText,
      required this.prefixIcon,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
        filled: true,
        hintText: hintText,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
