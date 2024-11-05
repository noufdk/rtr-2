import 'package:flutter/material.dart';

class ButtonPractise extends StatelessWidget {
  const ButtonPractise({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(title));
  }
}
