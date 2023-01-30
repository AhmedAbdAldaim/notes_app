import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../../cubits/note_cubit/note_cubit_cubit.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel noteModel;
  const CustomNoteItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(noteModel: noteModel,);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color:  Color(noteModel.color),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                noteModel.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle: Text(
                noteModel.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteModel.delete();
                   BlocProvider.of<NoteCubitCubit>(context).featchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              noteModel.date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            )
          ],
        ),
      ),
    );
  }
}
