import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit_cubit.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../model/note_model.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel noteModel;

  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController des = TextEditingController();
  EditNoteView({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    title.text = noteModel.title;
    des.text = noteModel.description;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(
              onPressed: () {
                noteModel.title= title.text;
                noteModel.description= des.text;
                noteModel.save();
                BlocProvider.of<NoteCubitCubit>(context).featchAllNotes();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
