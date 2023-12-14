import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/cubits/notes/notes_cubit.dart';
import 'package:notes_project/models/note_model.dart';
import 'package:notes_project/widgets/custum_text_field.dart';
import 'package:notes_project/widgets/edit_note_color_list.dart';

import 'cutom_app_bar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title; 
              widget.note.subTitle = content ?? widget.note.subTitle; 
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextField(
            hint: widget.note.title,
            onChange: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLines: 5,
            onChange: (value) {
              content = value;
            },
          ),
          const SizedBox(height: 32),
          EditNoteColorsList(note: widget.note,),
        ],
      ),
    );
  }
}




