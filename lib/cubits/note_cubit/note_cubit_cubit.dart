import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/model/note_model.dart';

part 'note_cubit_state.dart';

class NoteCubitCubit extends Cubit<NoteCubitState> {
  NoteCubitCubit() : super(NoteCubitInitial());

  featchAllNotes() {
    
      var box = Hive.box<NoteModel>('notes');
      List<NoteModel> notes = box.values.toList();
      emit(NoteSuccess(notes));
  
  }
}
