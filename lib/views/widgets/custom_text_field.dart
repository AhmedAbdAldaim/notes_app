import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int? maxLines;
  const CustomTextField({super.key, required this.hint, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
      ),
      maxLines: maxLines,
    );
  }
}
