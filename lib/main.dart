import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_project/cubits/notes/notes_cubit.dart';
import 'package:notes_project/models/note_model.dart';
import 'package:notes_project/simple_bloc_observer.dart';
import 'package:notes_project/views/notes_view.dart';
import 'constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);  
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark , fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      
      ),
    );
  }
}