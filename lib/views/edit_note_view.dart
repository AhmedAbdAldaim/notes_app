import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController des = TextEditingController();
  EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children:  [
               const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: title,
                  hint: 'title',
                  validator: (val) {
                  if (val!.isEmpty) {
                    return 'empty';
                  }
                },
                ),
               const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: des,
                  hint: 'description',
                  maxLines: 5,
                  validator: (val) {
                  if (val!.isEmpty) {
                    return 'empty';
                  }
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
