import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_project/constants.dart';
import 'package:notes_project/models/note_model.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(NotesInitial());
  addNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
