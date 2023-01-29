import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool? isLoading;
  const CustomBottom({super.key, required this.title, required this.onPressed, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child:isLoading!=null? const SizedBox(
          height: 20,
          width: 20,
          child:  CircularProgressIndicator.adaptive()): ElevatedButton(onPressed: onPressed, child: Text(title)));
  }
}
