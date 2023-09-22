import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import 'package:meta/meta.dart';
import 'package:notes_project/constants.dart';
import 'package:notes_project/models/note_model.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(NotesInitial());
  addNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      emit(NotesSuccess());
      await noteBox.add(note);
    } catch (e) {
      NotesFailure(e.toString());
    }
  }
}
