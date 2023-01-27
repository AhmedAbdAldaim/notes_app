import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CustomBottom({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)));
  }
}
