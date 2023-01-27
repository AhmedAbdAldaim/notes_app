import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          
          const SizedBox(
            height: 20,
          ),
          const CustomTextField(
            hint: 'title',
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextField(
            hint: 'description',
            maxLines: 3,
          ),
          CustomBottom(
            title: 'add',
            onPressed: () {},
          )
        
        ],
      ),
    );
  }
}
