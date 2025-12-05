import 'package:flutter/material.dart';

class CtgRoundedWidget extends StatelessWidget {
  const CtgRoundedWidget({super.key, required this.image, required this.name});

  final String image, name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 50, width: 50),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
