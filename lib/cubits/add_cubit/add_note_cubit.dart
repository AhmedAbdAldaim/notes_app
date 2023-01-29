import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/model/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();

  final TextEditingController des = TextEditingController();
  
  addNote(NoteModel noteModel) {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<NoteModel>('notes');
      box.add(noteModel);
      emit(AddNoteSuccess());
    }on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
