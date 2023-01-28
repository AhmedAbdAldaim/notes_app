import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController des = TextEditingController();
  AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
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
                maxLines: 3,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'empty';
                  }
                },
              ),
              CustomBottom(
                title: 'add',
                onPressed: () {
                  if (formkey.currentState!.validate()) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
