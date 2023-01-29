part of 'note_cubit_cubit.dart';

@immutable
abstract class NoteCubitState {}

class NoteCubitInitial extends NoteCubitState {}


class NoteSuccess extends NoteCubitState {
  final List<NoteModel> notes;
  NoteSuccess(this.notes);
}


