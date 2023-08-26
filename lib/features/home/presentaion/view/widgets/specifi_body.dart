import 'package:flutter/material.dart';

class SpecifiBody extends StatelessWidget {
  const SpecifiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      child: const Center(
        child: Text(
          "Comming Soon ...",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
