import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit_cubit.dart';
import 'package:notes_app/views/add_note_bottomsheet.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubitCubit, NoteCubitState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                builder: (context) {
                  return const AddNoteBottomSheet();
                },
              );
            },
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                 const CustomAppBar(),
                Expanded(
                  child: state is NoteSuccess? ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomNoteItem(noteModel: state.notes[index]),
                      );
                    },
                  ):const CircularProgressIndicator.adaptive()
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
