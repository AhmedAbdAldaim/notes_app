import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)?  validator;
  const CustomTextField({super.key, required this.controller ,required this.validator, required this.hint, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
