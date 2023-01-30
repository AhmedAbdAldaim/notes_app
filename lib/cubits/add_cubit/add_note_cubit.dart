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
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  int cureentindex = 0;
  bool isSelect = false;
  selected(index) {
    cureentindex = index;
    isSelect = true;
    emit(SelectedColor());
  }

  List<Color> colors = const [
    Color(0xffC1A5A9),
    Color(0xffC1A419),
    Color(0xff9A4C95),
    Color(0xff1D1A31),
    Color(0xff454255),
    Color(0xff0F5053),
    Color(0xff16530F),
    Color(0xff530F2E),
  ];
}
