import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:notes_project/widgets/add_note_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteButtomSheet extends StatefulWidget {
  const AddNoteButtomSheet({super.key});

  @override
  State<AddNoteButtomSheet> createState() => _AddNoteButtomSheetState();
}

class _AddNoteButtomSheetState extends State<AddNoteButtomSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNotesCubit , AddNotesState>(  
          listener: (context , state){
            if(state is NotesFailure)
            {
              print('Failed ${state.errorMessage}') ;
            }
            if(state is NotesSuccess)
            {
              Navigator.pop(context);              
            }
          },
          builder:(context , state)
          {
            return ModalProgressHUD(
              inAsyncCall: state is NotesLoading? true : false,
              child: const SingleChildScrollView(child:  AddNoteForm())
              );
          }
          ),
      ),
    );
  }
}

