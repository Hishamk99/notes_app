import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/cubits/notes/notes_cubit.dart';
import 'package:notes_project/models/note_model.dart';
import 'package:notes_project/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key , required this.noteItem});
  final NoteModel noteItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: noteItem);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(noteItem.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title:  Text(
              noteItem.title,
              style: const TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                noteItem.subTitle,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 18,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                noteItem.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              noteItem.date,
              style:
                  TextStyle(color: Colors.black.withOpacity(.4), fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
