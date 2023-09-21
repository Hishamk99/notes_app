import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:notes_project/models/note_model.dart';
part 'add_notes_state.dart';

class NotesCubit extends Cubit<NotesState>
{
  NotesCubit() :super(NotesInitial());
  addNote(NoteModel note){}
}
