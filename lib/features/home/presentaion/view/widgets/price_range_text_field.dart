import 'package:flutter/material.dart';

class PriceRangeFormField extends StatelessWidget {
  const PriceRangeFormField({
    super.key,
    required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.35,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
