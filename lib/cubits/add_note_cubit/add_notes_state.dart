part of 'add_notes_cubit.dart';

@immutable 
abstract class AddNotesState {}
class NotesInitial extends AddNotesState {}
class NotesLoading extends AddNotesState {}
class NotesSuccess extends AddNotesState {}
class NotesFailure extends AddNotesState {
  final String errorMessage;

  NotesFailure(this.errorMessage);
}