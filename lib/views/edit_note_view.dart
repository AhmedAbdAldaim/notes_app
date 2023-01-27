import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hint: 'title',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'description',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
